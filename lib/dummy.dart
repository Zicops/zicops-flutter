// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:zicops/models/user/user_details_model.dart';
// import 'package:zicops/repo/repositories.dart';
//
// import 'blocs/app_events.dart';
// import 'blocs/app_states.dart';
// import 'blocs/blocs.dart';
//
// class Dummy extends StatelessWidget {
//   const Dummy({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<UserBloc>(
//           create: (BuildContext context) => UserBloc(UserRepository()),
//         ),
//       ],
//       child: Scaffold(body: blocBody()),
//     );
//   }
//
//   Widget blocBody() {
//     return BlocProvider(
//       create: (context) => UserBloc(
//         UserRepository(),
//       )..add(LoadUserEvent()),
//       child: BlocBuilder<UserBloc, UserState>(
//         builder: (context, state) {
//           if (state is UserLoadingState) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (state is UserErrorState) {
//             return const Center(child: Text("Error"));
//           }
//           if (state is UserLoadedState) {
//             List<UserDetailsModel> userList = state.users;
//             return ListView.builder(
//                 itemCount: userList.length,
//                 itemBuilder: (_, index) {
//                   return Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//                     child: Card(
//                       color: Theme.of(context).primaryColor,
//                       child: ListTile(
//                         title: Text(
//                           '${userList[index].firstName}  ${userList[index].lastName}',
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                         subtitle: Text(
//                           '${userList[index].email}',
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   );
//                 });
//           }
//
//           return Container();
//         },
//       ),
//     );
//   }
// }
