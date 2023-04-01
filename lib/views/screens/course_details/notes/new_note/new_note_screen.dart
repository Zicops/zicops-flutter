import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../controllers/mutation_controller.dart';
import '../../../../../utils/colors.dart';

class NewNoteScreen extends StatefulWidget {
  String title;
  String note;
  bool showBookmark;
  String bookmarkPreview;
  String bookmarkTime;
  var courseItem;

  NewNoteScreen(this.title, this.note, this.courseItem,
      {this.showBookmark = false,
      this.bookmarkPreview = "",
      this.bookmarkTime = "",
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewNoteScreen();
  }
}

class _NewNoteScreen extends State<NewNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  late final PanelController _panelController;

  @override
  void initState() {
    if (widget.title.isNotEmpty) {
      titleController.text = widget.title;
    }
    if (widget.note.isNotEmpty) {
      noteController.text = widget.note;
    }
    _panelController = PanelController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("NewNoteScreen: ${widget.courseItem}");
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      print("ontapped");
                      print(widget.showBookmark);
                      widget.showBookmark
                          ?
                          // Only option is update bookmark

                          updateUserBookmarks(
                              widget.courseItem['user_bm_id'],
                              widget.courseItem['course_id'],
                              widget.courseItem['module_id'],
                              widget.courseItem['topic_id'],
                              noteController.text,
                              widget.courseItem['time_stamp'],
                              widget.courseItem['user_course_id'])
                          :
                          // Add new note and update both possible.
                          widget.title.isNotEmpty
                              ? updateUserNotes(
                                  widget.courseItem['user_notes_id'],
                                  widget.courseItem['course_id'],
                                  widget.courseItem['module_id'],
                                  widget.courseItem['topic_id'],
                                  widget.courseItem['sequence'],
                                  noteController.text,
                                  'active',
                                )
                              : print("Note saved");
                    },
                    child: Container(
                      width: 24.sp,
                      height: 24.sp,
                      margin: EdgeInsets.only(right: 16.sp),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.save,
                        size: 24.sp,
                        color: textPrimary,
                      ),
                      // Image.asset(
                      //   "assets/images/delete.png",
                      //   width: 16.sp,
                      //   height: 18.sp,
                      //   color: textPrimary,
                      // ),
                    )),
                widget.showBookmark || widget.title.isEmpty
                    ? Container()
                    : GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          _panelController.open();
                        },
                        child: Container(
                            width: 24.sp,
                            height: 24.sp,
                            margin: EdgeInsets.only(right: 16.sp),
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/delete.png",
                              width: 16.sp,
                              height: 18.sp,
                              color: textPrimary,
                            ))),
              ]),
        ),
      ),
      backgroundColor: secondaryColorDark,
      body: SlidingUpPanel(
          controller: _panelController,
          backdropEnabled: true,
          color: Colors.transparent,
          minHeight: 0,
          maxHeight: 380.sp,
          panel: Container(
              padding:
                  EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 20.sp),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  border: Border.all(color: lightGrey)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 4.sp,
                      width: 36,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 8.sp, bottom: 16.sp),
                      decoration: BoxDecoration(
                          color: secondaryColorDark,
                          borderRadius: BorderRadius.circular(4.sp)),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Container(
                      width: 56.sp,
                      height: 56.sp,
                      alignment: Alignment.center,
                      child:
                          Image.asset("assets/images/trash_with_outline.png"),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Container(
                      height: 24.sp,
                      alignment: Alignment.center,
                      child: Text(
                        "Delete Note?",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: textPrimary),
                      ),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Text(
                      "Are you sure you want to delete the note? If you delete this, you will permanently lose the data.",
                      style: TextStyle(fontSize: 16.sp, color: textGrey2),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    GestureDetector(
                      onTap: () {
                        updateUserNotes(
                          widget.courseItem['user_notes_id'],
                          widget.courseItem['course_id'],
                          widget.courseItem['module_id'],
                          widget.courseItem['topic_id'],
                          widget.courseItem['sequence'],
                          noteController.text,
                          'disable',
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 48.sp,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: delete, width: 1.sp),
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Text(
                          "Delete Note".toUpperCase(),
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: delete,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    GestureDetector(
                        onTap: () {
                          _panelController.close();
                        },
                        child: Container(
                          height: 48.sp,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: lightGrey, width: 1.sp),
                              borderRadius: BorderRadius.circular(4.sp)),
                          child: Text("Cancel".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: textPrimary,
                                  letterSpacing: 2)),
                        )),
                  ])),
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.showBookmark
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(2.sp),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        widget.bookmarkPreview
                                                .contains("https://")
                                            ? Image.network(
                                                widget.bookmarkPreview,
                                                fit: BoxFit.fill,
                                                width: 74.sp,
                                                height: 74.sp,
                                              )
                                            : Image.asset(
                                                'assets/images/course_preview_2.png',
                                                fit: BoxFit.fill,
                                                width: 74.sp,
                                                height: 74.sp,
                                              ),
                                        Container(
                                          color: Colors.black.withOpacity(0.43),
                                          height: 48.sp,
                                        ),
                                        Image.asset(
                                          "assets/images/play_button.png",
                                          width: 20.sp,
                                          height: 20.sp,
                                          opacity:
                                              const AlwaysStoppedAnimation(0.7),
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  width: 16.sp,
                                ),
                                Text(
                                  widget.bookmarkTime,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1,
                                      height: 1.5),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          : TextField(
                              readOnly: true,
                              controller: titleController,
                              maxLines: null,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                                hintText: "Title",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: textGrey2,
                                    height: 1.4),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              style: GoogleFonts.poppins(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textPrimary,
                                  height: 1.4),
                            ),
                      SizedBox(
                        height: 16.sp,
                      ),
                      TextField(
                        controller: noteController,
                        maxLines: null,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          hintText: "Type something...",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textGrey2,
                              height: 1.43),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: textGrey2,
                            height: 1.43),
                      )
                    ]),
              ))),
    );
  }
}
