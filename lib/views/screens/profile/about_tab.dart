import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zicops/blocs/profile/profile_bloc.dart';
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

  // Get UserStore
  // final _zStore = ZStore();

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
  //
  // Future getDetailsToDisplay() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //
  //   // print("id: ${_zStore.userDetailsModel?.id!}");
  //   // var user = _zStore.userDetailsModel;
  //
  //   setState(() {
  //     // userId = user?.id!;
  //     name = zStoreInstance.userDetailsModel.firstName! +
  //         " " +
  //         zStoreInstance.userDetailsModel.lastName!;
  //     phone = zStoreInstance.userDetailsModel.phone!;
  //     email = zStoreInstance.userDetailsModel.email!;
  //     imageUrl = zStoreInstance.userDetailsModel.photoUrl!;
  //   });
  //   userId = prefs.getString('userId')!;
  //   userLspId = prefs.getString('userLspId')!;
  //   Map<String, dynamic> jsonOrg = jsonDecode(prefs.getString('userOrg')!);
  //   var userOrg = OrgModel.fromJson(jsonOrg);
  //   if (jsonOrg.isNotEmpty) {
  //     setState(() {
  //       orgName = userOrg.orgName!;
  //       orgUnit = userOrg.orgUnit!;
  //       lspRole = userOrg.lspRole!;
  //       // orgRole = userOrg.orgRole!;
  //       // empId = userOrg.empId!;
  //     });
  //   }
  //
  //   final userResult = await userClient.client()?.execute(GetUserDetailsQuery(
  //       variables: GetUserDetailsArguments(userId: [userId])));
  //
  //   print(userResult?.data?.getUserDetails![0]?.firstName);
  //
  //   // if (userResult?.data?.getUserDetails != null) {
  //   //   setState(() {
  //   //     name = userResult!.data!.getUserDetails?[0]?.firstName;
  //   //     phone = userResult!.data!.getUserDetails?[0]?.phone!;
  //   //     email = userResult!.data!.getUserDetails?[0]?.email!;
  //   //   });
  //   // }
  //
  //   // print(name);
  //   // print(phone);
  //   // print(email);
  //
  //   print('firestName is');
  //
  //   print(zStoreInstance.userDetailsModel.firstName!);
  //
  //   final orgResult = await userClient.client()?.execute(GetUserOrgDetailsQuery(
  //           variables: GetUserOrgDetailsArguments(
  //         userId: userId!,
  //         user_lsp_id: userLspId,
  //       )));
  //   if (orgResult?.data?.getUserOrgDetails != null) {
  //     setState(() {
  //       // orgName = orgResult!.data!.getUserOrgDetails?.orgName!;
  //       // orgUnit = orgResult!.data!.getUserOrgDetails?[0]?.orgUnit!;
  //       // lspRole = orgResult!.data!.getUserOrgDetails?[0]?.lspRole!;
  //       orgRole = orgResult!.data!.getUserOrgDetails?.organizationRole;
  //       empId = orgResult.data!.getUserOrgDetails?.employeeId;
  //       // empId = orgResult!.data!.getUserOrgDetails?[0]?.empId!;
  //     });
  //   }
  //
  //   // print(orgRole);
  //   // print(empId);
  //
  //   if (imageUrl != null && imageUrl!.isNotEmpty) {
  //     profileImage = await urlToFile(imageUrl!);
  //   }
  // }

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
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is AboutDetailsLoading) {
                      return Center(child: CircularProgressIndicator());
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
                                      "label": "Employee ID.",
                                      "controller": TextEditingController(
                                          text: state.org.empId)
                                    },
                                    {
                                      "label": "Learning Space Role.",
                                      "controller": TextEditingController(
                                          text: state.org.lspRole)
                                    },
                                    {
                                      "label": "Base Cohort.",
                                      "controller": TextEditingController(
                                          text: "IT Development")
                                    },
                                  ]),
                                ],
                              )),
                        ],
                      );
                    }
                    if (state is AboutDetailsError) {
                      return Center(child: Text(state.message));
                    }
                    return Container();
                  },
                ),
              ),
            ))
      ]);
    });
  }
}
