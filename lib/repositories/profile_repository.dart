import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/graphql_api.graphql.dart';
import 'package:zicops/models/org_model.dart';

import '../main.dart';
import '../models/cohort_details_model.dart';
import '../models/user_model.dart';

class ProfileRepository {
  Future getUserDetails() async {
    final userResult = await userClient.client()?.execute(LoginMutation());
    return UserModel.fromJson(userResult!.data!.login!.toJson());
  }

  Future getOrgDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String? lspId = sharedPreferences.getString('lspId');
    String? userLspId = sharedPreferences.getString('userLspId');

    // Query to get orgId, empId, orgRole
    final getUserOrgDetailsResult = await userClient.client()?.execute(
        GetUserOrgDetailsQuery(
            variables: GetUserOrgDetailsArguments(
                userId: userId!, user_lsp_id: userLspId!)));
    String orgId =
        getUserOrgDetailsResult?.data?.getUserOrgDetails?.organizationId ?? '';
    //Query to get orgName
    final getOrganisationDetailsResult = await userClient.client()?.execute(
        GetOrganizationsQuery(
            variables: GetOrganizationsArguments(org_ids: [orgId])));

    //Query to get lspName
    final getLspDetailsResult = await userClient.client()?.execute(
        GetLearningSpaceDetailsQuery(
            variables: GetLearningSpaceDetailsArguments(lsp_ids: [lspId!])));

    //Query to get lspRole
    final getUserLspRolesResult = await userClient.client()?.execute(
        GetUserLspRolesQuery(
            variables: GetUserLspRolesArguments(
                user_lsp_ids: [userLspId!], user_id: userId!)));

    OrgModel orgDetails = OrgModel(
      orgId: orgId,
      orgName:
          getOrganisationDetailsResult?.data?.getOrganizations?[0]?.name ?? '',
      lspName:
          getLspDetailsResult?.data?.getLearningSpaceDetails?[0]?.name ?? '',
      lspRole: getUserLspRolesResult?.data?.getUserLspRoles?[0]?.role ?? '',
      orgRole:
          getUserOrgDetailsResult?.data?.getUserOrgDetails?.organizationRole ??
              '',
      empId: getUserOrgDetailsResult?.data?.getUserOrgDetails?.employeeId ?? '',
    );

    return orgDetails;
  }

  Future getUserCohortDetails() async {
    // in order to get users cohort we have to first load userCohortMaps and then get their details in next step.
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String? userLspId = sharedPreferences.getString('userLspId');

    List<CohortDetailsModel> cohortDataList = [];

    int publishTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    //1. getUserCohorts gives us the list of userCOhorts by taking following variables: a. user_id , b. user_lsp_id , c. publish_time(current time in epoch unix. kindly check homescreen) , d. pageSize
    //2. extract cohortIds, and role from above and use getCohortDetails query
    final userCohorts = await userClient.client()?.execute(GetUserCohortsQuery(
        variables: GetUserCohortsArguments(
            user_id: userId,
            user_lsp_id: userLspId,
            publish_time: publishTime,
            pageSize: 50,
            pageCursor: '')));

    var userCohortMaps = userCohorts?.data?.getLatestCohorts?.cohorts;

    // print(userCohortMaps?.toList());
    // print("hello");

    // List<Map<String,dynamic>> userCohortData = [];

    for (int i in userCohortMaps?.asMap().keys ?? []) {
      //from userCohortMaps you will get users role in cohort
      var cohortId = userCohortMaps?[i]?.cohortId;
      final cohortDetails = await userClient.client()?.execute(
          GetCohortDetailsQuery(
              variables:
                  GetCohortDetailsArguments(cohort_id: cohortId.toString())));
      // print('cohorts details${cohortDetails?.data}');
      var cohortData = cohortDetails?.data?.getCohortDetails?.toJson();
      // print(cohortData);
      cohortDataList.add(CohortDetailsModel(
        cohortId: cohortId.toString(),
        name: cohortDetails?.data?.getCohortDetails?.name,
        role: userCohortMaps?[i]?.role,
        description: cohortDetails?.data?.getCohortDetails?.description,
        imageUrl: cohortDetails?.data?.getCohortDetails?.imageUrl,
      ));

      // cohort details
      //  print(cohortDetails?.data?.getCohortDetails?..toJson());
    }

    return cohortDataList;
  }
}
