import '../graphql_api.graphql.dart';
import '../main.dart';

updateUser(String id, String firstNameController, String lastNameController,
    String emailController, String phoneController) async {
  //print(_firstNameController.text);
  final res = await userClient.client()?.execute(
        UpdateUserMutation(
          variables: UpdateUserArguments(
            id: id,
            first_name: firstNameController,
            last_name: lastNameController,
            status: "active",
            role: 'admin',
            is_verified: true,
            is_active: true,
            gender: 'female',
            email: emailController,
            phone: phoneController,
          ),
        ),
      );

  print(res?.data?.toJson());
  return;
}

addUserOrganization(String userId, String orgId, String userLspId,
    String organisationRole, String employeeId) async {
  final res = await userClient.client()?.execute(AddUserOrganizationMapMutation(
          variables: AddUserOrganizationMapArguments(
        user_id: userId,
        organization_id: orgId,
        user_lsp_id: userLspId,
        organization_role: organisationRole,
        is_active: true,
        employee_id: employeeId,
      )));
  print(res?.data?.toJson());
  return;
}

updateUserOrganizationMap(String userId, String orgId, String userOrgId,
    String userLspId, String organisationRole, String employeeId) async {
  final res =
      await userClient.client()?.execute(UpdateUserOrganizationMapMutation(
              variables: UpdateUserOrganizationMapArguments(
            user_id: userId,
            organization_id: orgId,
            user_organization_id: userOrgId,
            user_lsp_id: userLspId,
            organization_role: organisationRole,
            is_active: true,
            employee_id: employeeId,
          )));
  print(res?.data?.toJson());
  return;
}

addUserPreference() async {
  final res = await userClient.client()?.execute(AddUserPreferenceMutation(
          variables: AddUserPreferenceArguments(
        user_id: "",
        user_lsp_id: '',
        is_active: true,
        sub_category: '',
        is_base: false,
      )));
  print(res?.data?.toJson());
  return;
}

updateUserPreference() async {
  final res = await userClient.client()?.execute(UpdateUserPreferenceMutation(
          variables: UpdateUserPreferenceArguments(
        user_preference_id: '',
        user_id: "",
        user_lsp_id: '',
        sub_category: '',
        is_base: true,
        is_active: true,
      )));
  print(res?.data?.toJson());
  return;
}
