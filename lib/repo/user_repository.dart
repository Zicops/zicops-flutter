import '../graphql_api.graphql.dart';
import '../main.dart';
import '../models/user/user_account_profile_pref.dart';
import '../models/user/user_model.dart';
import '../models/user/user_org_model.dart';

class UserRepository {
  Future<List<UserModel>> getUserDetails() async {
    final result = await userClient.client()?.execute(LoginMutation());
    List<UserModel> userDetails = [];
    userDetails.add(
      UserModel(
        result?.data?.login?.id ?? "",
        result?.data?.login?.firstName ?? "",
        result?.data?.login?.lastName ?? "",
        result?.data?.login?.status ?? "",
        result?.data?.login?.role ?? "",
        result?.data?.login?.isVerified ?? false,
        result?.data?.login?.isActive ?? false,
        result?.data?.login?.gender ?? "",
        result?.data?.login?.email ?? "",
        result?.data?.login?.phone ?? "",
        result?.data?.login?.photoUrl ?? "",
      ),
    );
    return userDetails;
  }
}
