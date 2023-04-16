import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../graphql_api.graphql.dart';
import '../main.dart';
import '../models/org_model.dart';
import '../models/user_model.dart';
import '../views/screens/account_setup/models/category.dart';

class AccountSetupRepository {
  Future getPersonalDetails() async {
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
    String userOrgId =
        getUserOrgDetailsResult?.data?.getUserOrgDetails?.userOrganizationId ??
            '';
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
      userId: userId ?? '',
      userLspId: userLspId ?? '',
      orgId: orgId,
      userOrgId: userOrgId ?? '',
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

  Future getAllCatMain() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String? lspId = sharedPreferences.getString('lspId');
    String? userLspId = sharedPreferences.getString('userLspId');

    // Query to get all categories
    final allCatMainResult = await courseQClient.client()?.execute(
        AllCatMainQuery(variables: AllCatMainArguments(lsp_ids: [lspId])));
    List<Category> allCatMain = [];
    for (int i in allCatMainResult?.data?.allCatMain!.asMap().keys ?? []) {
      allCatMain.add(Category(
        i,
        allCatMainResult?.data?.allCatMain![i]?.name ?? '',
        allCatMainResult?.data?.allCatMain![i]?.id ?? '',
      ));
    }
    return allCatMain;
  }

  Future getAllSubCatMain() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String? lspId = sharedPreferences.getString('lspId');
    String? userLspId = sharedPreferences.getString('userLspId');

    // Query to get all sub categories
    final subCatMainResult = await courseQClient.client()?.execute(
        AllSubCatMainQuery(
            variables: AllSubCatMainArguments(lsp_ids: [lspId])));
    List<Category> subCatMain = [];
    for (int i in subCatMainResult?.data?.allSubCatMain!.asMap().keys ?? []) {
      subCatMain.add(Category(
        i,
        subCatMainResult?.data?.allSubCatMain![i]?.name ?? '',
        subCatMainResult?.data?.allSubCatMain![i]?.catId ?? '',
      ));
    }
    return subCatMain;
  }

  updatePersonalDetails(
    String id,
    String firstName,
    String lastName,
    String email,
    String phone,
    MultipartFile? image,
  ) async {
    final res = await userClient.client()?.execute(
          UpdateUserMutation(
            variables: UpdateUserArguments(
              id: id,
              first_name: firstName,
              last_name: lastName,
              status: "active",
              role: 'learner',
              is_verified: true,
              is_active: true,
              gender: 'male',
              email: email,
              phone: phone,
              Photo: image,
            ),
          ),
        );
    return;
  }
}
