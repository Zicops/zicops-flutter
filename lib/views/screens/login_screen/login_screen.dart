import 'package:flutter/material.dart';
import 'package:zicops/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';

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

  Future firebaseLogin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      return credential;
    } on FirebaseAuthException catch (e) {
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
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: textGrey)),
              hintText: "Password",
              filled: true,
              prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: ImageIcon(
                    AssetImage("assets/images/lock.png"),
                    color: textGrey,
                    size: 24,
                  )),
              prefixIconConstraints:
                  const BoxConstraints(minHeight: 24, minWidth: 24),
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: ImageIcon(
                        AssetImage("assets/images/hidden.png"),
                        color: textGrey,
                        size: 24,
                      ))),
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 24, minWidth: 24),
            ),
            cursorColor: textGrey,
            obscureText: !_passwordVisible,
          ),
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    bool _passwordVisible = true;

    void _changeVisibility() {
      setState(() {
        _passwordVisible = !_passwordVisible;
      });
    }

    return Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
                mainAxisAlignment: _keyboardVisible
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  _keyboardVisible
                      ? const Text(
                          'Welcome!',
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.start,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              SizedBox(height: height * 0.23),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.70,
                                  child: const Text(
                                    "Sign Into your Learning Space!",
                                    style: TextStyle(fontSize: 28),
                                    textAlign: TextAlign.center,
                                  )),
                            ])
                ]),
            const SizedBox(height: 12),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Start your first step to learning here!",
                  style: const TextStyle(
                    fontSize: 16,
                    color: textGrey,
                  ),
                  textAlign:
                      _keyboardVisible ? TextAlign.start : TextAlign.center,
                )),
            const SizedBox(height: 25),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: textGrey)),
                  filled: true,
                  prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: ImageIcon(
                        AssetImage("assets/images/email.png"),
                        color: textGrey,
                        size: 24,
                      )),
                  prefixIconConstraints:
                      BoxConstraints(minHeight: 24, minWidth: 24),
                  hintText: "Email"),
              cursorColor: textGrey,
            ),
            const SizedBox(height: 12),
            customPassword(_passwordController, "Password", _changeVisibility,
                _passwordVisible, showErrorP, errorMsgP),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: textGrey, fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                print("on login");
                firebaseLogin();
              },
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [primaryColor, gradientTwo]),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const Text(
                    'Login',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ]),
        )));
  }
}
