import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/screens/account_setup/account_setup_screen.dart';
import 'package:zicops/views/screens/forget_pass/forget_pass_screen.dart';
import 'package:zicops/views/screens/home/home.dart';
import 'package:zicops/views/widgets/GradientButton.dart';

import '../../../controllers/controller.dart';
import '../../../graphql_api.graphql.dart';
import '../../../main.dart';
import '../../../models/user/user_details_model.dart';
import '../../../state/mobx_store.dart';
import '../../../utils/validation.dart';
import '../../widgets/CustomPassword.dart';
import '../../widgets/PrefixInputField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class HttpClientWithToken extends http.BaseClient {
  HttpClientWithToken(this.token);

  final String token;
  final http.Client _client = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = 'Bearer ' + token;
    return _client.send(request);
  }
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _controller = Get.find<Controller>();

  // Defining MobX Store
  final _zStore = ZStore();

  bool _passwordVisible = false;
  bool showErrorP = false;
  String errorMsgP = "";
  bool _keyboardVisible = false;
  bool isLoading = false;
  bool isEmailValidated = false;

  Future firebaseLogin() async {
    //TODO: In future, make service files for handling all the API calls and other services instead of writing them in the UI file
    setState(() {
      isLoading = true;
    });
    try {
      //Instance for Share preferences
      final prefs = await SharedPreferences.getInstance();

      String lspId = '93f3693c-d111-51aa-86ca-b883c6dfe647';

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      if (token != null) {
        await prefs.setString('token', token);
        await prefs.setString('tenant', lspId);
      }

      //Don't know why this line is there
      String token1 =
          'eyJhbGciOiJSUzI1NiIsImtpZCI6Ijg3NTNiYmFiM2U4YzBmZjdjN2ZiNzg0ZWM5MmY5ODk3YjVjZDkwN2QiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vemljb3BzLW9uZSIsImF1ZCI6InppY29wcy1vbmUiLCJhdXRoX3RpbWUiOjE2NzIxNjE1MDksInVzZXJfaWQiOiJwMkhSUXZtakJZV1llakRpSDByRERPb3ZUOVQyIiwic3ViIjoicDJIUlF2bWpCWVdZZWpEaUgwckRET292VDlUMiIsImlhdCI6MTY3MjE2MTUwOSwiZXhwIjoxNjcyMTY1MTA5LCJlbWFpbCI6ImFua2l0K2FqQHppY29wcy5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInBob25lX251bWJlciI6Iis5MTY2Njk2OTY5NjkiLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7InBob25lIjpbIis5MTY2Njk2OTY5NjkiXSwiZW1haWwiOlsiYW5raXQrYWpAemljb3BzLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.XCtFXD2fS5Ve0HCzOYkkM_FMJnYm9OIzEaO0-BSpWW7YlkqSVgkimvK_JJrVGs77Aps2ki1y6MpWt2tTjv3Z6eLAb4L393N7O3m3INFS3QDoBUOmEI7dN2-qM4lQAp9v_wGf4BpcmNqxqTepWY4DUk2anX5Nf5GoSv-mbaCQM009DVHkTXy8S29L6QgOa997IMSLD0NgouAEopP2rfff-NPicvBSOQN35FZ56V6Wh7cczRWHk40MpaO54goXL-aBZyFOyPGJh_l5VlFlnfMzv8JMMZaDMI1E7XUm9QxfQMjEyV8psqo93v_6dDanT5J_bYxIsMNrb3UCvje2nxTxvw';
      IdTokenResult? tokenResult =
          await FirebaseAuth.instance.currentUser?.getIdTokenResult();

      // Queries for user details and lsp details
      final userResult = await userClient.client()?.execute(LoginMutation());

      // Getting LSP details which is paginated
      final lspData = await userClient.client()?.execute(GetUserLspByLspIdQuery(
          variables: GetUserLspByLspIdArguments(
              user_id: userResult?.data?.login?.id ?? '', lsp_id: lspId)));

      // Setting user details in MobX Store

      UserDetailsModel userDetails = UserDetailsModel(
        userResult?.data?.login?.id ?? "",
        userResult?.data?.login?.firstName ?? "",
        userResult?.data?.login?.lastName ?? "",
        userResult?.data?.login?.status ?? "",
        userResult?.data?.login?.role ?? "",
        userResult?.data?.login?.isVerified ?? false,
        userResult?.data?.login?.isActive ?? false,
        userResult?.data?.login?.gender ?? "",
        userResult?.data?.login?.email ?? "",
        userResult?.data?.login?.phone ?? "",
        userResult?.data?.login?.photoUrl ?? "",
        lspData?.data?.getUserLspByLspId?.userLspId ?? '',
      );

      _zStore.setUserDetails(userDetails);

      //Storing userID and lspID in shared preferences
      await prefs.setString('userId', _zStore.userDetailsModel?.id ?? '');
      await prefs.setString('lspId', lspId);
      await prefs.setString(
          'userLspId', lspData?.data?.getUserLspByLspId?.userLspId ?? '');

      //Is this redundant? Only userID and lspID needed or complete data?
      await prefs.setString("userData", userResult!.data!.login.toString());
      await prefs.setString('userLspData',
          lspData?.data?.getUserLspByLspId?.userLspId?.toString() ?? '');

      print("user id: ${_zStore.userDetailsModel?.id}");
      print("user lsp id: ${lspData?.data?.getUserLspByLspId?.userLspId}");

      // String lspId = '8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1';

      // Navigate to AccountSetupScreen if user is not verified else HomePage
      if (_zStore.userDetailsModel?.isVerified == false) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const AccountSetupScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }

      setState(() {
        isLoading = false;
      });

      //TODO: Delete this after removing getx everywhere
      _controller.userDetails = UserDetailsModel(
          userResult.data?.login?.id ?? "",
          userResult.data?.login?.firstName ?? "",
          userResult.data?.login?.lastName ?? "",
          userResult.data?.login?.status ?? "",
          userResult.data?.login?.role ?? "",
          userResult.data?.login?.isVerified ?? false,
          userResult.data?.login?.isActive ?? false,
          userResult.data?.login?.gender ?? "",
          userResult.data?.login?.email ?? "",
          userResult.data?.login?.phone ?? "",
          userResult.data?.login?.photoUrl ?? "",
          lspData?.data?.getUserLspByLspId?.userLspId ?? '');

      return credential;
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
        showErrorP = true;
      });
      print("error-$e");
      if (e.code == 'user-not-found') {
        setState(() {
          errorMsgP = "User Not Found";
        });
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        setState(() {
          errorMsgP = "Incorrect Password";
        });
      } else if (e.code == 'too-many-requests') {
        setState(() {
          errorMsgP = "Too many requests. Try again later.";
        });
      } else {
        setState(() {
          errorMsgP = "Error";
        });
      }
    }
  }

  void _changeVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  onPasswordChange() {
    setState(() {
      if (showErrorP) showErrorP = false;
    });
  }

  final List<FocusNode> _focusNodes = [FocusNode(), FocusNode()];

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.removeListener(() {});
    }
    super.dispose();
  }

  isFocusedOrNotEmpty() {
    return _focusNodes[0].hasFocus ||
        _focusNodes[1].hasFocus ||
        _emailController.text.isNotEmpty ||
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/login_bg.png"),
          fit: BoxFit.fill,
        )),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: isFocusedOrNotEmpty()
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      isFocusedOrNotEmpty()
                          ? Text(
                              'Welcome!',
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textPrimary),
                              textAlign: TextAlign.start,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  Image.asset(
                                    "assets/images/zicops_logo.png",
                                    width: 40.sp,
                                  ),
                                  SizedBox(height: 20.sp),
                                  Image.asset(
                                    "assets/images/zicops_name.png",
                                    width: 120.sp,
                                    height: 20.sp,
                                  ),
                                  SizedBox(height: 20.sp),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      child: Text(
                                        "Sign Into your Learning Space!",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 28.sp,
                                            color: textPrimary,
                                            height: 1.3),
                                        textAlign: TextAlign.center,
                                      )),
                                ])
                    ]),
                SizedBox(height: 4.sp),
                SizedBox(
                    width: isFocusedOrNotEmpty()
                        ? double.infinity
                        : MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "Start your first step to learning here!",
                      style: TextStyle(
                          fontSize: 16.sp, color: textGrey2, height: 1.5),
                      textAlign: isFocusedOrNotEmpty()
                          ? TextAlign.start
                          : TextAlign.center,
                    )),
                SizedBox(height: isFocusedOrNotEmpty() ? 20.sp : 28.sp),
                prefixInputField(_focusNodes[0], _emailController,
                    "assets/images/email.png", "Email", true,
                    validated: isEmailValidated, onChange: (e) {
                  setState(() {
                    isEmailValidated = isValidEmail(e);
                  });
                }),
                SizedBox(height: 12.sp),
                CustomPassword(_focusNodes[1], _passwordController, "Password",
                    showErrorP, errorMsgP,
                    onChange: onPasswordChange()),
                !isFocusedOrNotEmpty()
                    ? SizedBox(
                        height: 20.sp,
                      )
                    : const Spacer(),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPassScreen()));
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: textGrey,
                                    fontSize: 14.sp,
                                    decoration: TextDecoration.underline),
                              ),
                            )),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            firebaseLogin();
                          },
                          child: gradientButton("Login", isLoading: isLoading),
                        )
                      ],
                    ))
                  ],
                ),
                SizedBox(height: _keyboardVisible ? 0 : 35.sp),
                !_keyboardVisible
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Privacy Policy",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: textGrey,
                                decoration: TextDecoration.underline),
                          ),
                          SizedBox(
                            width: 24.sp,
                          ),
                          Text(
                            "Contact Us",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: textGrey,
                                decoration: TextDecoration.underline),
                          )
                        ],
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 20,
                )
              ]))
        ]),
      ),
    ));
  }
}
