import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/graphql_api.graphql.dart';
import 'package:zicops/main.dart';
import 'package:zicops/views/screens/profile/widgets/about_info.dart';
import 'package:zicops/views/widgets/GradientButton.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
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

  String? name = "";
  String? phone = "";
  String? email = "";

  String? imageUrl = "";

  String orgName = "";
  String orgUnit = "";
  String lspRole = "";
  String orgRole = "";
  String empId = "";
  String userLspId = "";

  bool isEmailValidated = false;

  File? bgImage;
  var profileImage;
  Future pickBgImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      print(imageTemp);
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

  Future<File> urlToFile(String imageUrl) async {
    var rng = Random();

    Directory tempDir = await getTemporaryDirectory();

    String tempPath = tempDir.path;

    File file = File(tempPath + (rng.nextInt(100)).toString() + '.png');

    http.Response response = await http.get(Uri.parse(imageUrl));

    await file.writeAsBytes(response.bodyBytes);

    return file;
  }

  Future getDetailsToDisplay() async {
    String userId = "";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonUser =
        jsonDecode(sharedPreferences.getString('user')!);
    var user = UserDetailsModel.fromJson(jsonUser);
    if (jsonUser.isNotEmpty) {
      setState(() {
        userId = user.id!;
        name = user.firstName! + " " + user.lastName!;
        phone = user.phone!;
        email = user.email!;
        imageUrl = user.photoUrl!;
      });
    }
    userLspId = sharedPreferences.getString('userLspId')!;
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

    final userResult = await userClient.client()?.execute(GetUserDetailsQuery(
        variables: GetUserDetailsArguments(userId: [userId])));
    if (userResult?.data?.getUserDetails != null) {
      setState(() {
        // name = userResult!.data!.getUserDetails?[0]?.firstName!;
        // phone = userResult!.data!.getUserDetails?[0]?.phone!;
        // email = userResult!.data!.getUserDetails?[0]?.email!;
      });
    }

    print(name);
    print(phone);
    print(email);

    final orgResult = await userClient.client()?.execute(GetUserOrgDetailsQuery(
            variables: GetUserOrgDetailsArguments(
          userId: userId,
          user_lsp_id: userLspId,
        )));
    // if (orgResult?.data?.getUserOrgDetails != null) {
    //   setState(() {
    //     orgName = orgResult!.data!.getUserOrgDetails?.orgName!;
    //     orgUnit = orgResult!.data!.getUserOrgDetails?[0]?.orgUnit!;
    //     lspRole = orgResult!.data!.getUserOrgDetails?[0]?.lspRole!;
    //     orgRole = orgResult!.data!.getUserOrgDetails?[0]?.orgRole!;
    //     empId = orgResult!.data!.getUserOrgDetails?[0]?.empId!;
    //   });
    // }

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      profileImage = await urlToFile(imageUrl!);
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
                                    child: AspectRatio(
                                      aspectRatio: 1 / 1,
                                      child: ClipOval(
                                        child: FadeInImage(
                                          placeholder: const AssetImage(
                                              "assets/images/avatar_default.png"),
                                          image: profileImage != null
                                              ? FileImage(profileImage!)
                                                  as ImageProvider
                                              : const AssetImage(
                                                  "assets/images/avatar_default.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    radius: 56.sp,
                                  )))),

                      // child: CircleAvatar(
                      //
                      //   foregroundImage: profileImage != null
                      //       ? FileImage(profileImage!)
                      //           as ImageProvider
                      //       : const AssetImage(
                      //           "assets/images/avatar_default.png"),
                      //   radius: 56.sp,
                      // )))),
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
                                    name!,
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
