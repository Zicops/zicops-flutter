import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zicops/blocs/profile/profile_bloc.dart';
import 'package:zicops/controllers/mutation_controller.dart';
import 'package:zicops/repositories/profile_repository.dart';
import 'package:zicops/views/screens/profile/widgets/about_info.dart';

import '../../../utils/colors.dart';

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

  // Variables for user details
  String? userId = "";
  String? firstName = "";
  String? lastName = "";
  String? name = "";
  String? phone = "";
  String? email = "";
  String? imageUrl = "";

  // Variables for org details
  String orgName = "";
  String orgUnit = "";
  String lspRole = "";
  String? orgRole = "";
  String? empId = "";
  String userLspId = "";

  bool isEmailValidated = false;

  File? bgImage;
  var profileImage;

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
      var byteData = profileImage.readAsBytesSync();
      var multipartFile = MultipartFile.fromBytes('photo', byteData,
          filename: profileImage.path.split('/').last,
          contentType: MediaType('image', 'png'));
      updateUser(userId!, firstName!, lastName!, email!, phone!, multipartFile);
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

  @override
  void initState() {
    super.initState();
    //  getDetailsToDisplay();
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
                child: BlocProvider(
                  create: (context) => ProfileBloc(ProfileRepository())
                    ..add(AboutDetailsRequested()),
                  child: BlocConsumer<ProfileBloc, ProfileState>(
                    listener: (context, state) {
                      if (state is AboutDetailsLoaded) {
                        setState(() {
                          userId = state.user.id;
                          firstName = state.user.firstName;
                          lastName = state.user.lastName;
                          name = state.user.firstName! +
                              " " +
                              state.user.lastName!;
                          phone = state.user.phone;
                          email = state.user.email;
                          imageUrl = state.user.photoUrl;
                          orgName = state.org.orgName;
                          orgUnit = state.org.lspName;
                          lspRole = state.org.lspRole;
                          orgRole = state.org.orgRole;
                          empId = state.org.empId;
                          // userLspId = state.org.lspId!;
                        });
                      }
                    },
                    builder: (context, state) {
                      if (state is AboutDetailsLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is AboutDetailsLoaded) {
                        return Column(
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
                                        ),
                                ),
                                // TODO: Check for image and its manipulation
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
                                                  : NetworkImage(
                                                      state.user.photoUrl!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
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
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 20.sp,
                                    right: 20.sp,
                                    bottom: 20.sp,
                                    top: 6.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 53.sp,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 28.sp,
                                            child: Text(
                                              state.user.firstName! +
                                                  " " +
                                                  state.user.lastName!,
                                              style: TextStyle(
                                                  color: textPrimary,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24.sp,
                                            child: Text(
                                              state.org.orgName,
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
                                        "controller": TextEditingController(
                                            text: state.user.firstName! +
                                                " " +
                                                state.user.lastName!)
                                      },
                                      {
                                        "label": "Phone No.",
                                        "controller": TextEditingController(
                                            text: state.user.phone)
                                      },
                                      {
                                        "label": "Email ID.",
                                        "controller": TextEditingController(
                                            text: state.user.email)
                                      },
                                      {
                                        "label": "Gender",
                                        "controller": TextEditingController(
                                            text: state.user.gender)
                                      },
                                    ]),
                                    SizedBox(
                                      height: 16.sp,
                                    ),
                                    AboutInfo("Organization", [
                                      {
                                        "label": "Organization.",
                                        "controller": TextEditingController(
                                            text: state.org.orgName)
                                      },
                                      {
                                        "label": "Organization Unit.",
                                        "controller": TextEditingController(
                                            text: state.org.lspName)
                                      },
                                      {
                                        "label": "Role in Organization.",
                                        "controller": TextEditingController(
                                            text: state.org.orgRole)
                                      },
                                      {
                                        "label": "Learning Space Role.",
                                        "controller": TextEditingController(
                                            text: state.org.lspRole)
                                      },
                                      {
                                        "label": "Employee ID.",
                                        "controller": TextEditingController(
                                            text: state.org.empId)
                                      },
                                    ]),
                                  ],
                                )),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                  // child: BlocBuilder<ProfileBloc, ProfileState>(
                  //   builder: (context, state) {
                  //     if (state is AboutDetailsLoading) {
                  //       return Center(child: CircularProgressIndicator());
                  //     }
                  //     if (state is AboutDetailsLoaded) {
                  //       return Column(
                  //         children: [
                  //           Stack(
                  //             children: [
                  //               Padding(
                  //                 padding: EdgeInsets.only(bottom: 85.sp),
                  //                 child: bgImage != null
                  //                     ? Image.file(
                  //                         bgImage!,
                  //                         fit: BoxFit.cover,
                  //                         width: double.infinity,
                  //                         height: 120.sp,
                  //                       )
                  //                     : Image.asset(
                  //                         "assets/images/personal_bg.png",
                  //                         fit: BoxFit.cover,
                  //                         width: double.infinity,
                  //                         height: 120.sp,
                  //                       ),
                  //               ),
                  //               // TODO: Check for image and its manipulation
                  //               Positioned(
                  //                 top: 64.sp,
                  //                 left: 20.sp,
                  //                 child: GestureDetector(
                  //                   behavior: HitTestBehavior.translucent,
                  //                   onTap: () {
                  //                     setState(() {
                  //                       pickProfileImage();
                  //                     });
                  //                   },
                  //                   child: CircleAvatar(
                  //                     radius: 60.sp,
                  //                     backgroundColor: secondaryColorDark,
                  //                     child: CircleAvatar(
                  //                       child: AspectRatio(
                  //                         aspectRatio: 1 / 1,
                  //                         child: ClipOval(
                  //                           child: FadeInImage(
                  //                             placeholder: const AssetImage(
                  //                                 "assets/images/avatar_default.png"),
                  //                             image: profileImage != null
                  //                                 ? FileImage(profileImage!)
                  //                                     as ImageProvider
                  //                                 : NetworkImage(
                  //                                     state.user.photoUrl!),
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       radius: 56.sp,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               Positioned(
                  //                   top: 82.sp,
                  //                   right: 20.sp,
                  //                   child: GestureDetector(
                  //                     onTap: () {
                  //                       setState(() {
                  //                         pickBgImage();
                  //                       });
                  //                     },
                  //                     child: Image.asset(
                  //                       "assets/images/camera.png",
                  //                       width: 20.sp,
                  //                       height: 20.sp,
                  //                     ),
                  //                   )),
                  //               Positioned(
                  //                   top: 147.sp,
                  //                   left: 108.sp,
                  //                   child: GestureDetector(
                  //                     behavior: HitTestBehavior.translucent,
                  //                     onTap: () {
                  //                       setState(() {
                  //                         pickProfileImage();
                  //                       });
                  //                     },
                  //                     child: Container(
                  //                         padding: const EdgeInsets.all(5),
                  //                         decoration: BoxDecoration(
                  //                             color: textGrey.withOpacity(0.2),
                  //                             borderRadius:
                  //                                 BorderRadius.circular(50)),
                  //                         child: Image.asset(
                  //                           "assets/images/camera.png",
                  //                           width: 20.sp,
                  //                           height: 20.sp,
                  //                         )),
                  //                   )),
                  //             ],
                  //           ),
                  //           Padding(
                  //               padding: EdgeInsets.only(
                  //                   left: 20.sp,
                  //                   right: 20.sp,
                  //                   bottom: 20.sp,
                  //                   top: 6.sp),
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   SizedBox(
                  //                     width: double.infinity,
                  //                     height: 53.sp,
                  //                     child: Column(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         SizedBox(
                  //                           height: 28.sp,
                  //                           child: Text(
                  //                             state.user.firstName! +
                  //                                 " " +
                  //                                 state.user.lastName!,
                  //                             style: TextStyle(
                  //                                 color: textPrimary,
                  //                                 fontSize: 20.sp,
                  //                                 fontWeight: FontWeight.w500),
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           height: 24.sp,
                  //                           child: Text(
                  //                             state.org.orgName,
                  //                             style: TextStyle(
                  //                                 color: textGrey2,
                  //                                 fontSize: 16.sp,
                  //                                 fontWeight: FontWeight.w500),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: 8.sp,
                  //                   ),
                  //                   AboutInfo("Personal", [
                  //                     {
                  //                       "label": "Name.",
                  //                       "controller": TextEditingController(
                  //                           text: state.user.firstName! +
                  //                               " " +
                  //                               state.user.lastName!)
                  //                     },
                  //                     {
                  //                       "label": "Phone No.",
                  //                       "controller": TextEditingController(
                  //                           text: state.user.phone)
                  //                     },
                  //                     {
                  //                       "label": "Email ID.",
                  //                       "controller": TextEditingController(
                  //                           text: state.user.email)
                  //                     },
                  //                     {
                  //                       "label": "Gender",
                  //                       "controller": TextEditingController(
                  //                           text: state.user.gender)
                  //                     },
                  //                   ]),
                  //                   SizedBox(
                  //                     height: 16.sp,
                  //                   ),
                  //                   AboutInfo("Organization", [
                  //                     {
                  //                       "label": "Organization.",
                  //                       "controller": TextEditingController(
                  //                           text: state.org.orgName)
                  //                     },
                  //                     {
                  //                       "label": "Organization Unit.",
                  //                       "controller": TextEditingController(
                  //                           text: state.org.lspName)
                  //                     },
                  //                     {
                  //                       "label": "Role in Organization.",
                  //                       "controller": TextEditingController(
                  //                           text: state.org.orgRole)
                  //                     },
                  //                     {
                  //                       "label": "Learning Space Role.",
                  //                       "controller": TextEditingController(
                  //                           text: state.org.lspRole)
                  //                     },
                  //                     {
                  //                       "label": "Employee ID.",
                  //                       "controller": TextEditingController(
                  //                           text: state.org.empId)
                  //                     },
                  //                   ]),
                  //                 ],
                  //               )),
                  //         ],
                  //       );
                  //     }
                  //     if (state is AboutDetailsError) {
                  //       return Center(child: Text(state.message));
                  //     }
                  //     return Container();
                  //   },
                  // ),
                )))
      ]);
    });
  }
}
