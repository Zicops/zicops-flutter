import '../graphql_api.graphql.dart';
import '../main.dart';
import '../models/user/user_account_profile_pref.dart';
import '../models/user/user_details_model.dart';
import '../models/user/user_org_model.dart';

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
              result?.data?.login?.id ?? '',
              result?.data?.login?.firstName ?? '',
              result?.data?.login?.lastName ?? '',
              result?.data?.login?.status ?? '',
              result?.data?.login?.role ?? '',
              result?.data?.login?.isVerified ?? false,
              result?.data?.login?.isActive ?? false,
              result?.data?.login?.gender ?? '',
              result?.data?.login?.email ?? '',
              result?.data?.login?.phone ?? '',
              result?.data?.login?.photoUrl ?? '',

              //result?.data?.login?.id ?? "",
              //result?.data?.login?.firstName ?? "",
              //  result?.data?.login?.lastName ?? "",
              //result?.data?.login?.email ?? "",
              //result?.data?.login?.phone ?? "",
            )
          : UserDetailsModel(
              '',
              '',
              '',
              '',
              '',
              false,
              false,
              '',
              '',
              '',
              '',
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

class AllCatSubRepository {
  Future<List<SubCatMainModel>> getAllCatSub() async {
    final allCatSubResult = await courseQClient.client()?.execute(
          AllSubCatMainQuery(
            variables: AllSubCatMainArguments(
              lsp_ids: ['8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1'],
            ),
          ),
        );
    List<SubCatMainModel> subCatMain = [];
    for (int i in allCatSubResult?.data?.allSubCatMain!.asMap().keys ?? []) {
      subCatMain.add(
        SubCatMainModel(
          allCatSubResult?.data?.allSubCatMain![i]?.catId,
          allCatSubResult?.data?.allSubCatMain![i]?.id,
          allCatSubResult?.data?.allSubCatMain![i]?.name,
          allCatSubResult?.data?.allSubCatMain![i]?.description,
          allCatSubResult?.data?.allSubCatMain![i]?.imageUrl,
          allCatSubResult?.data?.allSubCatMain![i]?.code,
          allCatSubResult?.data?.allSubCatMain![i]?.createdAt,
          allCatSubResult?.data?.allSubCatMain![i]?.updatedAt,
          allCatSubResult?.data?.allSubCatMain![i]?.isActive,
        ),
      );
    }

    return subCatMain;
  }
}

class GetOrgDetailsRepository {
  Future<List<UserOrganizationModel>> getOrgDetails() async {
    final orgResuts = await userClient.client()?.execute(
          GetUserOrganizationsQuery(
            variables: GetUserOrganizationsArguments(
                userId: 'YW5zaGpvc2hpMDYwN0BnbWFpbC5jb20='),
          ),
        );

    List<UserOrganizationModel> userOrgDetails = [];
    for (int i in orgResuts?.data?.getUserOrganizations!.asMap().keys ?? []) {
      userOrgDetails.add(
        UserOrganizationModel(
          orgResuts?.data?.getUserOrganizations![i]?.userOrganizationId,
          orgResuts?.data?.getUserOrganizations![i]?.userId,
          orgResuts?.data?.getUserOrganizations![i]?.userLspId,
          orgResuts?.data?.getUserOrganizations![i]?.organizationId,
          orgResuts?.data?.getUserOrganizations![i]?.organizationRole,
          orgResuts?.data?.getUserOrganizations![i]?.isActive,
          orgResuts?.data?.getUserOrganizations![i]?.employeeId,
          orgResuts?.data?.getUserOrganizations![i]?.createdBy,
          orgResuts?.data?.getUserOrganizations![i]?.updatedBy,
          orgResuts?.data?.getUserOrganizations![i]?.createdAt,
          orgResuts?.data?.getUserOrganizations![i]?.updatedAt,
        ),
      );
    }

    return userOrgDetails;
  }
}
