// import 'package:zicops/models/user/user_model.dart';
//
// import '../../graphql_api.graphql.dart';
// import '../../main.dart';
//
// class UserDetails {
//   Future<List<UserDetailsModel>> getUserDetails() async {
//     final result = await userClient.client()?.execute(LoginMutation());
//     List<UserDetailsModel> userDetails = [];
//     //print(result?.data?.login?.firstName);
//     userDetails.add(
//       result?.data?.login != null
//           ? UserDetailsModel(
//               result?.data?.login?.id ?? "",
//               result?.data?.login?.firstName ?? "",
//               result?.data?.login?.lastName ?? "",
//               result?.data?.login?.email ?? "",
//               result?.data?.login?.phone ?? "",
//             )
//           : UserDetailsModel(
//               "",
//               "",
//               "",
//               "",
//               "",
//             ),
//     );
//
//     return userDetails;
//   }
// }
