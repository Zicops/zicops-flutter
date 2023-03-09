import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';
import 'package:zicops/blocs/course/course_bloc.dart';
import 'package:zicops/repositories/course_repository.dart';
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
  TopicScreen(this.courseId, this.courseName, this.difficulty, {Key? key})
      : super(key: key);

  String courseName;
  String courseId;
  String difficulty;
  // List topicData;

  @override
  State<StatefulWidget> createState() {
    return _TopicScreen();
  }
}

class _TopicScreen extends State<TopicScreen> {
  final PanelController _panelController = PanelController();
  VideoPlayerController? _controller;

  List dropdown = [];
  List topicData = [];

  String videoUrl =
      'https://storage.googleapis.com/8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1/09b68417-a93c-42de-b649-b81a1d3b17f8/25a7a60c-7dcb-4b84-9b3d-113e7172e06c/videoplayback.mp4?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=zicops-cc%40zicops-one.iam.gserviceaccount.com%2F20230218%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20230218T041325Z&X-Goog-Expires=86399&X-Goog-Signature=1d0abf133e9da32fdd6bcef18688a5ddc8a915007bd42ab9e74be0f2d758c22ce5c3dffff46c2168a73b6a77b8ab454f617838a21cf4f69201849ef220b673af046519281e9991bb437b59d317a6e13863030224f099b08de928d000d51c84365841b577a3f7b891ec6924792044f47d14d28985982142e8522cb5cfb7644d8565c3f4ad2e95de0b2041449ffa259f7d42ed49b1e30b2885d48acd445d106927ab0aa26c3ee2ae45d1b13ee97a0ec949815032457c67f2439a11413bb5ccf45637200363a41064c688d7073a96b52c3dafc2ff09ab4a6e87eef09ed60bbaf2c45873fbd11bf4ff9e411f5c4e9dfcc949837a538e992f68f78124183c72a5d910&X-Goog-SignedHeaders=host';
  String selectedChapter = (-1).toString();
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
    return BlocProvider(
      create: (context) => CourseBloc(courseRepository: CourseRepository())
        ..add(CourseRequested(courseId: widget.courseId)),
      child: SlidingUpPanel(
          controller: _panelController,
          minHeight: minPanelHeight,
          maxHeight: maxPanelHeight,
          color: Colors.transparent,
          onPanelOpened: () {
            setState(() {});
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
                                    _panelController.show();
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
                        "$selectedChapter." + widget.courseName,
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
                    BlocBuilder<CourseBloc, CourseState>(
                      builder: (context, state) {
                        if (state is CourseLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is CourseLoaded) {
                          topicData = state.topicData;
                          return Column(
                            children: [
                              Container(
                                height: 16.sp,
                                margin: EdgeInsets.only(left: 16.sp),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    VideoCourseBadge("assets/images/signal.png",
                                        widget.difficulty),
                                    SizedBox(
                                      width: 16.sp,
                                    ),
                                    VideoCourseBadge(
                                        "assets/images/gradient_clock.png",
                                        "1hrs 20mins")
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 11.sp, right: 20.sp, left: 20.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ModulesDropDown(),
                                    SizedBox(
                                      height: 13.sp,
                                    ),
                                    SizedBox(
                                      height: 16.sp,
                                      child: Text(
                                          "Chapter 1: Introduction"
                                              .toUpperCase(),
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
                                        children: (topicData.isNotEmpty
                                            ? [
                                                ...topicData.map((e) =>
                                                    GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              e['contentUrl']);
                                                          setState(() {
                                                            selectedChapter =
                                                                e['name'];
                                                            initVideoController(
                                                                //  'assets/images/mov_bbb.mp4');
                                                                e['contentUrl']);
                                                            //    'https://samplelib.com/lib/preview/mp4/sample-30s.mp4');
                                                            // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
                                                          });
                                                        },
                                                        child: ModuleCard(
                                                            e['name'],
                                                            "1hr 50 mins",
                                                            "assets/images/course_preview_2.png",
                                                            e['name'] ==
                                                                selectedChapter,
                                                            _controller?.value
                                                                .position,
                                                            _controller?.value
                                                                .duration)))
                                              ]
                                            : [
                                                Center(
                                                    child: Text(
                                                  "No Data",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                              ]),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                if (_panelController
                                                    .isAttached) {
                                                  minPanelHeight =
                                                      height - 340.sp;
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
                                                  vertical: 3.sp,
                                                  horizontal: 7.4.sp),
                                              child: Image.asset(
                                                  "assets/images/unfold_more.png"),
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
                            ],
                          );
                        }
                        if (state is CourseError) {
                          return Center(child: Text(state.error));
                        }
                        return Container();
                      },
                    )
                  ],
                ),

              const MoreLikeThis()
            ]),
          )),
    );
  }
}
