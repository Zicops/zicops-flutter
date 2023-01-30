import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/views/screens/profile/widgets/about_info.dart';
import 'package:zicops/views/widgets/GradientButton.dart';

import '../../../models/user/org_model.dart';
import '../../../models/user/user_details_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/validation.dart';
import '../../widgets/PrefixInputField.dart';

class AboutTabScreen extends StatefulWidget {
  AboutTabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AboutTabScreen();
  }
}

class _AboutTabScreen extends State<AboutTabScreen> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  String name = "";
  String phone = "";
  String email = "";

  String orgName = "";
  String orgUnit = "";
  String lspRole = "";
  String orgRole = "";
  String empId = "";

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

  Future getDetailsToDisplay() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonUser =
        jsonDecode(sharedPreferences.getString('user')!);
    var user = UserDetailsModel.fromJson(jsonUser);
    if (jsonUser.isNotEmpty) {
      setState(() {
        name = user.firstName! + " " + user.lastName!;
        phone = user.phone!;
        email = user.email!;
      });
    }
    Map<String, dynamic> jsonOrg =
        jsonDecode(sharedPreferences.getString('userOrg')!);
    var userOrg = OrgModel.fromJson(jsonOrg);
    if (jsonOrg.isNotEmpty) {
      setState(() {
        orgName = userOrg.orgName!;
        orgUnit = userOrg.orgUnit!;
        lspRole = userOrg.lspRole!;
        orgRole = userOrg.orgRole!;
        empId = userOrg.empId!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDetailsToDisplay();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return CustomScrollView(slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: secondaryColorDark),
              child: Column(
                children: [
                  Stack(
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
                  Padding(
                      padding: EdgeInsets.only(
                          left: 20.sp, right: 20.sp, bottom: 20.sp, top: 6.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 53.sp,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 28.sp,
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                        color: textPrimary,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 24.sp,
                                  child: Text(
                                    orgName,
                                    style: TextStyle(
                                        color: textGrey2,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          AboutInfo("Personal", [
                            {
                              "label": "Name.",
                              "controller": TextEditingController(text: name)
                            },
                            {
                              "label": "Phone No.",
                              "controller": TextEditingController(text: phone)
                            },
                            {
                              "label": "Email ID.",
                              "controller": TextEditingController(text: email)
                            },
                          ]),
                          SizedBox(
                            height: 16.sp,
                          ),
                          AboutInfo("Organization", [
                            {
                              "label": "Organization.",
                              "controller": TextEditingController(text: orgName)
                            },
                            {
                              "label": "Organization Unit.",
                              "controller": TextEditingController(text: orgUnit)
                            },
                            {
                              "label": "Role in Organization.",
                              "controller": TextEditingController(text: orgRole)
                            },
                            {
                              "label": "Employee ID.",
                              "controller": TextEditingController(text: empId)
                            },
                            {
                              "label": "Learning Space Role.",
                              "controller": TextEditingController(text: lspRole)
                            },
                            {
                              "label": "Base Cohort.",
                              "controller":
                                  TextEditingController(text: "IT Development")
                            },
                          ]),
                        ],
                      ))
                ],
              ),
            ))
      ]);
    });
  }
}
