import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                bgImage != null
                    ? Image.file(
                        bgImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: _height * 0.25,
                      )
                    : Image.asset(
                        "assets/images/personal_bg.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: _height * 0.25,
                      ),
                Positioned(
                    bottom: -50,
                    left: 20,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            pickProfileImage();
                          });
                        },
                        child: CircleAvatar(
                          foregroundImage: profileImage != null
                              ? FileImage(profileImage!) as ImageProvider
                              : const AssetImage(
                                  "assets/images/personal_bg.png"),
                          radius: 56,
                        ))),
                Positioned(
                    bottom: 20,
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
                    bottom: -40,
                    left: 108,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          pickProfileImage();
                        });
                      },
                      child: Image.asset(
                        "assets/images/camera.png",
                        width: 20,
                        height: 20,
                      ),
                    )),
              ],
            ),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 80),
                child: Column(
                  children: [
                    prefixInputField(
                        _controller, "assets/images/person.png", "Firstname"),
                    const SizedBox(height: 12),
                    prefixInputField(
                        _controller, "assets/images/person.png", "Lastname"),
                    const SizedBox(height: 12),
                    prefixInputField(
                        _controller, "assets/images/email.png", "Email"),
                    const SizedBox(height: 12),
                    prefixInputField(_controller, "assets/images/phone.png",
                        "+91| Contact Number"),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        print("on login");
                        widget.changeTab();
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [primaryColor, gradientTwo]),
                            borderRadius: BorderRadius.circular(5)),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 16),
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
                    ),
                  ],
                ))
          ],
        ),
      )
    ]);
  }
}
