import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zicops/blocs/course/course_bloc.dart';
import 'package:zicops/repositories/course_repository.dart';
import 'package:zicops/views/screens/course_details/notes/topic/notes_topic_screen.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/modules_dropdown.dart';

class NotesScreen extends StatefulWidget {
  final String courseId;
  const NotesScreen({Key? key, required this.courseId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotesScreen();
  }
}

class _NotesScreen extends State<NotesScreen> {
  // Future loadUserNotesAndBookmark() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   // this is the function to get user notes and bookmarks. Notes that this will only be called when course is assigned to the user.
  //   // this query need user id, user_lsp_id, current epoch time in unix,pagecursor etc and returns there notes and bookmarks if any present.
  //   String? userId = prefs.getString('userId');
  //   String? userLspId = prefs.getString('userLspId');
  //   int publishTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  //   // this is the course id which we have clicked on
  //   String courseId = "da5c2348-62ef-4725-838a-c1c23170b1bc";
  //   final res = await userClient.client()?.execute(GetUserNotesBookmarksQuery(
  //       variables: GetUserNotesBookmarksArguments(
  //           user_id: userId!,
  //           user_lsp_id: userLspId,
  //           publish_time: publishTime,
  //           pageCursor: '',
  //           pageSize: 25,
  //           course_id: courseId)));
  //
  //   print(res?.data?.toJson());
  //   // this is basically map containing getUserNotes and getUserBookmarks keys from which you will get users notes and book marks.
  //   return res?.data?.toJson();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadUserNotesAndBookmark();
  }

  Widget folder(String label, String totalFiles, String totalBookmark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
                width: 150.sp,
                height: 100.sp,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/folder.png",
                  fit: BoxFit.fill,
                )),
            Positioned(
                left: 16.sp,
                bottom: 28.sp,
                child: Padding(
                    padding: EdgeInsets.only(right: 12.sp),
                    child: Text(
                      totalFiles,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12.sp, color: textPrimary, height: 1.33),
                    ))),
            Positioned(
                left: 16.sp,
                bottom: 12.sp,
                child: Padding(
                    padding: EdgeInsets.only(right: 12.sp),
                    child: Text(
                      totalBookmark,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12.sp, color: textPrimary, height: 1.33),
                    )))
          ],
        ),
        SizedBox(
          height: 7.sp,
        ),
        Container(
            height: 20.sp,
            padding: EdgeInsets.only(left: 16.sp),
            alignment: Alignment.centerLeft,
            child: Text(label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: textPrimary)))
      ],
    );
  }

  List dummy = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc(courseRepository: CourseRepository())
        ..add(NotesAndBookmarkRequested(courseId: widget.courseId)),
      child: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          print(state);
          if (state is NotesAndBookmarkLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is NotesAndBookmarkLoaded) {
            if (state.notesAndBookmarkData["getUserNotes"] == null &&
                state.notesAndBookmarkData["getUserBookmarks"] == null) {
              return Center(
                  child: Text(
                "No Notes and Bookmarks",
                style: TextStyle(color: Colors.white),
              ));
            } else {
              return Container(
                padding: EdgeInsets.only(top: 11.sp, right: 20.sp, left: 20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ModulesDropDown(),
                    SizedBox(
                      height: 9.sp,
                    ),
                    Container(
                      height: 24.sp,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 15.sp),
                      child: Text("Topics".toUpperCase(),
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: textGrey2,
                              letterSpacing: 1)),
                    ),
                    Expanded(
                        child: MasonryGridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15.sp,
                            crossAxisSpacing: 20.sp,
                            itemCount: dummy.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NotesTopicScreen(
                                                    "Topic ${dummy[index]}")));
                                  },
                                  child: folder("Topic ${dummy[index]}",
                                      "12 Files", "03 Bookmarks"));
                            }))
                  ],
                ),
              );
            }
          }
          if (state is NotesAndBookmarkError) {
            return Center(child: Text(state.error));
          }
          return Container();
        },
      ),
    );
  }
}
