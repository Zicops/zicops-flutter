import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/graphql_api.graphql.dart';
import 'package:zicops/main.dart';
import 'package:zicops/views/screens/account_setup/models/category.dart';
import 'package:zicops/views/widgets/GradientButton.dart';

import '../../../models/user/user_details_model.dart';
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
  TextEditingController _controller = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  bool isEmailValidated = false;

  File? bgImage;
  File? profileImage;
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String id = "";
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

  Future catMainLoading() async {
    print('function called');
    final result = await courseQClient.client()?.execute(AllCatMainQuery(
        variables: AllCatMainArguments(
            lsp_ids: ['8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1'])));

    int i = 0;
    // if (result?.data?.allCatMain != null) {
    // final allCatMainResult = result?.data?.toJson();
    // result?.data?.toJson();
    Map<String, dynamic>? allCatMainsResult = result?.data?.toJson();
    print(allCatMainsResult);
    List<AllCat> cats = [];
    allCatMainsResult?['allCatMain']?.forEach((e) {
      // print(e);
      setState(() {
        cats.add(AllCat(
            e['id'], e["Name"], e["Description"], e["Code"], e["ImageUrl"]));
      });
    });

    print(cats);
    // }
    // while (result?.data?.allCatMain != null) {
    //   //await Future.delayed(Duration(seconds: 1));
    //   print(result?.data?.allCatMain![i]);
    //   i++;
    // }
    //print(result?.data.toString());
    //print('object');
  }

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
        // catMainLoading();
      });
    }
    getEmail();
    super.initState();
    getDetails();
  }

  Future getDetails() async {
    print('getdetails');

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonDetails =
        jsonDecode(sharedPreferences.getString('user')!);
    var user = UserDetailsModel.fromJson(jsonDetails);
    if (jsonDetails.isNotEmpty) {
      print(user.firstName);
      // print(user.email);
      setState(() {
        id = user.id.toString();
        firstName = user.firstName.toString();
        lastName = user.lastName.toString();
        email = user.email.toString();
        phone = user.phone.toString();
      });

      //set the sharedPreferences saved data to TextField
      // _name.value =  TextEditingValue(text: user.name);
      // _email.value =  TextEditingValue(text: user.email);
      // _phone.value =  TextEditingValue(text: user.phone);
    }
    setState(() {
      _firstNameController.text = firstName;
      _lastNameController.text = lastName;
      _emailController.text = email;
      _phoneController.text = phone;
    });
    // print(user.firstName);
    print('hello');
    print(firstName);
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
                      prefixInputField(_focusNodes[0], _firstNameController,
                          "assets/images/person.png", "Firstname"),
                      const SizedBox(height: 12),
                      prefixInputField(_focusNodes[1], _lastNameController,
                          "assets/images/person.png", "Lastname"),
                      const SizedBox(height: 12),
                      prefixInputField(_focusNodes[2], _emailController,
                          "assets/images/email.png", "Email",
                          validated: isEmailValidated, onChange: (e) {
                        setState(() {
                          isEmailValidated = isValidEmail(e);
                        });
                      }),
                      const SizedBox(height: 12),
                      prefixInputField(_focusNodes[3], _phoneController,
                          "assets/images/phone.png", "+91 | Contact Number",
                          inputType: TextInputType.phone),
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
