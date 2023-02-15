import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zicops/views/widgets/notes_item.dart';
import 'package:collection/collection.dart';

import '../../../../../utils/dummies.dart';
import '../../../search/widgets/bookmark_list_item.dart';

class NotesListScreen extends StatefulWidget {
  bool isGridView;

  NotesListScreen(this.isGridView, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _NotesListScreen();
  }
}

class _NotesListScreen extends State<NotesListScreen> {
  List<List<String>> notesItemList = [
    [
      "Complete Java Programming - Beginner to Advance",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    ],
    [
      "Complete Java Programming - Beginner to Advance",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    ],
    [
      "Complete Java Programming - Beginner to Advance",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    ],
    [
      "Complete Java Programming - Beginner to Advance",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    ],
    [
      "Complete Java Programming - Beginner to Advance",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    ],
    [
      "Complete Java Programming - Beginner to Advance",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      margin: EdgeInsets.only(top: 20.sp),
      child: widget.isGridView
          ? MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8.sp,
              crossAxisSpacing: 8.sp,
              itemCount: notesItemList.length,
              itemBuilder: (context, index) {
                return NoteItem(
                    "Note ${index + 1}", notesItemList[index][1]);
              })
          : ListView(
              children: [
                ...notesItemList.mapIndexed((index, item) => Column(
                      children: [
                        NoteItem("Note ${index + 1}", item[1]),
                        SizedBox(
                          height: 8.sp,
                        )
                      ],
                    ))
              ],
            ),
    );
  }
}
