import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/screens/course_details/notes/new_note/new_note_screen.dart';
import 'package:zicops/views/screens/course_details/notes/topic/bookmark_notes_screen.dart';

import '../../../../../utils/colors.dart';
import '../../../../widgets/main_tab.dart';
import '../../../home/home_screen.dart';
import '../../../search/search_screen.dart';
import 'notes_list_screen.dart';

class NotesTopicScreen extends StatefulWidget {
  String title;
  List notes;
  List bookmarks;
  String preview;

  NotesTopicScreen(this.title, this.notes, this.bookmarks, this.preview,
      {Key? key})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _NotesTopicScreen();
  }
}

class _NotesTopicScreen extends State<NotesTopicScreen> {
  int _selectedTab = 0;
  bool isGridView = false;
  getScreen() {
    switch (_selectedTab) {
      case 0:
        return BookmarkNotesScreen(widget.bookmarks, widget.preview);
      case 1:
        return NotesListScreen(isGridView, widget.notes);
      default:
        return BookmarkNotesScreen(widget.bookmarks, widget.preview);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.sp),
          child: AppBar(
            backgroundColor: secondaryColor,
            elevation: 0,
            leading: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (Navigator.canPop(context)) Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 4.sp, top: 16.sp, bottom: 16.sp, left: 20.sp),
                  child: Image.asset(
                    "assets/images/back_arrow.png",
                    height: 16.sp,
                    width: 16.sp,
                  ),
                )),
            leadingWidth: 40.sp,
            title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: textPrimary),
                  ),
                  Spacer(),
                  _selectedTab == 1
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isGridView = !isGridView;
                            });
                          },
                          child: AnimatedContainer(
                            width: 24.sp,
                            height: 24.sp,
                            alignment: Alignment.center,
                            duration: Duration(milliseconds: 400),
                            child: Image.asset(
                              !isGridView
                                  ? "assets/images/grid_view.png"
                                  : "assets/images/list_view.png",
                              width: 18.sp,
                              height: 18.sp,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    width: 24.sp,
                  ),
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SearchScreen(selectedLanguage)));
                      },
                      child: Container(
                          width: 24.sp,
                          height: 24.sp,
                          margin: EdgeInsets.only(right: 16.sp),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/search.png",
                            width: 18.sp,
                            height: 18.sp,
                            color: textPrimary,
                          ))),
                ]),
          ),
        ),
        backgroundColor: secondaryColorDark,
        floatingActionButton: _selectedTab == 1 && widget.notes.isNotEmpty
            ? GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewNoteScreen(
                              "",
                              "",
                              widget.notes.isNotEmpty
                                  ? widget.notes[0]
                                  : null)));
                },
                child: Container(
                  height: 56.sp,
                  width: 56.sp,
                  margin: EdgeInsets.only(right: 12.sp),
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/add_button.png"),
                ))
            : const SizedBox.shrink(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48.sp,
                color: secondaryColor,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTab = 0;
                        });
                      },
                      child: SizedBox(
                        child: mainTab(180, "Bookmarks", 0, _selectedTab),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 1;
                          });
                        },
                        child: SizedBox(
                          child: mainTab(180, "Notes", 1, _selectedTab),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: getScreen(),
              )
            ]));
  }
}
