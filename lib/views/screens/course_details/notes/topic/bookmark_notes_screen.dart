import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/screens/course_details/notes/new_note/new_note_screen.dart';

import '../../../search/widgets/bookmark_list_item.dart';

class BookmarkNotesScreen extends StatefulWidget {
  List bookmarks;
  String preview;

  BookmarkNotesScreen(this.bookmarks, this.preview, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BookmarkNotesScreen();
  }
}

class _BookmarkNotesScreen extends State<BookmarkNotesScreen> {
  @override
  Widget build(BuildContext context) {
    print("BookmarkNotesScreen: ${widget.bookmarks}");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: widget.bookmarks.isNotEmpty
          ? ListView(
              children: [
                SizedBox(
                  height: 20.sp,
                ),
                ...widget.bookmarks.map((courseItem) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewNoteScreen(
                                      "",
                                      courseItem["name"],
                                      courseItem,
                                      showBookmark: true,
                                      bookmarkPreview: widget.preview,
                                      bookmarkTime: courseItem["time_stamp"],
                                    )));
                      },
                      child: BookmarkListItem(
                        courseItem["name"],
                        courseItem["time_stamp"],
                        widget.preview,
                        showDivider: true,
                      ),
                    ))
              ],
            )
          : Center(
              child: Text(
                "No bookmarks present",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
