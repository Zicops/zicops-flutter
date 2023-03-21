import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';
import 'package:zicops/views/screens/exam/exam_screen.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/CourseBadge.dart';
import '../../../widgets/VideoCourseBadge.dart';
import '../../../widgets/VideoSettingsItem.dart';
import '../../../widgets/comment_item.dart';
import '../../../widgets/module_card.dart';
import '../../../widgets/modules_dropdown.dart';
import '../../../widgets/more_like_this.dart';
import '../../../widgets/video_player.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TopicScreen();
  }
}

class _TopicScreen extends State<TopicScreen> {
  final PanelController _panelController = PanelController();
  VideoPlayerController? _controller;
  int selectedChapter = -1;
  double minPanelHeight = 0;
  double maxPanelHeight = 0;

  int selectedVideoOption = -1;

  initVideoController(videoUrl) {
    _controller = VideoPlayerController.network(videoUrl);
  }

  getBottomSheetChild() {
    switch (selectedVideoOption) {
      case 0:
        return Settings();
      case 1:
        return TakeNote(
            true,
            "assets/images/course_preview.png",
            _controller != null
                ? _controller!.value.position.toString()
                : "00");
      case 2:
        return TakeNote(false, "assets/images/course_preview.png", "00");
      default:
        return Discussion();
    }
  }

  Widget Settings() {
    return Column(
      children: [
        Container(
          height: 24.sp,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          margin: EdgeInsets.only(bottom: 15.sp),
          child: Text(
            "Settings",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: textPrimary,
                height: 1.33),
          ),
        ),
        Divider(
          height: 1.sp,
          thickness: 1.sp,
          color: lightGrey,
        ),
        Expanded(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                children: [
              VideoSettingItem(
                  "assets/images/quality.png", "Quality", "1080", true),
              VideoSettingItem(
                  "assets/images/caption.png", "Captions", "On", true),
              VideoSettingItem(
                  "assets/images/language.png", "Language", "English", true),
              VideoSettingItem("assets/images/flag.png", "Report", "", false),
              VideoSettingItem(
                  "assets/images/help.png", "Help & feedback", "", false),
              VideoSettingItem("assets/images/playback.png", "Playback speed",
                  "Normal", true),
            ]))
      ],
    );
  }

  Widget Discussion() {
    return Column(
      children: [
        Container(
            height: 24.sp,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            margin: EdgeInsets.only(bottom: 15.sp),
            child: Row(
              children: [
                Text(
                  "Discussion",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: textPrimary,
                      height: 1.33),
                ),
                const Spacer(),
                Container(
                    width: 24.sp,
                    height: 24.sp,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/filter.png",
                      width: 18.sp,
                      height: 12.sp,
                      color: textPrimary,
                    )),
                SizedBox(
                  width: 24.sp,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        minPanelHeight = 0;
                      });
                      _panelController.close();
                    },
                    child: Container(
                        width: 24.sp,
                        height: 48.sp,
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/cross.png",
                          width: 14.sp,
                          height: 14.sp,
                        ))),
              ],
            )),
        Divider(
          height: 1.sp,
          thickness: 1.sp,
          color: lightGrey,
        ),
        Container(
            height: 48.sp,
            alignment: Alignment.center,
            color: secondaryColorLight,
            padding: EdgeInsets.symmetric(horizontal: 12.sp),
            child: Row(
              children: [
                CircleAvatar(
                  foregroundImage:
                      const AssetImage("assets/images/avatar_default.png"),
                  radius: 14.sp,
                ),
                SizedBox(
                  width: 16.sp,
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Add a comment...',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14.sp, color: textGrey2)),
                  style:
                      GoogleFonts.poppins(fontSize: 14.sp, color: textPrimary),
                ))
              ],
            )),
        Expanded(
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          children: [
            CommentItem(),
            CommentItem(),
            CommentItem(),
            CommentItem(),
            _panelController.isAttached &&
                    _panelController.isPanelShown &&
                    !_panelController.isPanelOpen
                ? SizedBox(
                    height: maxPanelHeight - minPanelHeight,
                  )
                : SizedBox(
                    height: 100.sp,
                  )
          ],
        ))
      ],
    );
  }

  Widget TakeNote(bool isBookmark, String preview, String bookmarkTime) {
    return Column(children: [
      Container(
          height: 24.sp,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          margin: EdgeInsets.only(bottom: 20.sp),
          child: Row(
            children: [
              Text(
                isBookmark ? "Bookmark" : "Note 1",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: textPrimary,
                    height: 1.33),
              ),
              const Spacer(),
              SizedBox(
                width: 24.sp,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      minPanelHeight = 0;
                    });
                    _panelController.close();
                  },
                  child: Container(
                      width: 24.sp,
                      height: 48.sp,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/cross.png",
                        width: 14.sp,
                        height: 14.sp,
                      ))),
            ],
          )),
      Divider(
        height: 1.sp,
        thickness: 1.sp,
        color: lightGrey,
      ),
      isBookmark
          ? Padding(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 20.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(2.sp),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            preview,
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
                            opacity: const AlwaysStoppedAnimation(0.7),
                          )
                        ],
                      )),
                  SizedBox(
                    width: 16.sp,
                  ),
                  Text(
                    bookmarkTime,
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        height: 1.5),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ))
          : SizedBox(
              height: 7.sp,
            ),
      Padding(
          padding: EdgeInsets.only(
              left: 20.sp, right: 20.sp, top: 14.sp, bottom: 14.sp),
          child: TextField(
            onSubmitted: (val) {},
            maxLines: null,
            autofocus: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              hintText: "Type something...",
              hintStyle: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: textGrey2,
                  height: 1.43),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
            style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: textGrey2,
                height: 1.43),
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SlidingUpPanel(
        controller: _panelController,
        minHeight: minPanelHeight,
        maxHeight: maxPanelHeight,
        color: Colors.transparent,
        onPanelOpened: () {
          setState(() {});
        },
        onPanelClosed: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        panel: Container(
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
                  margin: EdgeInsets.only(top: 8.sp, bottom: 10.sp),
                  decoration: BoxDecoration(
                      color: secondaryColorDark,
                      borderRadius: BorderRadius.circular(4.sp)),
                ),
                Expanded(child: getBottomSheetChild()),
              ],
            )),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // SizedBox(height: 11.sp),
            if (selectedChapter != -1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 48.sp,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 18.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 24.sp,
                              height: 24.sp,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/quiz.png",
                                width: 20.sp,
                                height: 20.sp,
                              )),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedVideoOption = 2;
                                  if (_panelController.isAttached) {
                                    minPanelHeight = 163.sp;
                                    maxPanelHeight = height;
                                    _panelController.show();
                                  }
                                });
                              },
                              child: Container(
                                  width: 24.sp,
                                  height: 24.sp,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/images/notes.png",
                                    width: 18.sp,
                                    height: 18.sp,
                                  ))),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedVideoOption = 1;
                                  if (_panelController.isAttached) {
                                    minPanelHeight = 209.sp;
                                    maxPanelHeight = height;
                                    _panelController.show();
                                  }
                                });
                              },
                              child: Container(
                                  width: 24.sp,
                                  height: 24.sp,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/images/bookmark.png",
                                    width: 14.sp,
                                    height: 18.sp,
                                  ))),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedVideoOption = 0;
                                  maxPanelHeight = 370.sp;
                                  _panelController.open();
                                });
                              },
                              child: Container(
                                  width: 24.sp,
                                  height: 24.sp,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/images/settings.png",
                                    width: 20.sp,
                                    height: 20.sp,
                                  ))),
                        ],
                      )),
                  if (_controller != null)
                    PortraitVideoPlayer(controller: _controller!),
                  SizedBox(
                    height: 23.sp,
                  ),
                  Container(
                    height: 24.sp,
                    margin: EdgeInsets.only(left: 20.sp),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "$selectedChapter.Empathize",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: textPrimary),
                    ),
                  ),
                  SizedBox(
                    height: 4.sp,
                  ),
                  Container(
                    height: 16.sp,
                    margin: EdgeInsets.only(left: 16.sp),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        VideoCourseBadge(
                            "assets/images/signal.png", 'Competent'),
                        SizedBox(
                          width: 16.sp,
                        ),
                        VideoCourseBadge(
                            "assets/images/gradient_clock.png", "1hrs 20mins")
                      ],
                    ),
                  )
                ],
              ),
            Container(
              padding: EdgeInsets.only(top: 11.sp, right: 20.sp, left: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ModulesDropDown(),
                  SizedBox(
                    height: 13.sp,
                  ),
                  SizedBox(
                    height: 16.sp,
                    child: Text("Chapter 1: Introduction".toUpperCase(),
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: textGrey2,
                            height: 1.33,
                            letterSpacing: 1)),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  SizedBox(
                    height: 320.sp,
                    child: ListView(
                      children: [
                        ...[1, 2, 3, 4, 5].map((e) => GestureDetector(
                              onTap: () {
                                if (e != 3) {
                                  setState(() {
                                    selectedChapter = e;
                                    initVideoController(
                                        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
                                  });
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ExamScreen()));
                                }
                              },
                              child: e != 3
                                  ? ModuleCard(
                                      "$e.Empathize",
                                      "1hr 50 mins",
                                      "assets/images/course_preview_2.png",
                                      e == selectedChapter,
                                      _controller?.value.position,
                                      _controller?.value.duration)
                                  : ModuleCard(
                                      "Exam 1: IT development: Core java fundamentals",
                                      "1hr 50 mins",
                                      "assets/images/course_preview_2.png",
                                      e == selectedChapter,
                                      _controller?.value.position,
                                      _controller?.value.duration,
                                      isExam: true,
                                    ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.sp,
                  ),
                  Divider(
                    height: 1.sp,
                    thickness: 1.sp,
                    color: lightGrey,
                  ),
                  SizedBox(
                    height: 14.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discussion",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: textPrimary),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedVideoOption = 3;
                              if (_panelController.isAttached) {
                                minPanelHeight = height - 340.sp;
                                maxPanelHeight = height;
                                _panelController.show();
                              }
                            });
                          },
                          child: Container(
                            width: 24.sp,
                            height: 24.sp,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 3.sp, horizontal: 7.4.sp),
                            child: Image.asset("assets/images/unfold_more.png"),
                          ))
                    ],
                  ),
                  CommentItem(),
                  SizedBox(
                    height: 14.sp,
                  ),
                ],
              ),
            ),
            const MoreLikeThis(),
            SizedBox(
              height: 128.sp,
            )
          ]),
        ));
  }
}
