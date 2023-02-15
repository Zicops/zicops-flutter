import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/screens/course_details/notes/new_note/new_note_screen.dart';

import '../../../../../utils/dummies.dart';
import '../../../search/widgets/bookmark_list_item.dart';

class BookmarkNotesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookmarkNotesScreen();
  }
}

class _BookmarkNotesScreen extends State<BookmarkNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: ListView(
        children: [
          SizedBox(
            height: 20.sp,
          ),
          ...courseItems.sublist(0, 2).map((courseItem) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewNoteScreen(
                                "",
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                                showBookmark: true,
                                bookmarkPreview: courseItem["preview"],
                                bookmarkTime: "00:04:57",
                              )));
                },
                child: BookmarkListItem(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                  "04:57",
                  courseItem["preview"],
                  showDivider: true,
                ),
              ))
        ],
      ),
    );
  }
}
