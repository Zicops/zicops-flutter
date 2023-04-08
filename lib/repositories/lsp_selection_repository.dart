import 'package:shared_preferences/shared_preferences.dart';

import '../graphql_api.graphql.dart';
import '../main.dart';
import '../models/login/lsp_model.dart';

class LspSelectionRepository {
  // Function to get list of LSPs for the user
  Future getUserLspList() async {
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

  // Function to get LSP details for a particular LSP
  Future getLspDetails(String lspId) async {
    final lspResult = await userClient.client()?.execute(
        GetLearningSpaceDetailsQuery(
            variables: GetLearningSpaceDetailsArguments(lsp_ids: [lspId])));
    LspData lspData = LspData(
      lspId: lspResult?.data?.getLearningSpaceDetails?.first?.lspId ?? '',
      orgId: lspResult?.data?.getLearningSpaceDetails?.first?.orgId ?? '',
      ouId: lspResult?.data?.getLearningSpaceDetails?.first?.ouId ?? '',
      name: lspResult?.data?.getLearningSpaceDetails?.first?.name ?? '',
      logoUrl: lspResult?.data?.getLearningSpaceDetails?.first?.logoUrl ?? '',
      profileUrl:
          lspResult?.data?.getLearningSpaceDetails?.first?.profileUrl ?? '',
      noUsers: lspResult?.data?.getLearningSpaceDetails?.first?.noUsers ?? 0,
      owners: lspResult?.data?.getLearningSpaceDetails?.first?.owners,
      isDefault:
          lspResult?.data?.getLearningSpaceDetails?.first?.isDefault ?? false,
      status: lspResult?.data?.getLearningSpaceDetails?.first?.status ?? '',
      createdAt:
          lspResult?.data?.getLearningSpaceDetails?.first?.createdAt ?? '',
      updatedAt:
          lspResult?.data?.getLearningSpaceDetails?.first?.updatedAt ?? '',
      createdBy:
          lspResult?.data?.getLearningSpaceDetails?.first?.createdBy ?? '',
      updatedBy:
          lspResult?.data?.getLearningSpaceDetails?.first?.updatedBy ?? '',
    );
    return lspData;
  }

  // Function to list of LSP models that will be in the state LspSelectionNotSelected
  Future getLspModelList() async {
    List<LspModel> lspModelList = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userId = sharedPreferences.getString('userId');
    List<UserLspMap> userLspMap = await getUserLspList();
    for (var item in userLspMap) {
      var lspData = await getLspDetails(item.lspId!);
      LspModel lspModel = LspModel(
        userId: userId!,
        userLspId: item.userLspId!,
        lspId: lspData.lspId,
        orgId: lspData.orgId,
        name: lspData.name,
        logoUrl: lspData.profileUrl,
        status: lspData.status,
      );
      lspModelList.add(lspModel);
    }
    return lspModelList;
  }

  // Function to set the LSP model in the shared preferences
  Future setLspModel({required LspModel lspModel}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('lspId', lspModel.lspId);
    await sharedPreferences.setString('tenant', lspModel.lspId);
    await sharedPreferences.setString('userLspId', lspModel.userLspId);
    await sharedPreferences.setString('orgId', lspModel.orgId);
  }
}
