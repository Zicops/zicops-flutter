import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/blocs/profile/profile_bloc.dart';
import 'package:zicops/repositories/profile_repository.dart';
import 'package:zicops/views/screens/profile/widgets/cohort_card.dart';

import '../../../utils/colors.dart';

class CohortTabScreen extends StatefulWidget {
  const CohortTabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CohortTabScreen();
  }
}

class _CohortTabScreen extends State<CohortTabScreen> {
//  final _controller = Get.find<Controller>();
//   Future getUserCohortDetails() async {
//     // in order to get users cohort we have to first load userCohortMaps and then get their details in next step.
//
//     String userId = _controller.userDetails.id.toString();
//     String userLspId = _controller.userDetails.userLspId.toString();
//     int publishTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
//     //1. getUserCohorts gives us the list of userCOhorts by taking following variables: a. user_id , b. user_lsp_id , c. publish_time(current time in epoch unix. kindly check homescreen) , d. pageSize
//     //2. extract cohortIds, and role from above and use getCohortDetails query
//     final userCohorts = await userClient.client()?.execute(GetUserCohortsQuery(
//         variables: GetUserCohortsArguments(
//             user_id: userId,
//             user_lsp_id: userLspId,
//             publish_time: publishTime,
//             pageSize: 50,
//             pageCursor: '')));
//
//     var userCohortMaps = userCohorts?.data?.getLatestCohorts?.cohorts;
//
//     print(userCohortMaps?.toList());
//
//     // List<Map<String,dynamic>> userCohortData = [];
//
//     for (int i in userCohortMaps?.asMap().keys ?? []) {
//       //from userCohortMaps you will get users role in cohort
//       var cohortId = userCohortMaps?[i]?.cohortId;
//       final cohortDetails = await userClient.client()?.execute(
//           GetCohortDetailsQuery(
//               variables:
//                   GetCohortDetailsArguments(cohort_id: cohortId.toString())));
//
//       var cohortData = cohortDetails?.data?.getCohortDetails?.toJson();
//       // cohort details
//       print(cohortDetails?.data?.getCohortDetails?.toJson());
//     }
//   }

  @override
  void initState() {
    super.initState();
    //print('hello');
    // getUserCohortDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BlocProvider(
      create: (context) =>
          ProfileBloc(ProfileRepository())..add(CohortDetailsRequested()),
      child: Container(
          color: secondaryColorDark,
          height: MediaQuery.of(context).size.height * 0.8,
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 13.sp),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is CohortDetailsLoading) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is CohortDetailsError) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is CohortDetailsLoaded) {
                if (state.cohorts.isNotEmpty) {
                  print('cohort data: ${state.cohorts[0].cohortId}');
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "your cohorts".toUpperCase(),
                          style: TextStyle(
                              color: neutral,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              height: 1.33),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        ...state.cohorts.map((e) => Column(
                              children: [
                                CohortCard(
                                  e.name ?? '',
                                  e.description ?? '',
                                  e.role ?? '',
                                  e.imageUrl ?? '',
                                  e.imageUrl ?? '',
                                ),
                                SizedBox(
                                  height: 16.sp,
                                )
                              ],
                            ))
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Center(
                      child: Text(
                        'No Cohorts',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }
                // return Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "your cohorts".toUpperCase(),
                //       style: TextStyle(
                //           color: neutral,
                //           fontSize: 12.sp,
                //           fontWeight: FontWeight.w600,
                //           letterSpacing: 1,
                //           height: 1.33),
                //     ),
                //     SizedBox(
                //       height: 8.sp,
                //     ),
                //     ...state.cohorts.map((e) => Column(
                //           children: [
                //             CohortCard(
                //               e.name!,
                //               e.description!,
                //               e.role!,
                //               e.imageUrl!,
                //               e.imageUrl!,
                //             ),
                //             SizedBox(
                //               height: 16.sp,
                //             )
                //           ],
                //         ))
                //   ],
                // );
              }
              return Container();
            },
          )),
    ));
  }
}
