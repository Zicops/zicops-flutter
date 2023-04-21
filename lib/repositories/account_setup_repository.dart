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

  Future getSelectedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String? lspId = sharedPreferences.getString('lspId');
    String? userLspId = sharedPreferences.getString('userLspId');

    // Query to get selected preferences
    final selectedPreferencesResult = await userClient.client()?.execute(
        GetUserPreferencesQuery(
            variables: GetUserPreferencesArguments(userId: userId!)));
    final allSubCat = await getAllSubCatMain();
    List<String> selectedPreferences = [];
    List<Category> testSelectedPreferences = [];
    String baseCategory = '';
    // For isBase = true
    for (int i
        in selectedPreferencesResult?.data?.getUserPreferences!.asMap().keys ??
            []) {
      if (selectedPreferencesResult?.data?.getUserPreferences![i]?.isBase ==
          true) {
        baseCategory = selectedPreferencesResult
                ?.data?.getUserPreferences![i]?.subCategory ??
            '';
        break;
      }
    }
    for (int i = 0; i < selectedPreferences.length; i++) {
      print(selectedPreferences[i]);
    }
    // For all selected preferences
    for (int i
        in selectedPreferencesResult?.data?.getUserPreferences!.asMap().keys ??
            []) {
      if (selectedPreferencesResult?.data?.getUserPreferences![i]?.isBase ==
          false) {
        selectedPreferences.add(selectedPreferencesResult
                ?.data?.getUserPreferences![i]?.subCategory ??
            '');
      }
    }
    for (int i = 0; i < selectedPreferences.length; i++) {
      for (int j = 0; j < allSubCat.length; j++) {
        if (selectedPreferences[i] == allSubCat[j].category) {
          testSelectedPreferences.add(allSubCat[j]);
        }
      }
    }
    print(selectedPreferences.length);
    return [testSelectedPreferences, baseCategory];
  }
}
