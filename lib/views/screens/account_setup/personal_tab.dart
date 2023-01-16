import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zicops/graphql_api.graphql.dart';
import 'package:zicops/main.dart';
import 'package:zicops/views/screens/account_setup/models/category.dart';

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
      cats.add(AllCat(
          e['id'], e["Name"], e["Description"], e["Code"], e["ImageUrl"]));
    });

    print(cats[0]);
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
    super.initState();
    catMainLoading();
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
                        "assets/images/person.png", "Firstname"),
                    const SizedBox(height: 12),
                    prefixInputField(_focusNodes[1], _controller,
                        "assets/images/person.png", "Lastname"),
                    const SizedBox(height: 12),
                    prefixInputField(_focusNodes[2], _controller,
                        "assets/images/email.png", "Email"),
                    const SizedBox(height: 12),
                    prefixInputField(_focusNodes[3], _controller,
                        "assets/images/phone.png", "+91| Contact Number"),
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
