import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zicops/blocs/course/course_bloc.dart';
import 'package:zicops/repositories/course_repository.dart';
import 'package:zicops/views/screens/course_details/notes/topic/notes_topic_screen.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/modules_dropdown.dart';
import '../../../widgets/state_error_widget.dart';

class NotesScreen extends StatefulWidget {
  final String courseId;
  final String preview;
  final bool isCourseAssigned;
  const NotesScreen({
    Key? key,
    required this.courseId,
    required this.preview,
    required this.isCourseAssigned,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotesScreen();
  }
}

class _NotesScreen extends State<NotesScreen> {
  String _selectedValue = '';

  void _onDropdownChanged(String newValue) {
    setState(() {
      _selectedValue = newValue;
    });
  }

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
            List dummy = [];
            // dummy = state.notesAndBookmarkData["getUserNotes"] ?? dummy;
            Map<String, String> moduleData = {};
            List dropdownItems = [];
            state.courseModules.forEach((element) {
              dropdownItems.add('Module ${element['sequence']}');
              moduleData['Module ${element['sequence']}'] = element['id'];
            });
            dropdownItems.sort();
            if (_selectedValue == "") {
              _selectedValue = dropdownItems[0];
            }
            List notes = [];
            List bookmarks = [];
            if (state.notesAndBookmarkData["getUserNotes"] != null) {
              notes = state.notesAndBookmarkData["getUserNotes"]['notes'] ?? [];
            }
            if (state.notesAndBookmarkData["getUserBookmarks"] != null) {
              bookmarks = state.notesAndBookmarkData["getUserBookmarks"]
                      ['bookmarks'] ??
                  [];
            }
            List notesInModule = [];
            List bookmarksInModule = [];
            if (notes.isNotEmpty) {
              for (var element in notes) {
                if (element['module_id'] == moduleData[_selectedValue]) {
                  notesInModule.add(element);
                }
              }
            }
            if (bookmarks.isNotEmpty) {
              for (var element in bookmarks) {
                if (element['module_id'] == moduleData[_selectedValue]) {
                  bookmarksInModule.add(element);
                }
              }
            }
            print('notesInModule: $notesInModule');
            print('bookmarksInModule: $bookmarksInModule');

            //Find number of topics in module
            List topics = state.topicData
                .where((element) =>
                    element['moduleId'] == moduleData[_selectedValue])
                .toList();
            for (var i = 0; i < topics.length; i++) {
              dummy.add(i + 1);
            }
            return Container(
              padding: EdgeInsets.only(top: 11.sp, right: 20.sp, left: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ModulesDropDown(
                    onChanged: _onDropdownChanged,
                    dropdownList: dropdownItems,
                  ),
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
                    child: state.topicData
                            .where((element) =>
                                element['moduleId'] ==
                                moduleData[_selectedValue])
                            .isNotEmpty
                        ? MasonryGridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15.sp,
                            crossAxisSpacing: 20.sp,
                            itemCount: topics.length,
                            itemBuilder: (context, index) {
                              List notesInTopic = [];
                              List bookmarksInTopic = [];
                              for (var element in notesInModule) {
                                if (element['topic_id'] ==
                                    topics[index]['topicId']) {
                                  notesInTopic.add(element);
                                }
                              }
                              for (var element in bookmarksInModule) {
                                if (element['topic_id'] ==
                                    topics[index]['topicId']) {
                                  bookmarksInTopic.add(element);
                                }
                              }
                              notesInTopic = notesInTopic.where((element) {
                                return element['status'] != "disable";
                              }).toList();
                              print('notesInTopic: $notesInTopic');
                              print('bookmarksInTopic: $bookmarksInTopic');
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NotesTopicScreen(
                                                  "Topic ${dummy[index]}",
                                                  notesInTopic,
                                                  bookmarksInTopic,
                                                  widget.preview,
                                                )));
                                  },
                                  child: folder(
                                      "Topic ${dummy[index]}",
                                      "${notesInTopic.length} Files",
                                      "${bookmarksInTopic.length} Bookmarks"));
                            },
                          )
                        : Center(
                            child: Text(
                              "No Topics in this Module",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ),
                ],
              ),
            );
          }

          if (state is NotesAndBookmarkError) {
            print(state.error);
            return StateErrorWidget();
          }
          return Container();
        },
      ),
    );
  }
}
