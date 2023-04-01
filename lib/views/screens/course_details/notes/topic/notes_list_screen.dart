import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zicops/views/widgets/notes_item.dart';

class NotesListScreen extends StatefulWidget {
  bool isGridView;
  List notes;

  NotesListScreen(this.isGridView, this.notes, {Key? key}) : super(key: key);
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
    print(widget.notes);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      margin: EdgeInsets.only(top: 20.sp),
      child: widget.notes.isNotEmpty
          ? widget.isGridView
              ? MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.sp,
                  crossAxisSpacing: 8.sp,
                  itemCount: widget.notes.length,
                  itemBuilder: (context, index) {
                    // return NoteItem("Note ${index + 1}", notesItemList[index][1]);
                    return NoteItem("Note ${index + 1}",
                        widget.notes[index]['details'], widget.notes[index]);
                  })
              : ListView(
                  children: [
                    ...widget.notes.mapIndexed((index, item) => Column(
                          children: [
                            //  NoteItem("Note ${index + 1}", item[1]),
                            NoteItem(
                                "Note ${index + 1}",
                                widget.notes[index]['details'],
                                widget.notes[index]),
                            SizedBox(
                              height: 8.sp,
                            )
                          ],
                        ))
                  ],
                )
          : Center(
              child: Text(
                "No Notes Present",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
