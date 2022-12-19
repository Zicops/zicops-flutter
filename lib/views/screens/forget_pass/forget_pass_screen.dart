import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:zicops/views/screens/login_screen/login_screen.dart';

import '../../../utils/colors.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ForgetPassScreen();
  }
}

class _ForgetPassScreen extends State<ForgetPassScreen>
    with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();

  bool _keyboardVisible = false;
  bool showErrorP = false;
  String errorMsgP = "";
  bool mailSent = false;
  bool otpVerified = false;
  bool _passwordVisible = false;
  Timer? _timer;
  int _start = 30;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    Widget customTextField(hint) {
      return SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: textGrey)),
                hintText: hint,
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
    void dispose() {
      _timer?.cancel();
      super.dispose();
    }

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
                child: CustomScrollView(slivers: [
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: !mailSent
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              const Spacer(),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: height * 0.23),
                                          Image.asset(
                                            "assets/images/zicops_logo.png",
                                            width: 40,
                                          ),
                                          const SizedBox(height: 20),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.70,
                                              child: const Text(
                                                "Reset password!",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                    color: textPrimary),
                                                textAlign: TextAlign.start,
                                              )),
                                        ])
                                  ]),
                              const SizedBox(height: 12),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: const Text(
                                      "Enter the email associated with your account and we’ll send you an email with instructions to reset password.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: textGrey,
                                      ),
                                      textAlign: TextAlign.start)),
                              const SizedBox(height: 25),
                              TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: textGrey)),
                                    filled: true,
                                    prefixIcon: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: ImageIcon(
                                          AssetImage("assets/images/email.png"),
                                          color: textGrey,
                                          size: 24,
                                        )),
                                    prefixIconConstraints: BoxConstraints(
                                        minHeight: 24, minWidth: 24),
                                    hintText: "Email"),
                                cursorColor: textGrey,
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    mailSent = true;
                                    startTimer();
                                  });
                                },
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [primaryColor, gradientTwo]),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Text(
                                      'Send Email'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          letterSpacing: 2),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 35),
                              _keyboardVisible
                                  ? Text("")
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Privacy Policy",
                                          style: TextStyle(
                                              fontSize: 12, color: textGrey),
                                        ),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        Text(
                                          "Contact Us",
                                          style: TextStyle(
                                              fontSize: 12, color: textGrey),
                                        )
                                      ],
                                    )
                            ])
                      : !otpVerified
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                  const Spacer(),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: height * 0.23),
                                              Image.asset(
                                                "assets/images/zicops_logo.png",
                                                width: 40,
                                              ),
                                              const SizedBox(height: 20),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.70,
                                                  child: const Text(
                                                    "Enter Code!",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: textPrimary),
                                                    textAlign: TextAlign.start,
                                                  )),
                                            ])
                                      ]),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: const Text(
                                          "Enter the security code sent on your registered email id.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: textGrey,
                                          ),
                                          textAlign: TextAlign.start)),
                                  const SizedBox(height: 25),
                                  OTPTextField(
                                    length: 6,
                                    width: MediaQuery.of(context).size.width,
                                    fieldWidth: 48,
                                    otpFieldStyle: OtpFieldStyle(
                                        borderColor: textPrimary,
                                        enabledBorderColor: textPrimary,
                                        focusBorderColor: primaryColor),
                                    style: const TextStyle(
                                        fontSize: 16, color: textPrimary),
                                    textFieldAlignment:
                                        MainAxisAlignment.spaceAround,
                                    fieldStyle: FieldStyle.box,
                                    onCompleted: (pin) {
                                      print("Completed: " + pin);
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                            "Your code expires in ",
                                            style: TextStyle(
                                                color: textGrey, fontSize: 14),
                                          ),
                                          Text(
                                            "00:${_start.toString().padLeft(2, '0')}.",
                                            style: const TextStyle(
                                                color: primaryColor,
                                                fontSize: 14),
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          GestureDetector(
                                            child: const Text("Resend",
                                                style: TextStyle(
                                                    color: textGrey,
                                                    fontSize: 14)),
                                          )
                                        ],
                                      )),
                                  const SizedBox(height: 20),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        otpVerified = true;
                                      });
                                    },
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          primaryColor,
                                          gradientTwo
                                        ]),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        child: Text(
                                          'Verify'.toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              letterSpacing: 2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 35),
                                  _keyboardVisible
                                      ? Text("")
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Privacy Policy",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textGrey),
                                            ),
                                            SizedBox(
                                              width: 24,
                                            ),
                                            Text(
                                              "Contact Us",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textGrey),
                                            )
                                          ],
                                        )
                                ])
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                  const Spacer(),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: height * 0.23),
                                              Image.asset(
                                                "assets/images/zicops_logo.png",
                                                width: 40,
                                              ),
                                              const SizedBox(height: 20),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.70,
                                                  child: const Text(
                                                    "Enter password!",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: textPrimary),
                                                    textAlign: TextAlign.start,
                                                  )),
                                            ])
                                      ]),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: const Text("Enter new password",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: textGrey,
                                          ),
                                          textAlign: TextAlign.start)),
                                  const SizedBox(height: 25),
                                  customTextField("Enter New Password"),
                                  const SizedBox(height: 12),
                                  customTextField("Re-enter New Password"),
                                  const SizedBox(height: 20),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()),
                                      );
                                    },
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          primaryColor,
                                          gradientTwo
                                        ]),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        child: Text(
                                          'Confirm'.toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              letterSpacing: 2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 35),
                                  _keyboardVisible
                                      ? Text("")
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Privacy Policy",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textGrey),
                                            ),
                                            SizedBox(
                                              width: 24,
                                            ),
                                            Text(
                                              "Contact Us",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textGrey),
                                            )
                                          ],
                                        )
                                ]))
            ]))));
  }
}
