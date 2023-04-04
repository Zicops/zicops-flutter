import 'package:shared_preferences/shared_preferences.dart';

import '../graphql_api.graphql.dart';
import '../main.dart';
import '../models/org_model.dart';
import '../models/user/user_lsp_map.dart';
import '../models/user_model.dart';

class AccountSetupRepository {
  Future getUserLsp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userId = sharedPreferences.getString('userId');
    final lspResult = await userClient.client()?.execute(
        GetUserLspsQuery(variables: GetUserLspsArguments(userId: userId!)));
    List<UserLspMap> userLspMap = [];
    for (var item in lspResult?.data?.getUserLsps ?? []) {
      userLspMap.add(UserLspMap.fromJson(item.toJson()));
    }
    return userLspMap;
  }

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
  //
  // Future getPrefDetails() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? userId = sharedPreferences.getString('userId');
  //   String? lspId = sharedPreferences.getString('lspId');
  //   String? userLspId = sharedPreferences.getString('userLspId');
  //
  //   //All Cat Details
  //
  //   final allCatMainResult = await courseQClient.client()?.execute(
  //       AllCatMainQuery(
  //           variables: AllCatMainArguments(
  //               lsp_ids: ['8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1'])));
  //
  //   for (int i in allCatMainResult?.data?.allCatMain!.asMap().keys ?? []) {
  //       catMainList.add(
  //         AllCatMainModel(
  //           allCatMainResult?.data?.allCatMain![i]?.id,
  //           allCatMainResult?.data?.allCatMain![i]?.name,
  //           allCatMainResult?.data?.allCatMain![i]?.description,
  //           allCatMainResult?.data?.allCatMain![i]?.imageUrl,
  //           allCatMainResult?.data?.allCatMain![i]?.code,
  //           allCatMainResult?.data?.allCatMain![i]?.createdAt,
  //           allCatMainResult?.data?.allCatMain![i]?.updatedAt,
  //           allCatMainResult?.data?.allCatMain![i]?.isActive,
  //         ),
  //       );
  //
  //     i++;
  //   }
  //   for (int i = 0; i < catMainList.length; i++) {
  //     categories.add(
  //       Category(
  //         catMainList[i].id!,
  //         catMainList[i].name!,
  //         i.toString(),
  //       ),
  //     );
  //   }
  //   print(categories.length);
  //
  //   final subCatMainResult = await courseQClient.client()?.execute(
  //       AllSubCatMainQuery(
  //           variables: AllSubCatMainArguments(
  //               lsp_ids: ['8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1'])));
  //   for (int i in subCatMainResult?.data?.allSubCatMain!.asMap().keys ?? []) {
  //     setState(() {
  //       subCatMainList.add(
  //         SubCatMainModel(
  //           subCatMainResult?.data?.allSubCatMain![i]?.catId,
  //           subCatMainResult?.data?.allSubCatMain![i]?.id,
  //           subCatMainResult?.data?.allSubCatMain![i]?.name,
  //           subCatMainResult?.data?.allSubCatMain![i]?.description,
  //           subCatMainResult?.data?.allSubCatMain![i]?.imageUrl,
  //           subCatMainResult?.data?.allSubCatMain![i]?.code,
  //           subCatMainResult?.data?.allSubCatMain![i]?.createdAt,
  //           subCatMainResult?.data?.allSubCatMain![i]?.updatedAt,
  //           subCatMainResult?.data?.allSubCatMain![i]?.isActive,
  //         ),
  //       );
  //     });
  //     i++;
  //   }
  //
  //   for (int i = 0; i < subCatMainList.length; i++) {
  //     subCategories.add(
  //       Category(
  //         i.toString(),
  //         subCatMainList[i].name!,
  //         subCatMainList[i].catId,
  //       ),
  //     );
  //   }
  // }
}
