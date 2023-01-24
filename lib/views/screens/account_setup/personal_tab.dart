import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/mutation_controller.dart';
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
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
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
                  prefixInputField(_focusNodes[0], _firstNameController,
                      "assets/images/person.png", "Firstname"),
                  const SizedBox(height: 12),
                  prefixInputField(_focusNodes[1], _lastNameController,
                      "assets/images/person.png", "Lastname"),
                  const SizedBox(height: 12),
                  prefixInputField(_focusNodes[2], _emailController,
                      "assets/images/email.png", "Email"),
                  const SizedBox(height: 12),
                  prefixInputField(
                    _focusNodes[3],
                    _phoneController,
                    "assets/images/phone.png",
                    "+91| Contact Number",
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      updateUser(
                        id,
                        _firstNameController.text,
                        _lastNameController.text,
                        _emailController.text,
                        _phoneController.text,
                      );
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
              ),
            )
          ],
        ),
      )
    ]);
  }
}
