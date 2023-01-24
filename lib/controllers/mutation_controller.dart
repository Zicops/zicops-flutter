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

addUserOrganization() async {
  final res = await userClient.client()?.execute(AddUserOrganizationMapMutation(
          variables: AddUserOrganizationMapArguments(
        user_id: "",
        organization_id: "",
        user_organization_id: '',
        user_lsp_id: '',
        organization_role: '',
        is_active: true,
        employee_id: '',
      )));
  print(res?.data?.toJson());
  return;
}

updateUserOrganizationMap() async {
  final res =
      await userClient.client()?.execute(UpdateUserOrganizationMapMutation(
              variables: UpdateUserOrganizationMapArguments(
            user_id: "",
            organization_id: "",
            user_organization_id: '',
            user_lsp_id: '',
            organization_role: '',
            is_active: true,
            employee_id: '',
          )));
  print(res?.data?.toJson());
  return;
}

addUserPreference() async {
  final res = await userClient.client()?.execute(AddUserPreferenceMutation(
          variables: AddUserPreferenceArguments(
        user_preference_id: '',
        user_id: "",
        user_lsp_id: '',
        is_active: true,
        preference_id: '',
        preference_value: '',
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
