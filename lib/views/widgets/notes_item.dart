import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';

import '../screens/course_details/notes/new_note/new_note_screen.dart';

class NoteItem extends StatefulWidget {
  String title;
  String note;

  NoteItem(this.title, this.note, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _NoteItem();
  }
}

class _NoteItem extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewNoteScreen(widget.title, widget.note)));
            },
            behavior: HitTestBehavior.translucent,
            child: Material(
                clipBehavior: Clip.antiAlias,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                      16.sp,
                    ),
                  ),
                ),
                child: Container(
                    width: width,
                    padding: EdgeInsets.only(top: 4.sp),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [primaryColor, gradientTwo],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(
                            16.sp,
                          ),
                        ),
                      ),
                      child: Container(
                        color: secondaryColor,
                        padding: EdgeInsets.only(
                            left: 12.sp,
                            right: 12.sp,
                            top: 10.sp,
                            bottom: 16.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textPrimary,
                                  height: 1.5),
                            ),
                            SizedBox(
                              height: 8.sp,
                            ),
                            Text(widget.note,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: textGrey2,
                                    height: 1.43))
                          ],
                        ),
                      ),
                    )))),
        Positioned(
            bottom: 0,
            right: 0.sp,
            child: Container(
                width: 16.sp,
                height: 16.sp,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/corner.png",
                  width: 16.sp,
                  height: 16.sp,
                )))
      ],
    );
  }
}
