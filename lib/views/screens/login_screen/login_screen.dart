import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/screens/account_setup/account_setup_screen.dart';
import 'package:zicops/views/screens/forget_pass/forget_pass_screen.dart';
import 'package:zicops/views/widgets/GradientButton.dart';

import '../../../graphql_api.graphql.dart';
import '../../../main.dart';
import '../../../models/user/user_details_model.dart';
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

  bool _passwordVisible = false;
  bool showErrorP = false;
  String errorMsgP = "";
  bool _keyboardVisible = false;
  bool isLoading = false;
  bool isEmailValidated = false;

  Future firebaseLogin() async {
    setState(() {
      isLoading = true;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
      }

      setState(() {
        isLoading = false;
      });

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AccountSetupScreen()));
      String token1 =
          'eyJhbGciOiJSUzI1NiIsImtpZCI6Ijg3NTNiYmFiM2U4YzBmZjdjN2ZiNzg0ZWM5MmY5ODk3YjVjZDkwN2QiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vemljb3BzLW9uZSIsImF1ZCI6InppY29wcy1vbmUiLCJhdXRoX3RpbWUiOjE2NzIxNjE1MDksInVzZXJfaWQiOiJwMkhSUXZtakJZV1llakRpSDByRERPb3ZUOVQyIiwic3ViIjoicDJIUlF2bWpCWVdZZWpEaUgwckRET292VDlUMiIsImlhdCI6MTY3MjE2MTUwOSwiZXhwIjoxNjcyMTY1MTA5LCJlbWFpbCI6ImFua2l0K2FqQHppY29wcy5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInBob25lX251bWJlciI6Iis5MTY2Njk2OTY5NjkiLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7InBob25lIjpbIis5MTY2Njk2OTY5NjkiXSwiZW1haWwiOlsiYW5raXQrYWpAemljb3BzLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.XCtFXD2fS5Ve0HCzOYkkM_FMJnYm9OIzEaO0-BSpWW7YlkqSVgkimvK_JJrVGs77Aps2ki1y6MpWt2tTjv3Z6eLAb4L393N7O3m3INFS3QDoBUOmEI7dN2-qM4lQAp9v_wGf4BpcmNqxqTepWY4DUk2anX5Nf5GoSv-mbaCQM009DVHkTXy8S29L6QgOa997IMSLD0NgouAEopP2rfff-NPicvBSOQN35FZ56V6Wh7cczRWHk40MpaO54goXL-aBZyFOyPGJh_l5VlFlnfMzv8JMMZaDMI1E7XUm9QxfQMjEyV8psqo93v_6dDanT5J_bYxIsMNrb3UCvje2nxTxvw';
      IdTokenResult? tokenResult =
          await FirebaseAuth.instance.currentUser?.getIdTokenResult();
      //String? token = tokenResult?.token ?? "";
      // String? token = token1;

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      // sharedPreferences.setString("token", token);

      final result = await userClient.client()?.execute(LoginMutation());

      UserDetailsModel userDetails = UserDetailsModel(
        result?.data?.login?.id ?? "",
        result?.data?.login?.firstName ?? "",
        result?.data?.login?.lastName ?? "",
        result?.data?.login?.status ?? "",
        result?.data?.login?.role ?? "",
        result?.data?.login?.isVerified ?? false,
        result?.data?.login?.isActive ?? false,
        result?.data?.login?.gender ?? "",
        result?.data?.login?.email ?? "",
        result?.data?.login?.phone ?? "",
        result?.data?.login?.photoUrl ?? "",
      );

      String user = jsonEncode(userDetails);
      print(user);
      sharedPreferences.setString("user", user);
      print(sharedPreferences.getString("user"));

      // final userDetailsModel = UserDetailsModel.fromJson(
      //     jsonDecode(result!.data!.login!.toJson().toString()));
      // print(userDetailsModel.id);
      //
      // print(result?.data.toString());

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
                    "assets/images/email.png", "Email",
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
