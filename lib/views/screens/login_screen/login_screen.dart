import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zicops/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zicops/views/screens/account_setup/account_setup_screen.dart';
import 'package:zicops/views/screens/forget_pass/forget_pass_screen.dart';

import '../../widgets/CustomPassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
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
      // Fluttertoast.showToast(
      //     msg: "Login Successful",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      setState(() {
        isLoading = false;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AccountSetupScreen()));
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
          SizedBox(height:48,child: TextField(
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
                        color: _focusNodes[1].hasFocus ? textPrimary : textGrey,
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
                                        style: TextStyle(fontSize: 24,fontWeight:
                                        FontWeight.w500,
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
                              width:_keyboardVisible?double.infinity: MediaQuery.of(context).size.width * 0.5,
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
                          SizedBox(height:48, child:
                          TextField(
                            controller: _emailController,
                            focusNode: _focusNodes[0],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: lightGrey),
                                    borderRadius: BorderRadius.circular(4)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: primaryColor),
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
