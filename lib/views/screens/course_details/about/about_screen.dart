import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:zicops/blocs/course/course_bloc.dart';
import 'package:zicops/repositories/course_repository.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/widgets/bulleted_text.dart';

import '../../../widgets/CourseBadge.dart';
import '../../../widgets/GradientButton.dart';
import '../../../widgets/assign_course_modal.dart';
import '../../../widgets/expansion_container.dart';
import '../../../widgets/more_like_this.dart';
import '../../../widgets/state_error_widget.dart';
import '../../../widgets/unassign_course_modal.dart';

class AboutScreen extends StatefulWidget {
  final String courseId;
  var isCourseAssigned;
  AboutScreen({
    Key? key,
    required this.courseId,
    required this.isCourseAssigned,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AboutScreen();
  }
}

class _AboutScreen extends State<AboutScreen> {
  bool playVideo = false;
  late VideoPlayerController _controller;

  Widget courseInfo(String title, String image, String owner, String type,
      bool playVideo, String videoUrl) {
    return SizedBox(
        height: 202.sp,
        child: Stack(
          fit: StackFit.expand,
          children: [
            playVideo
                ? ContentPlayerAbout(
                    videoUrl: videoUrl,
                  )
                : Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
            Container(
              color: Colors.black.withOpacity(0.43),
              height: 202.sp,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.sp, right: 20.sp, top: 14.sp, bottom: 16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: textPrimary,
                        height: 1.4),
                  ),
                  Text(owner,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: primaryColor)),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(type.toUpperCase(),
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              color: textPrimary,
                              height: 1.33)),
                      Text(
                        "Econtent".toUpperCase(),
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            color: textPrimary,
                            height: 1.33),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CourseBloc(courseRepository: CourseRepository())
          ..add(CourseDataRequested(courseId: widget.courseId)),
        child: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CourseLoaded) {
              // print('course data${state.courseData}');
              var courseDetails = state.courseData?['getCourse'][0];
              var courseData = state.courseData;
              var assesmentTopic = courseData['getTopics']
                  .where((element) => element['type'] == 'Assessment')
                  .toList();
              final height = MediaQuery.of(context).size.height;
              final width = MediaQuery.of(context).size.width;
              print('course data ${courseDetails['previewVideo']}');
              return SingleChildScrollView(
                child: Column(
                  children: [
                    courseInfo(
                      courseDetails['name'],
                      courseDetails['image'],
                      courseDetails['owner'],
                      courseDetails['type'],
                      playVideo,
                      courseDetails['previewVideo'],
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.sp,
                        right: 20.sp,
                        top: 20.sp,
                      ),
                      child: Column(
                        children: [
                          // TODO: Course preview video player to be added
                          GestureDetector(
                            onTap: () => {
                              setState(() {
                                playVideo = !playVideo;
                                // _controller = VideoPlayerController.network(
                                //     courseDetails['previewVideo'])
                                //   ..initialize().then((_) {
                                //     setState(() {});
                                //     _controller.play();
                                //   });
                              })
                            },
                            child: GradientButton('Course Preview'),
                          ),
                          SizedBox(
                            height: 16.sp,
                          ),
                          // TODO: Mutation for assign/un-assign course should be added here
                          GestureDetector(
                              onTap: () => {
                                    widget.isCourseAssigned
                                        ? unAssignCourseBottomSheet(
                                            context, 360.sp, width)
                                        : assignCourseBottomSheet(
                                            context, height - 120.sp, width)
                                  },
                              child: Container(
                                alignment: Alignment.center,
                                height: 48.sp,
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(4.sp),
                                    // gradient: const LinearGradient(colors: [primaryColor, gradientTwo])
                                    border: Border.all(color: lightGrey)),
                                child: widget.isCourseAssigned
                                    ? Text(
                                        "unassign course".toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            letterSpacing: 2,
                                            color: textGrey2,
                                            height: 1.5),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "+".toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.sp,
                                                letterSpacing: 2,
                                                color: primaryColor,
                                                height: 1.5),
                                          ),
                                          SizedBox(
                                            width: 6.sp,
                                          ),
                                          Text(
                                            "Add to learning folder"
                                                .toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                letterSpacing: 2,
                                                color: primaryColor,
                                                height: 1.5),
                                          )
                                        ],
                                      ),
                              )),
                          SizedBox(
                            height: 17.sp,
                          ),
                          courseBadge("assets/images/signal.png",
                              courseDetails['expertise_level']),
                          SizedBox(
                            height: 8.sp,
                          ),
                          courseBadge("assets/images/gradient_clock.png",
                              '${(courseDetails['duration'] / 60).round().toString()} min'),
                          SizedBox(
                            height: 8.sp,
                          ),
                          courseBadge("assets/images/gradient_flag.png",
                              "24th December 2022"),
                          SizedBox(
                            height: 8.sp,
                          ),
                          courseBadge("assets/images/gradient_calendar.png",
                              "30 days remaining"),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Text(
                            courseDetails['summary'],
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: textPrimary,
                                height: 1.43),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Divider(
                            height: 1.sp,
                            thickness: 1.sp,
                            color: lightGrey,
                          ),
                          SizedBox(
                            height: 12.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                foregroundImage: const AssetImage(
                                    "assets/images/avatar_default.png"),
                                radius: 18.sp,
                              ),
                              SizedBox(
                                width: 15.sp,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.sp,
                                    child: Text(
                                      "Owned by: ${courseDetails['owner']}",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          height: 1.43,
                                          color: textPrimary),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.sp,
                                    child: Text(
                                      "Instructor: ${courseDetails['instructor']} ",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          height: 1.33,
                                          color: textPrimary),
                                    ),
                                  ),
                                ],
                              )
                            ],
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
                            height: 12.sp,
                          ),
                          ExpansionContainer(
                            "Learning Objectives",
                            Column(children: [
                              Divider(
                                height: 1.sp,
                                thickness: 1.sp,
                                color: lightGrey,
                              ),
                              SizedBox(
                                height: 13.sp,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: courseDetails['outcomes'].length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        BulletedText(
                                            courseDetails['outcomes']
                                                .elementAt(index),
                                            horizontal: 15.sp),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                      ],
                                    );
                                  }),
                            ]),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          ExpansionContainer(
                            "Benefits",
                            Column(children: [
                              Divider(
                                height: 1.sp,
                                thickness: 1.sp,
                                color: lightGrey,
                              ),
                              SizedBox(
                                height: 13.sp,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: courseDetails['benefits'].length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        BulletedText(
                                            courseDetails['benefits']
                                                .elementAt(index),
                                            horizontal: 15.sp),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                      ],
                                    );
                                  }),
                            ]),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          ExpansionContainer(
                            "Pre-requisites",
                            Column(children: [
                              Divider(
                                height: 1.sp,
                                thickness: 1.sp,
                                color: lightGrey,
                              ),
                              SizedBox(
                                height: 13.sp,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      courseDetails['prequisites'].length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        BulletedText(
                                            courseDetails['prequisites']
                                                .elementAt(index),
                                            horizontal: 15.sp),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                      ],
                                    );
                                  }),
                            ]),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          ExpansionContainer(
                            "Target audience",
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Divider(
                                    height: 1.sp,
                                    thickness: 1.sp,
                                    color: lightGrey,
                                  ),
                                  SizedBox(
                                    height: 13.sp,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.sp),
                                    child: Text(
                                      'Must For:',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 12.sp, color: textGrey2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          courseDetails['mustFor'].length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            BulletedText(
                                                '${courseDetails['mustFor'].elementAt(index)}',
                                                horizontal: 15.sp),
                                            SizedBox(
                                              height: 20.sp,
                                            ),
                                          ],
                                        );
                                      }),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.sp),
                                    child: Text(
                                      'Good For:',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 12.sp, color: textGrey2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          courseDetails['goodFor'].length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            BulletedText(
                                                '${courseDetails['goodFor'].elementAt(index)}',
                                                horizontal: 15.sp),
                                            SizedBox(
                                              height: 20.sp,
                                            ),
                                          ],
                                        );
                                      }),
                                ]),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          ExpansionContainer(
                            "Course Inclusion",
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Divider(
                                    height: 1.sp,
                                    thickness: 1.sp,
                                    color: lightGrey,
                                  ),
                                  SizedBox(
                                    height: 13.sp,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.sp),
                                    child: Text(
                                      'Languages:',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 12.sp, color: textGrey2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          courseDetails['language'].length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            BulletedText(
                                                '${courseDetails['language'].elementAt(index)}',
                                                horizontal: 15.sp),
                                            SizedBox(
                                              height: 5.sp,
                                            ),
                                          ],
                                        );
                                      }),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.sp),
                                    child: Text(
                                      'Structured View',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 12.sp, color: textGrey2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  BulletedText(
                                      '${courseData['getCourseModules'].length} Modules, ${courseData['getTopics'].length} Topics',
                                      horizontal: 15.sp),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.sp),
                                    child: Text(
                                      'Assessment',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 12.sp, color: textGrey2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  BulletedText(
                                      '${assesmentTopic.length} assessments',
                                      horizontal: 15.sp),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 16.sp,
                          ),
                          Divider(
                            height: 1.sp,
                            thickness: 1.sp,
                            color: lightGrey,
                          ),
                          SizedBox(
                            height: 16.sp,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 24.sp,
                          margin: EdgeInsets.only(left: 20.sp),
                          child: Text(
                            "Related Skills",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: textPrimary),
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        Container(
                          height: 28.sp,
                          alignment: Alignment.center,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 20.sp,
                              ),
                              ...courseDetails['related_skills'].map((e) =>
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.5.sp, horizontal: 0.5.sp),
                                      margin: EdgeInsets.only(right: 8.sp),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                          gradient: LinearGradient(
                                              colors: [
                                                secondaryColorDarkOutline,
                                                secondaryColorDarkOutline
                                                    .withOpacity(0.15),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter)),
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4.sp,
                                              horizontal: 12.sp),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.sp),
                                              color: secondaryColor),
                                          child: SizedBox(
                                              height: 20.sp,
                                              child: Text(
                                                e,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: textPrimary,
                                                    height: 1.43),
                                              )))))
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Divider(
                          height: 1.sp,
                          thickness: 1.sp,
                          color: lightGrey,
                        )),
                    SizedBox(
                      height: 14.sp,
                    ),
                    MoreLikeThis(),
                  ],
                ),
              );
            }
            if (state is CourseError) {
              print(state.error);
              return StateErrorWidget();
            }
            return Container();
          },
        ));
  }
}

class ContentPlayerAbout extends StatefulWidget {
  final String videoUrl;
  const ContentPlayerAbout({
    required this.videoUrl,
    Key? key,
  }) : super(key: key);

  //final VideoPlayerController _controller;

  @override
  State<ContentPlayerAbout> createState() => _ContentPlayerAboutState();
}

class _ContentPlayerAboutState extends State<ContentPlayerAbout> {
  late VideoPlayerController _controller;
  bool _isPlaying = true;
  @override
  initState() {
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          // Automatically start playing the video when it is initialized.
          _controller.play();
        });
      });

    // Future.delayed(Duration(milliseconds: 1000));

    // _controller.initialize();

    _controller.setLooping(true);
    _controller.play();

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        VideoPlayer(_controller),
        // Container(
        //   //color: Colors.black26,
        //   height: 50,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       IconButton(
        //         onPressed: () {
        //           setState(() {
        //             _isPlaying = !_isPlaying;
        //             if (_isPlaying) {
        //               _controller.play();
        //             } else {
        //               _controller.pause();
        //             }
        //           });
        //         },
        //         icon: Icon(
        //           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
