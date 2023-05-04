import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../graphql_api.graphql.dart';
import '../main.dart';

updateUser(
  String id,
  String firstName,
  String lastName,
  String email,
  String phone,
  String gender,
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
            gender: gender,
            email: email,
            phone: phone,
            Photo: image,
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
  print('userid $userId');
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

addUserPreference(
    String userId, String? userLspId, String? subcategory, bool isBase) async {
  final res = await userClient.client()?.execute(AddUserPreferenceMutation(
          variables: AddUserPreferenceArguments(
        user_id: userId,
        user_lsp_id: userLspId ?? '',
        is_active: true,
        sub_category: subcategory ?? '',
        is_base: isBase,
      )));
  print('$subcategory: $isBase');
  // print(res?.data?.toJson());
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

addUserNotes(String courseId, String moduleId, String topicId, int sequence,
    String details) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? userId = sharedPreferences.getString('userId');
  String? lspId = sharedPreferences.getString('lspId');
  String? userLspId = sharedPreferences.getString('userLspId');

  final res = userClient.client()?.execute(AddUserNotesMutation(
          variables: AddUserNotesArguments(
        user_id: userId!,
        user_lsp_id: userLspId!,
        course_id: courseId,
        module_id: moduleId,
        topic_id: topicId,
        sequence: sequence,
        status: 'active',
        details: details,
        is_active: true,
      )));
  print(res);
  return;
}

addUserBookmarks(String courseId, String moduleId, String topicId, String name,
    String timeStamp, String userCourseId) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? userId = sharedPreferences.getString('userId');
  String? lspId = sharedPreferences.getString('lspId');
  String? userLspId = sharedPreferences.getString('userLspId');

  final res = userClient.client()?.execute(AddUserBookmarkMutation(
          variables: AddUserBookmarkArguments(
        user_id: userId!,
        user_lsp_id: userLspId!,
        course_id: courseId,
        module_id: moduleId,
        topic_id: topicId,
        is_active: true,
        user_course_id: userCourseId,
        name: name,
        time_stamp: timeStamp,
      )));
  return;
}

updateUserBookmarks(String userBmId, String courseId, String moduleId,
    String topicId, String name, String timeStamp, String userCourseId) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? userId = sharedPreferences.getString('userId');
  String? lspId = sharedPreferences.getString('lspId');
  String? userLspId = sharedPreferences.getString('userLspId');
  final res = await userClient.client()?.execute(UpdateUserBookmarkMutation(
          variables: UpdateUserBookmarkArguments(
        user_bm_id: userBmId,
        user_id: userId!,
        user_lsp_id: userLspId!,
        course_id: courseId,
        module_id: moduleId,
        topic_id: topicId,
        name: name,
        user_course_id: userCourseId,
        time_stamp: timeStamp,
        is_active: true,
      )));
  print(res);
  return;
}

updateUserNotes(String userNotesId, String courseId, String moduleId,
    String topicId, int sequence, String details, String status) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? userId = sharedPreferences.getString('userId');
  String? lspId = sharedPreferences.getString('lspId');
  String? userLspId = sharedPreferences.getString('userLspId');
  final res = userClient.client()?.execute(UpdateUserNotesMutation(
          variables: UpdateUserNotesArguments(
        user_notes_id: userNotesId,
        user_id: userId!,
        user_lsp_id: userLspId!,
        course_id: courseId,
        module_id: moduleId,
        topic_id: topicId,
        sequence: 0,
        status: status,
        details: details,
        is_active: true,
      )));
  print(res);
  return;
}

// addUpdateUserCourseMap(String courseId, String userCourseId, String status,
//     String userLspId, String userId) async {
//   final res = await userClient.client()?.execute(UserCourseMapMutation(
//           variables: AddUpdateUserCourseMapArguments(
//         user_id: userId,
//         user_lsp_id: userLspId,
//         course_id: courseId,
//         user_course_id: userCourseId,
//         status: status,
//         is_active: true,
//       )));
//   print(res?.data?.toJson());
//   return;
// }
