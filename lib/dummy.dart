import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zicops/models/user/user_model.dart';
import 'package:zicops/repo/user_repository.dart';

import 'blocs/app_events.dart';
import 'blocs/app_states.dart';
import 'blocs/blocs.dart';

class Dummy extends StatelessWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(UserRepository()),
        ),
      ],
      child: Scaffold(body: blocBody()),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => UserBloc(
        UserRepository(),
      )..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                        title: Text(
                          '${userList[index].firstName}  ${userList[index].lastName}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '${userList[index].email}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                });
          }

          return Container();
        },
      ),
    );
  }
}

// class AllCatMainRepository {
//   Future<List<AllCatMainModel>> getAllCatMain() async {
//     final allCatMainResult = await userClient.client()?.execute(
//           AllCatMainQuery(
//             variables: AllCatMainArguments(
//               lsp_ids: ['8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1'],
//             ),
//           ),
//         );
//     List<AllCatMainModel> allCatMain = [];
//     for (int i in allCatMainResult?.data?.allCatMain!.asMap().keys ?? []) {
//       allCatMain.add(
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
//     }
//     return allCatMain;
//   }
// }
//
// class AllCatSubRepository {
//   Future<List<SubCatMainModel>> getAllCatSub() async {
//     final allCatSubResult = await courseQClient.client()?.execute(
//           AllSubCatMainQuery(
//             variables: AllSubCatMainArguments(
//               lsp_ids: ['8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1'],
//             ),
//           ),
//         );
//     List<SubCatMainModel> subCatMain = [];
//     for (int i in allCatSubResult?.data?.allSubCatMain!.asMap().keys ?? []) {
//       subCatMain.add(
//         SubCatMainModel(
//           allCatSubResult?.data?.allSubCatMain![i]?.catId,
//           allCatSubResult?.data?.allSubCatMain![i]?.id,
//           allCatSubResult?.data?.allSubCatMain![i]?.name,
//           allCatSubResult?.data?.allSubCatMain![i]?.description,
//           allCatSubResult?.data?.allSubCatMain![i]?.imageUrl,
//           allCatSubResult?.data?.allSubCatMain![i]?.code,
//           allCatSubResult?.data?.allSubCatMain![i]?.createdAt,
//           allCatSubResult?.data?.allSubCatMain![i]?.updatedAt,
//           allCatSubResult?.data?.allSubCatMain![i]?.isActive,
//         ),
//       );
//     }
//
//     return subCatMain;
//   }
// }
//
// class GetOrgDetailsRepository {
//   Future<List<UserOrganizationModel>> getOrgDetails() async {
//     final orgResuts = await userClient.client()?.execute(
//           GetUserOrganizationsQuery(
//             variables: GetUserOrganizationsArguments(
//                 userId: 'YW5zaGpvc2hpMDYwN0BnbWFpbC5jb20='),
//           ),
//         );
//
//     List<UserOrganizationModel> userOrgDetails = [];
//     for (int i in orgResuts?.data?.getUserOrganizations!.asMap().keys ?? []) {
//       userOrgDetails.add(
//         UserOrganizationModel(
//           orgResuts?.data?.getUserOrganizations![i]?.userOrganizationId,
//           orgResuts?.data?.getUserOrganizations![i]?.userId,
//           orgResuts?.data?.getUserOrganizations![i]?.userLspId,
//           orgResuts?.data?.getUserOrganizations![i]?.organizationId,
//           orgResuts?.data?.getUserOrganizations![i]?.organizationRole,
//           orgResuts?.data?.getUserOrganizations![i]?.isActive,
//           orgResuts?.data?.getUserOrganizations![i]?.employeeId,
//         ),
//       );
//     }
//
//     return userOrgDetails;
//   }
// }

// userDetails.add(
//   result?.data?.login != null
//       ? UserModel(
//           result?.data?.login?.id ?? '',
//           result?.data?.login?.firstName ?? '',
//           result?.data?.login?.lastName ?? '',
//           result?.data?.login?.status ?? '',
//           result?.data?.login?.role ?? '',
//           result?.data?.login?.isVerified ?? false,
//           result?.data?.login?.isActive ?? false,
//           result?.data?.login?.gender ?? '',
//           result?.data?.login?.email ?? '',
//           result?.data?.login?.phone ?? '',
//           result?.data?.login?.photoUrl ?? '',
//         )
//       : UserModel(
//           '',
//           '',
//           '',
//           '',
//           '',
//           false,
//           false,
//           '',
//           '',
//           '',
//           '',
//         ),
// );
