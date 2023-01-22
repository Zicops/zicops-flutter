import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/dummy.dart';
import 'package:zicops/models/user/user_details_model.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/screens/account_setup/account_setup_screen.dart';
import 'package:zicops/views/screens/account_setup/models/category.dart';
import 'package:zicops/views/screens/forget_pass/forget_pass_screen.dart';
import 'package:zicops/views/screens/home/home.dart';

import '../../../graphql_api.graphql.dart';
import '../../../main.dart';

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

  Future firebaseLogin() async {
    setState(() {
      isLoading = true;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      print('heloo');
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        isLoading = false;
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen(

      )));
      String token1 =
          'eyJhbGciOiJSUzI1NiIsImtpZCI6Ijg3NTNiYmFiM2U4YzBmZjdjN2ZiNzg0ZWM5MmY5ODk3YjVjZDkwN2QiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vemljb3BzLW9uZSIsImF1ZCI6InppY29wcy1vbmUiLCJhdXRoX3RpbWUiOjE2NzIxNjE1MDksInVzZXJfaWQiOiJwMkhSUXZtakJZV1llakRpSDByRERPb3ZUOVQyIiwic3ViIjoicDJIUlF2bWpCWVdZZWpEaUgwckRET292VDlUMiIsImlhdCI6MTY3MjE2MTUwOSwiZXhwIjoxNjcyMTY1MTA5LCJlbWFpbCI6ImFua2l0K2FqQHppY29wcy5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInBob25lX251bWJlciI6Iis5MTY2Njk2OTY5NjkiLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7InBob25lIjpbIis5MTY2Njk2OTY5NjkiXSwiZW1haWwiOlsiYW5raXQrYWpAemljb3BzLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.XCtFXD2fS5Ve0HCzOYkkM_FMJnYm9OIzEaO0-BSpWW7YlkqSVgkimvK_JJrVGs77Aps2ki1y6MpWt2tTjv3Z6eLAb4L393N7O3m3INFS3QDoBUOmEI7dN2-qM4lQAp9v_wGf4BpcmNqxqTepWY4DUk2anX5Nf5GoSv-mbaCQM009DVHkTXy8S29L6QgOa997IMSLD0NgouAEopP2rfff-NPicvBSOQN35FZ56V6Wh7cczRWHk40MpaO54goXL-aBZyFOyPGJh_l5VlFlnfMzv8JMMZaDMI1E7XUm9QxfQMjEyV8psqo93v_6dDanT5J_bYxIsMNrb3UCvje2nxTxvw';
      IdTokenResult? tokenResult =
          await FirebaseAuth.instance.currentUser?.getIdTokenResult();
      String? token = tokenResult?.token ?? "";
      // String? token = token1;W

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("token", token);
      final result = await userClient.client()?.execute(LoginMutation());
      await sharedPreferences.setString("userData",result!.data!.login.toString());

      // final userDetailsModel = UserDetailsModel.fromJson(
      //     jsonDecode(result!.data!.login!.toJson().toString()));
      // print(userDetailsModel.firstName);
      // print(result?.data.toString());

      return credential;
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "User not found",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Wrong Password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  Widget customTextField() {
    return SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 48,
              child: TextField(
                controller: _passwordController,
                focusNode: _focusNodes[1],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: lightGrey),
                      borderRadius: BorderRadius.circular(4)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(4)),
                  hintText: "Password",
                  filled: true,
                  fillColor: secondaryColorLight,
                  hintStyle: const TextStyle(color: textGrey, fontSize: 16),
                  prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: ImageIcon(
                        AssetImage("assets/images/lock.png"),
                        color: _focusNodes[1].hasFocus ? textPrimary : textGrey,
                        size: 16,
                      )),
                  prefixIconConstraints:
                      const BoxConstraints(minHeight: 24, minWidth: 24),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ImageIcon(
                            const AssetImage("assets/images/hidden.png"),
                            color: _focusNodes[1].hasFocus
                                ? textPrimary
                                : textGrey,
                            size: 18,
                          ))),
                  suffixIconConstraints:
                      const BoxConstraints(minHeight: 24, minWidth: 24),
                ),
                cursorColor: textPrimary,
                style: const TextStyle(color: textPrimary),
                obscureText: !_passwordVisible,
              )),
          showErrorP
              ? Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    errorMsgP,
                    style: const TextStyle(color: Colors.red),
                  ))
              : const Text(""),
        ]));
  }

  void _changeVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
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
                height: height,
                padding: const EdgeInsets.all(20),
                child: CustomScrollView(slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Spacer(),
                          Row(
                              mainAxisAlignment: _keyboardVisible
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.center,
                              children: [
                                _keyboardVisible
                                    ? const Text(
                                        'Welcome!',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                            color: textPrimary),
                                        textAlign: TextAlign.start,
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                            Image.asset(
                                              "assets/images/zicops_logo.png",
                                              width: 40,
                                            ),
                                            const SizedBox(height: 20),
                                            Image.asset(
                                              "assets/images/zicops_name.png",
                                              width: 120,
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.70,
                                                child: Text(
                                                  "Sign Into your Learning Space!",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 28,
                                                      color: textPrimary),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ])
                              ]),
                          const SizedBox(height: 4),
                          SizedBox(
                              width: _keyboardVisible
                                  ? double.infinity
                                  : MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                "Start your first step to learning here!",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: textGrey,
                                ),
                                textAlign: _keyboardVisible
                                    ? TextAlign.start
                                    : TextAlign.center,
                              )),
                          const SizedBox(height: 28),
                          SizedBox(
                              height: 48,
                              child: TextField(
                                controller: _emailController,
                                focusNode: _focusNodes[0],
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: lightGrey),
                                        borderRadius: BorderRadius.circular(4)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: primaryColor),
                                        borderRadius: BorderRadius.circular(4)),
                                    filled: true,
                                    prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: ImageIcon(
                                          const AssetImage(
                                              "assets/images/email.png"),
                                          color: _focusNodes[0].hasFocus
                                              ? textPrimary
                                              : textGrey,
                                          size: 18,
                                        )),
                                    prefixIconConstraints: const BoxConstraints(
                                        minHeight: 24, minWidth: 24),
                                    hintText: "Email",
                                    fillColor: secondaryColorLight,
                                    hintStyle: const TextStyle(
                                        color: textGrey, fontSize: 16)),
                                cursorColor: textPrimary,
                                style: const TextStyle(
                                    color: textPrimary, fontSize: 16),
                              )),
                          const SizedBox(height: 12),
                          // customPassword(
                          //     _passwordController,
                          //     "Password",
                          //     _changeVisibility,
                          //     _passwordVisible,
                          //     showErrorP,
                          //     errorMsgP),
                          customTextField(),
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
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: textGrey,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline),
                                ),
                              )),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              firebaseLogin();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: const LinearGradient(
                                    colors: [primaryColor, gradientTwo]),
                              ),
                              child: isLoading
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ))
                                  : Text(
                                      'Login'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          letterSpacing: 2),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          _keyboardVisible
                              ? const Text("")
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Privacy Policy",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: textGrey,
                                          decoration: TextDecoration.underline),
                                    ),
                                    SizedBox(
                                      width: 24,
                                    ),
                                    Text(
                                      "Contact Us",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: textGrey,
                                          decoration: TextDecoration.underline),
                                    )
                                  ],
                                )
                        ]),
                  ),
                ]))));
  }
}
