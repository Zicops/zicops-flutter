import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zicops/views/widgets/GradientButton.dart';

import '../../../utils/colors.dart';
import '../../../utils/validation.dart';
import '../../widgets/PrefixInputField.dart';

class PersonalTabScreen extends StatefulWidget {
  Function() changeTab;
  PersonalTabScreen(this.changeTab, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PersonalTabScreen();
  }
}

class _PersonalTabScreen extends State<PersonalTabScreen> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  bool isEmailValidated = false;

  File? bgImage;
  File? profileImage;
  Future pickBgImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => bgImage = imageTemp);
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => profileImage = imageTemp);
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    getEmail();
    super.initState();
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.removeListener(() {});
    }
    super.dispose();
  }

  getEmail() async {
    final email = FirebaseAuth.instance.currentUser?.email;
    setState(() {
      _controller3.text = email ?? "";
      isEmailValidated = email != null && email.isNotEmpty ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              isKeyboardVisible
                  ? const SizedBox.shrink()
                  : Stack(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 85.sp),
                            child: bgImage != null
                                ? Image.file(
                                    bgImage!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 120.sp,
                                  )
                                : Image.asset(
                                    "assets/images/personal_bg.png",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 120.sp,
                                  )),
                        Positioned(
                            top: 64.sp,
                            left: 20.sp,
                            child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  setState(() {
                                    pickProfileImage();
                                  });
                                },
                                child: CircleAvatar(
                                    radius: 60.sp,
                                    backgroundColor: secondaryColorDark,
                                    child: CircleAvatar(
                                      foregroundImage: profileImage != null
                                          ? FileImage(profileImage!)
                                              as ImageProvider
                                          : const AssetImage(
                                              "assets/images/avatar_default.png"),
                                      radius: 56.sp,
                                    )))),
                        Positioned(
                            top: 82.sp,
                            right: 20.sp,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  pickBgImage();
                                });
                              },
                              child: Image.asset(
                                "assets/images/camera.png",
                                width: 20.sp,
                                height: 20.sp,
                              ),
                            )),
                        Positioned(
                            top: 147.sp,
                            left: 108.sp,
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  pickProfileImage();
                                });
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: textGrey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Image.asset(
                                    "assets/images/camera.png",
                                    width: 20.sp,
                                    height: 20.sp,
                                  )),
                            )),
                      ],
                    ),
              isKeyboardVisible ? const SizedBox.shrink() : const Spacer(),
              Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                      top: isKeyboardVisible ? 20 : 80),
                  child: Column(
                    children: [
                      prefixInputField(_focusNodes[0], _controller1,
                          "assets/images/person.png", "Firstname"),
                      const SizedBox(height: 12),
                      prefixInputField(_focusNodes[1], _controller2,
                          "assets/images/person.png", "Lastname"),
                      const SizedBox(height: 12),
                      prefixInputField(_focusNodes[2], _controller3,
                          "assets/images/email.png", "Email",
                          validated: isEmailValidated, onChange: (e) {
                        setState(() {
                          isEmailValidated = isValidEmail(e);
                        });
                      }),
                      const SizedBox(height: 12),
                      prefixInputField(_focusNodes[3], _controller4,
                          "assets/images/phone.png", "+91 | Contact Number", inputType: TextInputType.phone),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          widget.changeTab();
                        },
                        child: gradientButton("Next"),
                      ),
                    ],
                  ))
            ],
          ),
        )
      ]);
    });
  }
}
