import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zicops/blocs/account_setup/account_setup_bloc.dart';
import 'package:zicops/views/widgets/GradientButton.dart';

import '../../../controllers/mutation_controller.dart';
import '../../../repositories/account_setup_repository.dart';
import '../../../utils/colors.dart';
import '../../../utils/validation.dart';
import '../../widgets/PrefixInputField.dart';

class PersonalTabScreen extends StatefulWidget {
  final Function() changeTab;
  const PersonalTabScreen(this.changeTab, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PersonalTabScreen();
  }
}

class _PersonalTabScreen extends State<PersonalTabScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool isEmailValidated = false;

  File? bgImage;
  var profileImage;
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String id = "";
  String? imageUrl = "";

  bool isloading = true;

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
      print(image);
      print(imageTemp);
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
        // catMainLoading();
      });
    }
    // getEmail();
    super.initState();
    // getDetails();
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

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.removeListener(() {});
    }
    super.dispose();
  }

  // getEmail() {
  //   //final email = FirebaseAuth.instance.currentUser?.email;
  //   setState(() {
  //     _emailController.text = email ?? "";
  //     isEmailValidated = email.isNotEmpty ? true : false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AccountSetupBloc(AccountSetupRepository())
        ..add(PersonalTabRequested()),
      child: Scaffold(
        body: BlocConsumer<AccountSetupBloc, AccountSetupState>(
          listener: (context, state) {
            if (state is PersonalTabLoaded) {
              setState(() {
                firstName = state.user.firstName.toString();
                lastName = state.user.lastName.toString();
                email = state.user.email.toString();
                phone = state.user.phone.toString();
                imageUrl = state.user.photoUrl.toString();
              });
              id = state.user.id.toString();
              _firstNameController.text = firstName;
              _lastNameController.text = lastName;
              _emailController.text = email;
              _phoneController.text = phone;
            }
          },
          builder: (context, state) {
            if (state is PersonalTabError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            return SafeArea(
              child: KeyboardVisibilityBuilder(
                  builder: (context, isKeyboardVisible) {
                return CustomScrollView(slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        if (isKeyboardVisible)
                          const SizedBox.shrink()
                        else
                          Stack(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 85.sp),
                                  child: bgImage != null
                                      ? Image.file(
                                          bgImage!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 100.sp,
                                        )
                                      : Image.asset(
                                          "assets/images/personal_bg.png",
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 100.sp,
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
                                          : NetworkImage(
                                              imageUrl ??
                                                  "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                                            ),
                                      radius: 56.sp,
                                    ),
                                  ),
                                ),
                              ),
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
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Image.asset(
                                          "assets/images/camera.png",
                                          width: 20.sp,
                                          height: 20.sp,
                                        )),
                                  )),
                            ],
                          ),
                        isKeyboardVisible
                            ? const SizedBox.shrink()
                            : const Spacer(),
                        BlocBuilder<AccountSetupBloc, AccountSetupState>(
                          builder: (context, state) {
                            if (state is PersonalTabLoading) {
                              return CircularProgressIndicator();
                            }
                            return Container();
                          },
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 20,
                                top: isKeyboardVisible ? 20 : 45),
                            child: Column(
                              children: [
                                prefixInputField(
                                  _focusNodes[0],
                                  _firstNameController,
                                  "assets/images/person.png",
                                  "Firstname",
                                  true,
                                ),
                                const SizedBox(height: 12),
                                prefixInputField(
                                  _focusNodes[1],
                                  _lastNameController,
                                  "assets/images/person.png",
                                  "Lastname",
                                  true,
                                ),
                                const SizedBox(height: 12),
                                prefixInputField(
                                    _focusNodes[2],
                                    _emailController,
                                    "assets/images/email.png",
                                    "Email",
                                    false,
                                    validated: isEmailValidated =
                                        email.isNotEmpty ? true : false,
                                    onChange: (e) {
                                  setState(() {
                                    isEmailValidated = isValidEmail(e);
                                  });
                                }),
                                const SizedBox(height: 12),
                                prefixInputField(
                                    _focusNodes[3],
                                    _phoneController,
                                    "assets/images/phone.png",
                                    "+91 | Contact Number",
                                    true,
                                    inputType: TextInputType.phone),
                                const SizedBox(height: 12),
                                GestureDetector(
                                  onTap: () async {
                                    print(profileImage);
                                    if (profileImage != null) {
                                      var byteData =
                                          profileImage.readAsBytesSync();
                                      var multipartFile =
                                          MultipartFile.fromBytes(
                                              'photo', byteData,
                                              filename: profileImage.path
                                                  .split('/')
                                                  .last,
                                              contentType:
                                                  MediaType('image', 'png'));
                                      updateUser(
                                        id,
                                        _firstNameController.text,
                                        _lastNameController.text,
                                        _emailController.text,
                                        _phoneController.text,
                                        multipartFile,
                                      );
                                    } else {
                                      updateUser(
                                        id,
                                        _firstNameController.text,
                                        _lastNameController.text,
                                        _emailController.text,
                                        _phoneController.text,
                                        null,
                                      );
                                    }

                                    widget.changeTab();
                                  },
                                  child: GradientButton("Next"),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ]);
              }),
            );
          },
        ),
      ),
    );
  }
}
