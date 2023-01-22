import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user/user_details_model.dart';
import '../../../utils/colors.dart';
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
  File? bgImage;
  File? profileImage;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
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
      //print(user?.firstName);
      // print(user.email);
      setState(() {
        firstName = user.firstName;
        lastName = user.lastName;
        email = user.email;
        phone = user.phone;
      });

      // print(firstName);
      //set the sharedPreferences saved data to TextField
      // _name.value =  TextEditingValue(text: user.name);
      // _email.value =  TextEditingValue(text: user.email);
      // _phone.value =  TextEditingValue(text: user.phone);
    }
    // print(user.firstName);
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.removeListener(() {});
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 85),
                    child: bgImage != null
                        ? Image.file(
                            bgImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 120,
                          )
                        : Image.asset(
                            "assets/images/personal_bg.png",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 120,
                          )),
                Positioned(
                    top: 64,
                    left: 20,
                    child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            pickProfileImage();
                          });
                        },
                        child: CircleAvatar(
                          foregroundImage: profileImage != null
                              ? FileImage(profileImage!) as ImageProvider
                              : const AssetImage(
                                  "assets/images/avatar_default.png"),
                          radius: 60,
                        ))),
                Positioned(
                    top: 82,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          pickBgImage();
                        });
                      },
                      child: Image.asset(
                        "assets/images/camera.png",
                        width: 20,
                        height: 20,
                      ),
                    )),
                Positioned(
                    top: 146,
                    left: 105,
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
                            width: 20,
                            height: 20,
                          )),
                    )),
              ],
            ),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 80),
                child: Column(
                  children: [
                    prefixInputField(_focusNodes[0], _controller,
                        "assets/images/person.png", "Firstname", firstName!),
                    const SizedBox(height: 12),
                    prefixInputField(_focusNodes[1], _controller,
                        "assets/images/person.png", "Lastname", lastName ?? ""),
                    const SizedBox(height: 12),
                    prefixInputField(_focusNodes[2], _controller,
                        "assets/images/email.png", "Email", email ?? ""),
                    const SizedBox(height: 12),
                    prefixInputField(
                        _focusNodes[3],
                        _controller,
                        "assets/images/phone.png",
                        "+91| Contact Number",
                        phone ?? ""),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        widget.changeTab();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [primaryColor, gradientTwo]),
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          'Next'.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      )
    ]);
  }
}
