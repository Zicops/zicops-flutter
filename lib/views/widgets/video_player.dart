import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:zicops/views/widgets/landscape_video_player.dart';

import '../../utils/colors.dart';

class PortraitVideoPlayer extends StatefulWidget {
  const PortraitVideoPlayer({Key? key, required this.controller})
      : super(key: key);
  final VideoPlayerController controller;

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayer();
  }
}

class _VideoPlayer extends State<PortraitVideoPlayer> {
  late VideoPlayerController _controller;
  bool isVisible = true;
  bool showSkipBack = false;
  bool showSkipForward = false;
  double height = 202.sp;
  bool showSliderTooltip = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;

    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width,
          height: height.sp,
          alignment: Alignment.center,
          child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.center,
              clipBehavior: Clip.none,
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 4.sp),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          isVisible = !isVisible;
                        } else {
                          _controller.play();
                        }
                      });
                    },
                    child: Visibility(
                        visible: isVisible,
                        child: Container(
                            color: overlay,
                            child: ControlsOverlay(
                              controller: _controller,
                            )))),
                if (false)
                  Positioned(
                      left: -25.sp,
                      bottom: -2.sp,
                      child: Container(
                          width: width * 1.15,
                          height: 10.sp,
                          padding: EdgeInsets.symmetric(vertical: 3.sp),
                          alignment: Alignment.centerLeft,
                          child: const LinearProgressIndicator(
                            backgroundColor: secondaryColor,
                            valueColor: AlwaysStoppedAnimation(textGrey2),
                            value: 0.8,
                          ))),
                if (isVisible)
                  Positioned(
                      left: -25.sp,
                      bottom: -2.sp,
                      child: Container(
                          width: width * 1.15,
                          height: 10.sp,
                          padding: EdgeInsets.symmetric(vertical: 3.sp),
                          alignment: Alignment.centerLeft,
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
                            value:
                                widget.controller.value.duration.inSeconds != 0
                                    ? widget.controller.value.position
                                            .inMilliseconds /
                                        widget.controller.value.duration
                                            .inMilliseconds
                                    : 0,
                            onChanged: (double value) {
                              widget.controller.seekTo(Duration(
                                  milliseconds: (widget.controller.value
                                              .duration.inMilliseconds *
                                          value)
                                      .toInt()));
                            },
                          ))),
                if (showSliderTooltip)
                  Positioned(
                      bottom: 30.sp,
                      left: (widget.controller.value.position.inMilliseconds /
                              widget.controller.value.duration.inMilliseconds) *
                          width *
                          0.8,
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
                                  fontSize: 12.sp, color: textPrimary)))),
                if (!isVisible)
                  Positioned(
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
                                } else {
                                  _controller.play();
                                }
                              });
                            },
                            onDoubleTap: () {
                              setState(() {
                                isVisible = false;
                                showSkipBack = true;
                                _controller.seekTo(Duration(
                                    milliseconds: (widget.controller.value
                                                .position.inMilliseconds -
                                            10000)
                                        .toInt()));
                              });
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                setState(() {
                                  isVisible = true;
                                  showSkipBack = false;
                                });
                              });
                            },
                            child: Container(
                              width: width / 2.5,
                              height: isVisible ? height / 3.5 : height,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 65.sp),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.elliptical(
                                    height,
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
                if (!isVisible)
                  Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              isVisible = !isVisible;
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        onDoubleTap: () {
                          setState(() {
                            isVisible = false;
                            showSkipForward = true;
                            _controller.seekTo(Duration(
                                milliseconds: (widget.controller.value.position
                                            .inMilliseconds +
                                        10000)
                                    .toInt()));
                          });
                          Future.delayed(const Duration(milliseconds: 300), () {
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
                          child: Container(
                            width: width / 2.5,
                            height: isVisible ? height / 3.5 : height,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 65.sp),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.elliptical(
                                height,
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
                                      fontSize: 12.sp, color: textPrimary),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
              ]),
        )
      ],
    );
  }
}

class ControlsOverlay extends StatefulWidget {
  const ControlsOverlay({Key? key, required this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  State<StatefulWidget> createState() {
    return _ControlsOverlay();
  }
}

class _ControlsOverlay extends State<ControlsOverlay> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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
              width: 48.sp,
            ),
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
            SizedBox(
              width: 48.sp,
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
          ],
        ),
        if (widget.controller.value.duration.inSeconds -
                widget.controller.value.position.inSeconds <
            10)
          Positioned(
              bottom: 7.sp,
              right: 51.sp,
              child: Row(
                children: [
                  Text(
                    "Next Topic".toUpperCase(),
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: textPrimary,
                        letterSpacing: 2),
                  ),
                  Transform.rotate(
                    angle: -1.3,
                    child: Center(
                        child: Image.asset(
                      "assets/images/down_arrow.png",
                      width: 7.5.sp,
                      height: 12.sp,
                    )),
                  )
                ],
              )),
        if (widget.controller.value.position.inSeconds < -2)
          Positioned(
              bottom: 7.sp,
              right: 51.sp,
              child: Text(
                "Skip Intro".toUpperCase(),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                    letterSpacing: 2),
              )),
        Positioned(
            bottom: 7.sp,
            right: 15.sp,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LandscapeVideoPlayer(
                              controller: widget.controller,
                            )));
              },
              child: Container(
                  width: 24.sp,
                  height: 24.sp,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/fullscreen.png",
                    width: 14.sp,
                    height: 14.sp,
                  )),
            )),
        Positioned(
          bottom: 9.sp,
          left: 15.sp,
          child: Container(
              height: 16.sp,
              alignment: Alignment.center,
              child: Text(
                "${widget.controller.value.position.toString().split('.').first.padLeft(8, "0")} / ${widget.controller.value.duration.toString().split('.').first.padLeft(8, "0")}",
                style: TextStyle(fontSize: 12.sp, color: textPrimary),
              )),
        ),
      ],
    );
  }
}
