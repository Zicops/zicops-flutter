import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:zicops/utils/dummies.dart';

import '../../utils/colors.dart';
import 'CourseBadge.dart';
import 'VideoSettingsItem.dart';

class LandscapeVideoPlayer extends StatefulWidget {
  LandscapeVideoPlayer({Key? key, required this.controller}) : super(key: key);
  final VideoPlayerController controller;

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayer();
  }
}

class _VideoPlayer extends State<LandscapeVideoPlayer> {
  late VideoPlayerController _controller;
  bool isVisible = true;
  bool showDiscussion = false;
  bool showDescription = false;
  bool showSettings = false;
  bool showBookmarkNotes = false;
  bool isBookmark = false;
  bool showSkipBack = false;
  bool showSkipForward = false;
  bool showSeeAllOverlay = false;
  bool hideControlIcons = false;

  Widget TakeNote(bool isBookmark, String preview, String bookmarkTime,
      double width, double height) {
    return Container(
      width: width,
      height: height,
      child: Column(children: [
        SizedBox(
          height: 16.sp,
        ),
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
                        showBookmarkNotes = false;
                      });
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
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    _controller = widget.controller;

    _controller.addListener(() {
      setState(() {});
    });
    if (!_controller.value.isInitialized) {
      _controller.initialize();
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    toggleDiscussion(bool state) {
      setState(() {
        showDiscussion = state;
        hideControlIcons = state;
      });
    }

    toggleDescription(bool state) {
      setState(() {
        showDescription = state;
        hideControlIcons = state;
        if (!state) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      });
    }

    toggleSettings(bool state) {
      setState(() {
        showSettings = state;
        hideControlIcons = state;
      });
    }

    toggleSeeAllOverlay(bool state) {
      setState(() {
        showSeeAllOverlay = state;
        if (state) _controller.pause();
      });
    }

    toggleBookmarkNotes(bool state, bool bookmark) {
      setState(() {
        showBookmarkNotes = state;
        isBookmark = bookmark;
        if (!state) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      });
    }

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            width: width,
            height: height,
            color: secondaryColorDark,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Stack(fit: StackFit.expand, children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  if (showSeeAllOverlay)
                    SeeAllTopicOverlay(toggleSeeAllOverlay,
                        controller: _controller)
                  else
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            isVisible = !isVisible;
                            toggleSeeAllOverlay(false);
                          } else {
                            _controller.play();
                          }
                        });
                      },
                      child: Visibility(
                          visible: isVisible,
                          maintainState: true,
                          maintainAnimation: true,
                          maintainSize: true,
                          maintainInteractivity: true,
                          child: ControlsOverlay(
                            toggleDiscussion,
                            toggleDescription,
                            toggleSettings,
                            toggleSeeAllOverlay,
                            toggleBookmarkNotes,
                            hideControlIcons,
                            controller: _controller,
                          )),
                    ),
                  if (!showSeeAllOverlay)
                    Positioned(
                        top: !isVisible ? 0 : height / 4,
                        left: 0,
                        child: Visibility(
                            visible: showSkipBack,
                            maintainState: true,
                            maintainAnimation: true,
                            maintainSize: true,
                            maintainInteractivity: true,
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  if (_controller.value.isPlaying) {
                                    isVisible = !isVisible;
                                    toggleSeeAllOverlay(false);
                                  } else {
                                    _controller.play();
                                  }
                                });
                              },
                              onDoubleTap: () {
                                setState(() {
                                  isVisible = false;
                                  showSkipBack = true;
                                  widget.controller.seekTo(Duration(
                                      milliseconds: (widget.controller.value
                                                  .position.inMilliseconds -
                                              10000)
                                          .toInt()));
                                });
                                Future.delayed(
                                    const Duration(milliseconds: 300), () {
                                  setState(() {
                                    isVisible = true;
                                    showSkipBack = false;
                                  });
                                });
                              },
                              child: Container(
                                width: width / 2.5,
                                height: !isVisible ? height : height / 3,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 65.sp),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.horizontal(
                                        right: Radius.elliptical(
                                      450,
                                      MediaQuery.of(context).size.width,
                                    ))),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 68.sp,
                                      height: 32.sp,
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                          "assets/images/skip_back.png"),
                                    ),
                                    Text(
                                      "10 seconds",
                                      style: TextStyle(
                                          fontSize: 12.sp, color: textPrimary),
                                    )
                                  ],
                                ),
                              ),
                            ))),
                  if (!showSeeAllOverlay)
                    Positioned(
                        top: !isVisible ? 0 : height / 4,
                        right: 0,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_controller.value.isPlaying) {
                                  isVisible = !isVisible;
                                  toggleSeeAllOverlay(false);
                                } else {
                                  _controller.play();
                                }
                              });
                            },
                            onDoubleTap: () {
                              setState(() {
                                isVisible = false;
                                showSkipForward = true;
                                widget.controller.seekTo(Duration(
                                    milliseconds: (widget.controller.value
                                                .position.inMilliseconds +
                                            10000)
                                        .toInt()));
                              });
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                setState(() {
                                  isVisible = true;
                                  showSkipForward = false;
                                });
                              });
                            },
                            child: Visibility(
                              visible: showSkipForward,
                              maintainState: true,
                              maintainAnimation: true,
                              maintainSize: true,
                              maintainInteractivity: true,
                              child: GestureDetector(
                                child: Container(
                                  width: width / 2.5,
                                  height: !isVisible ? height : height / 3,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 65.sp),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.elliptical(
                                      450,
                                      MediaQuery.of(context).size.width,
                                    )),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 68.sp,
                                        height: 32.sp,
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                            "assets/images/skip_forward.png"),
                                      ),
                                      Text(
                                        "10 seconds",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: textPrimary),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))),
                ])),
                if (showDiscussion)
                  Discussion(toggleDiscussion)
                else if (showDescription)
                  Description(toggleDescription)
                else if (showSettings)
                  Settings(toggleSettings)
                else if (showBookmarkNotes)
                  TakeNote(isBookmark, 'assets/images/course_preview.png',
                      _controller.value.position.toString(), width, height)
              ],
            )));
  }
}

class ControlsOverlay extends StatefulWidget {
  ControlsOverlay(
      this.toggleDiscussion,
      this.toggleDescription,
      this.toggleSettings,
      this.toggleSeeAllOverlay,
      this.toggleBookmarkNotes,
      this.hideControlIcons,
      {Key? key,
      required this.controller})
      : super(key: key);

  final VideoPlayerController controller;
  Function toggleDiscussion;
  Function toggleDescription;
  Function toggleSettings;
  Function toggleSeeAllOverlay;
  Function toggleBookmarkNotes;
  bool hideControlIcons;
  @override
  State<StatefulWidget> createState() {
    return _ControlsOverlay();
  }
}

class _ControlsOverlay extends State<ControlsOverlay> {
  bool showSliderTooltip = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        alignment: Alignment.center,
        color: overlay,
        child: Visibility(
            visible: !widget.hideControlIcons,
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 50),
                  reverseDuration: const Duration(milliseconds: 200),
                  child: widget.controller.value.isBuffering
                      ? Container(
                          width: 40.sp,
                          height: 40.sp,
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            color: primaryColor,
                          ))
                      : widget.controller.value.isPlaying
                          ? InkWell(
                              onTap: () {
                                widget.controller.pause();
                              },
                              child: Container(
                                  width: 40.sp,
                                  height: 40.sp,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/images/pause.png",
                                    width: 33.sp,
                                    height: 33.sp,
                                  )),
                            )
                          : InkWell(
                              onTap: () {
                                widget.controller.play();
                              },
                              child: Container(
                                  width: 40.sp,
                                  height: 40.sp,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/images/video_play.png",
                                    width: 33.sp,
                                    height: 33.sp,
                                  )),
                            ),
                ),
                Positioned(
                    top: 18.sp,
                    left: 0,
                    child: Container(
                      width: width,
                      height: 44.sp,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 18.sp),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 24.sp,
                            height: 24.sp,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 4.sp, horizontal: 6.sp),
                            child: Image.asset(
                              "assets/images/down_arrow.png",
                            ),
                          ),
                          SizedBox(
                            width: 16.sp,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 28.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "Java Basics",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textPrimary),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 16.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  'Zicops special',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: textGrey2),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              widget.toggleDescription(true);
                            },
                            child: Container(
                                width: 24.sp,
                                height: 24.sp,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/resources.png",
                                  width: 20.sp,
                                  height: 16.sp,
                                )),
                          ),
                          SizedBox(
                            width: 24.sp,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              widget.toggleDiscussion(true);
                            },
                            child: Container(
                                width: 24.sp,
                                height: 24.sp,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/chat.png",
                                  width: 20.sp,
                                  height: 20.sp,
                                )),
                          ),
                          SizedBox(
                            width: 24.sp,
                          ),
                          Container(
                              width: 24.sp,
                              height: 24.sp,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/quiz.png",
                                width: 20.sp,
                                height: 20.sp,
                              )),
                          SizedBox(
                            width: 24.sp,
                          ),
                          GestureDetector(
                              onTap: () {
                                widget.toggleBookmarkNotes(true, false);
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
                          SizedBox(
                            width: 24.sp,
                          ),
                          GestureDetector(
                              onTap: () {
                                widget.toggleBookmarkNotes(true, true);
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
                          SizedBox(
                            width: 24.sp,
                          ),
                          GestureDetector(
                              onTap: () {
                                widget.toggleSettings(true);
                              },
                              child: Container(
                                width: 24.sp,
                                height: 24.sp,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/settings.png",
                                  width: 20.sp,
                                  height: 20.sp,
                                ),
                              )),
                          SizedBox(
                            width: 18.sp,
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  bottom: 107.sp,
                  left: 0,
                  child: Container(
                      height: 16.sp,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 18.sp),
                      child: Text(
                        "${widget.controller.value.position.toString().split('.').first.padLeft(8, "0")} / ${widget.controller.value.duration.toString().split('.').first.padLeft(8, "0")}",
                        style: TextStyle(fontSize: 12.sp, color: textPrimary),
                      )),
                ),
                Positioned(
                    bottom: 107.sp,
                    right: 0,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 24.sp,
                          height: 24.sp,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 18.sp),
                          child: Image.asset(
                            "assets/images/fullscreen_exit.png",
                            width: 14.sp,
                            height: 14.sp,
                          )),
                    )),
                if (widget.controller.value.position.inSeconds < 10)
                  Positioned(
                      bottom: 108.sp,
                      right: 62.sp,
                      child: Text(
                        "Skip Intro".toUpperCase(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                            letterSpacing: 2),
                      )),
                // Positioned(
                //     bottom: 84.sp,
                //     child: Container(
                //         width: width,
                //         height: 4.sp,
                //         alignment: Alignment.center,
                //         child: const LinearProgressIndicator(backgroundColor: secondaryColor, valueColor: AlwaysStoppedAnimation(textGrey2), value: 0.8,))),
                Positioned(
                    bottom: 84.sp,
                    child: Container(
                        width: width,
                        height: 4.sp,
                        alignment: Alignment.center,
                        child: Slider(
                          activeColor: primaryColor,
                          inactiveColor: secondaryColor,
                          thumbColor: primaryColor,
                          onChangeStart: (change) {
                            setState(() {
                              showSliderTooltip = true;
                            });
                          },
                          onChangeEnd: (change) {
                            setState(() {
                              showSliderTooltip = false;
                            });
                          },
                          value: widget.controller.value.duration.inSeconds != 0
                              ? widget.controller.value.position
                                      .inMilliseconds /
                                  widget
                                      .controller.value.duration.inMilliseconds
                              : 0,
                          onChanged: (double value) {
                            widget.controller.seekTo(Duration(
                                milliseconds: (widget.controller.value.duration
                                            .inMilliseconds *
                                        value)
                                    .toInt()));
                          },
                        ))),

                Positioned(
                    bottom: 20.sp,
                    left: 0,
                    child: Container(
                        width: width,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 18.sp),
                        child: Row(
                          children: [
                            Container(
                                width: 24.sp,
                                height: 24.sp,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/rewind.png",
                                  width: 16.sp,
                                  height: 14.sp,
                                )),
                            SizedBox(
                              width: 24.sp,
                            ),
                            Container(
                                width: 24.sp,
                                height: 24.sp,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/forward.png",
                                  width: 16.sp,
                                  height: 14.sp,
                                )),
                            const Spacer(),
                            if (widget.controller.value.duration.inSeconds -
                                    widget.controller.value.position.inSeconds <
                                10)
                              Text("Next Topic >".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: textPrimary,
                                      letterSpacing: 2)),
                            SizedBox(
                              width: 16.sp,
                            ),
                            GestureDetector(
                                onTap: () {
                                  widget.toggleSeeAllOverlay(true);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 20.sp,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "More content",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: textPrimary,
                                            height: 1.43),
                                      ),
                                    ),
                                    Container(
                                      height: 16.sp,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Tap to see all',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: textGrey2,
                                            height: 1.14),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              width: 16.sp,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(2.sp),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/course_preview.png",
                                      fit: BoxFit.fill,
                                      width: 48.sp,
                                      height: 48.sp,
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
                                          const AlwaysStoppedAnimation(0.6),
                                    )
                                  ],
                                )),
                          ],
                        ))),
                if (showSliderTooltip)
                  Positioned(
                      bottom: 120.sp,
                      left: (widget.controller.value.position.inMilliseconds /
                              widget.controller.value.duration.inMilliseconds) *
                          width *
                          0.9,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: 8.sp),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xFF101012),
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: Text(
                              widget.controller.value.position
                                  .toString()
                                  .split('.')
                                  .first
                                  .padLeft(8, "0"),
                              style: TextStyle(
                                  fontSize: 12.sp, color: textPrimary))))
              ],
            )));
  }
}

class SeeAllTopicOverlay extends StatefulWidget {
  SeeAllTopicOverlay(this.toggleSeeAllOverlay,
      {Key? key, required this.controller})
      : super(key: key);

  final VideoPlayerController controller;
  Function toggleSeeAllOverlay;

  @override
  State<StatefulWidget> createState() {
    return _SeeAllTopicOverlay();
  }
}

class _SeeAllTopicOverlay extends State<SeeAllTopicOverlay> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        alignment: Alignment.center,
        color: Color(0xE5101012),
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: [
            GestureDetector(
              onTap: () {
                widget.toggleSeeAllOverlay(false);
              },
            ),
            Positioned(
                top: 18.sp,
                left: 0,
                child: Container(
                  width: width,
                  height: 44.sp,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 18.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 24.sp,
                        height: 24.sp,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: 4.sp, horizontal: 6.sp),
                        child: Image.asset(
                          "assets/images/down_arrow.png",
                        ),
                      ),
                      SizedBox(
                        width: 16.sp,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 28.sp,
                            alignment: Alignment.center,
                            child: Text(
                              "Java Basics",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textPrimary),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 16.sp,
                            alignment: Alignment.center,
                            child: Text(
                              'Zicops special',
                              style:
                                  TextStyle(fontSize: 12.sp, color: textGrey2),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            width: 24.sp,
                            height: 24.sp,
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/vert_dots.png",
                              width: 4.sp,
                              height: 16.sp,
                              color: textPrimary,
                            )),
                      ),
                      SizedBox(
                        width: 24.sp,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          widget.toggleSeeAllOverlay(false);
                        },
                        child: Container(
                            width: 24.sp,
                            height: 24.sp,
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/cross.png",
                              width: 14.sp,
                              height: 14.sp,
                            )),
                      ),
                      SizedBox(
                        width: 18.sp,
                      ),
                    ],
                  ),
                )),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                  width: width,
                  height: 156.sp,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 20.sp),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 20.sp,
                      ),
                      ...courseItems.map((e) => VideoCardItem(
                          e['courseName'], e['courseLength'], e['preview']))
                    ],
                  )),
            ),
          ],
        ));
  }
}

class Description extends StatelessWidget {
  Function toggle;

  Description(this.toggle, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 1.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.sp),
                bottomLeft: Radius.circular(4.sp)),
            gradient: LinearGradient(colors: [
              secondaryColorDarkOutline,
              secondaryColorDarkOutline.withOpacity(0.15),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Container(
          width: 260.sp,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.sp),
                bottomLeft: Radius.circular(4.sp)),
          ),
          child: Column(
            children: [
              Container(
                  height: 48.sp,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12.sp),
                  child: Row(
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: textPrimary,
                            height: 1.33),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            toggle(false);
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
              Expanded(
                  child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 12.sp),
                children: [
                  SizedBox(
                    height: 8.sp,
                  ),
                  Text(
                    "Complete Java Programming - Beginner to Advance",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: textPrimary,
                        height: 1.43),
                  ),
                  Text(
                    "Zicops special",
                    style: TextStyle(
                        fontSize: 12.sp, color: textGrey2, height: 1.33),
                  ),
                  SizedBox(
                    height: 13.sp,
                  ),
                  courseBadge("assets/images/signal.png", "Intermediate"),
                  SizedBox(
                    height: 4.sp,
                  ),
                  courseBadge(
                      "assets/images/gradient_flag.png", "24th December 2022"),
                  SizedBox(
                    height: 4.sp,
                  ),
                  courseBadge("assets/images/gradient_calendar.png",
                      "30 days remaining"),
                  SizedBox(
                    height: 13.sp,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy he... Read More",
                    style: TextStyle(
                        fontSize: 14.sp, color: textPrimary, height: 1.43),
                  ),
                  SizedBox(
                    height: 29.sp,
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
                              "Owned by: Zicops",
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
                              "Instructor: Junko Takai ",
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
                    height: 20.sp,
                  )
                ],
              ))
            ],
          ),
        ));
  }
}

class Discussion extends StatefulWidget {
  Function toggle;

  Discussion(this.toggle, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Discussion();
  }
}

class _Discussion extends State<Discussion> {
  Widget commentItem() {
    return Column(children: [
      Container(
        padding: EdgeInsets.only(top: 13.sp, bottom: 16.sp),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 4.sp),
              child: CircleAvatar(
                foregroundImage:
                    const AssetImage("assets/images/avatar_default.png"),
                radius: 14.sp,
              ),
            ),
            SizedBox(
              width: 16.sp,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 20.sp,
                    child: Text(
                      "Debraj Mukherjee",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: textPrimary),
                    )),
                SizedBox(
                    height: 16.sp,
                    child: Text("2mins ago",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: textGrey2))),
                SizedBox(
                  height: 8.sp,
                ),
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: textGrey2)),
              ],
            )),
            Container(
              width: 24.sp,
              height: 24.sp,
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/vert_dots.png",
                width: 4.sp,
                height: 16.sp,
              ),
            )
          ],
        ),
      ),
      Divider(
        height: 1.sp,
        thickness: 1.sp,
        color: lightGrey,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 1.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.sp),
                bottomLeft: Radius.circular(4.sp)),
            gradient: LinearGradient(colors: [
              secondaryColorDarkOutline,
              secondaryColorDarkOutline.withOpacity(0.15),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Container(
          width: 260.sp,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.sp),
                bottomLeft: Radius.circular(4.sp)),
          ),
          child: Column(
            children: [
              Container(
                  height: 48.sp,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12.sp),
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
                            widget.toggle(false);
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
                        foregroundImage: const AssetImage(
                            "assets/images/avatar_default.png"),
                        radius: 14.sp,
                      ),
                      SizedBox(
                        width: 16.sp,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'Add a comment...',
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14.sp, color: textGrey2)),
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp, color: textPrimary),
                      ))
                    ],
                  )),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 12.sp),
                children: [commentItem(), commentItem(), commentItem()],
              ))
            ],
          ),
        ));
  }
}

class Settings extends StatefulWidget {
  Function toggle;

  Settings(this.toggle, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _Settings();
  }
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 1.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.sp),
                bottomLeft: Radius.circular(4.sp)),
            gradient: LinearGradient(colors: [
              secondaryColorDarkOutline,
              secondaryColorDarkOutline.withOpacity(0.15),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Container(
          width: 260.sp,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.sp),
                bottomLeft: Radius.circular(4.sp)),
          ),
          child: Column(
            children: [
              Container(
                  height: 48.sp,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12.sp),
                  child: Row(
                    children: [
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: textPrimary,
                            height: 1.33),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            widget.toggle(false);
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
              Expanded(
                  child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 12.sp),
                      children: [
                    VideoSettingItem(
                        "assets/images/quality.png", "Quality", "1080", true),
                    VideoSettingItem(
                        "assets/images/caption.png", "Captions", "On", true),
                    VideoSettingItem("assets/images/language.png", "Language",
                        "English", true),
                    VideoSettingItem(
                        "assets/images/flag.png", "Report", "", false),
                    VideoSettingItem(
                        "assets/images/help.png", "Help & feedback", "", false),
                    VideoSettingItem("assets/images/playback.png",
                        "Playback speed", "Normal", true),
                  ]))
            ],
          ),
        ));
  }
}

class VideoCardItem extends StatelessWidget {
  String courseName;
  String courseLength;
  String preview;
  VideoCardItem(this.courseName, this.courseLength, this.preview, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 156.sp,
          height: 156.sp,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
          margin: EdgeInsets.only(right: 8.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.sp),
              gradient: LinearGradient(colors: [
                secondaryColorDarkOutline,
                secondaryColorDarkOutline.withOpacity(0.15),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(4.sp),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4.sp),
                                topLeft: Radius.circular(4.sp)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  preview,
                                  fit: BoxFit.fill,
                                  width: 156.sp,
                                  height: 88.sp,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.43),
                                  height: 87.75.sp,
                                ),
                                Positioned(
                                    top: 46.sp,
                                    child: Image.asset(
                                      "assets/images/play_button.png",
                                      width: 20.sp,
                                      height: 20.sp,
                                      opacity:
                                          const AlwaysStoppedAnimation(0.6),
                                    ))
                              ],
                            ))),
                    Container(
                      height: 64.sp,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            courseName,
                            style: TextStyle(
                                color: textPrimary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.5),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            courseLength,
                            style: TextStyle(
                                color: textGrey2,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.42),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
