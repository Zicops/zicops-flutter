import '../graphql_api.graphql.dart';
import '../main.dart';
import '../models/user/user_account_profile_pref.dart';
import '../models/user/user_details_model.dart';

class UserRepository {
  Future<List<UserDetailsModel>> getUserDetails() async {
    final result = await userClient.client()?.execute(LoginMutation());
    // final resultJson = result?.data?.toJson();
    // final details = resultJson?['login'];

    List<UserDetailsModel> userDetails = [];

    // final userDetailsModel = UserDetailsModel.fromJson(details);

    //userDetails.add(userDetailsModel);

    // final List result = jsonDecode()['data'];

    userDetails.add(
      result?.data?.login != null
          ? UserDetailsModel(
              result?.data?.login?.id ?? "",
              result?.data?.login?.firstName ?? "",
              result?.data?.login?.lastName ?? "",
              result?.data?.login?.email ?? "",
              result?.data?.login?.phone ?? "",
            )
          : UserDetailsModel(
              "",
              "",
              "",
              "",
              "",
            ),
    );

    return userDetails;
  }
}

class AllCatMainRepository {
  Future<List<AllCatMainModel>> getAllCatMain() async {
    final allCatMainResult = await userClient.client()?.execute(
          AllCatMainQuery(
            variables: AllCatMainArguments(
              lsp_ids: ['8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1'],
            ),
          ),
        );
    List<AllCatMainModel> allCatMain = [];
    for (int i in allCatMainResult?.data?.allCatMain!.asMap().keys ?? []) {
      allCatMain.add(
        AllCatMainModel(
          allCatMainResult?.data?.allCatMain![i]?.id,
          allCatMainResult?.data?.allCatMain![i]?.name,
          allCatMainResult?.data?.allCatMain![i]?.description,
          allCatMainResult?.data?.allCatMain![i]?.imageUrl,
          allCatMainResult?.data?.allCatMain![i]?.code,
          allCatMainResult?.data?.allCatMain![i]?.createdAt,
          allCatMainResult?.data?.allCatMain![i]?.updatedAt,
          allCatMainResult?.data?.allCatMain![i]?.isActive,
        ),
      );
    }
    return allCatMain;
  }
}
