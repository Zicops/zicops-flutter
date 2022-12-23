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
  int _start = 60;
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

  final List<FocusNode> _focusNodes = [FocusNode(), FocusNode(), FocusNode()];

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
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    Widget customTextField(index, hint) {
      return SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height:48,child: TextField(
              focusNode: _focusNodes[index],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: lightGrey),
                    borderRadius: BorderRadius.circular(4)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(4)),
                hintText: hint,
                filled: true,
                fillColor: secondaryColorLight,
                prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ImageIcon(
                      const AssetImage("assets/images/lock.png"),
                      color:
                          _focusNodes[index].hasFocus ? textPrimary : textGrey,
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
                          color: _focusNodes[index].hasFocus
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

    return Scaffold(
        body: SafeArea(
            child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/login_bg.png"),
                  fit: BoxFit.fill,
                )),
                padding: const EdgeInsets.all(20),
                child: CustomScrollView(slivers: [


                  SliverFillRemaining(
                      hasScrollBody: false,
                      child: !mailSent
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
                                              Image.asset(
                                                "assets/images/zicops_logo.png",
                                                width: 40,
                                              ),
                                              const SizedBox(height: 12),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.70,
                                                  child: const Text(
                                                    "Reset password!",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: textPrimary),
                                                    textAlign: TextAlign.start,
                                                  )),
                                            ])
                                      ]),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: const Text(
                                          "Enter the email associated with your account and we’ll send you an email with instructions to reset password.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: textGrey,
                                          ),
                                          textAlign: TextAlign.start)),
                                  const SizedBox(height: 20),
                                SizedBox(height:48,child: TextField(
                                    controller: _emailController,
                                    focusNode: _focusNodes[0],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: lightGrey),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: primaryColor),
                                            borderRadius:
                                                BorderRadius.circular(4)),
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
                                        prefixIconConstraints:
                                            const BoxConstraints(
                                                minHeight: 20, minWidth: 20),
                                        hintText: "Email",
                                        fillColor: secondaryColorLight,
                                        hintStyle: const TextStyle(
                                            color: textGrey, fontSize: 16)),
                                    style: const TextStyle(
                                        color: textPrimary, fontSize: 16),
                                    cursorColor: textGrey,
                                  )),
                                  const SizedBox(height: 20),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        mailSent = true;
                                        startTimer();
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                primaryColor,
                                                gradientTwo
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(4)),
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
                                                  color: textGrey,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                            SizedBox(
                                              width: 24,
                                            ),
                                            Text(
                                              "Contact Us",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textGrey,
                                                  decoration:
                                                      TextDecoration.underline),
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
                                                  Image.asset(
                                                    "assets/images/zicops_logo.png",
                                                    width: 40,
                                                  ),
                                                  const SizedBox(height: 20),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
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
                                                        textAlign:
                                                            TextAlign.start,
                                                      )),
                                                ])
                                          ]),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: const Text(
                                              "Enter the security code sent on your registered email id.",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: textGrey,
                                              ),
                                              textAlign: TextAlign.start)),
                                      const SizedBox(height: 20),
                                      OTPTextField(
                                        length: 6,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fieldWidth: 48,
                                        outlineBorderRadius: 4,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16),
                                        otpFieldStyle: OtpFieldStyle(
                                            borderColor: textGrey,
                                            enabledBorderColor: textPrimary,
                                            focusBorderColor: primaryColor),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: textPrimary,
                                            fontWeight: FontWeight.w600),
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
                                                    color: textGrey,
                                                    fontSize: 14),
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
                                                        fontSize: 14,
                                                        decoration:
                                                            TextDecoration
                                                                .underline)),
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
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                  colors: [
                                                    primaryColor,
                                                    gradientTwo
                                                  ]),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
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
                                                      color: textGrey,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                                SizedBox(
                                                  width: 24,
                                                ),
                                                Text(
                                                  "Contact Us",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: textGrey,
                                                      decoration: TextDecoration
                                                          .underline),
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

                                                  Image.asset(
                                                    "assets/images/zicops_logo.png",
                                                    width: 40,
                                                  ),
                                                  const SizedBox(height: 20),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
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
                                                        textAlign:
                                                            TextAlign.start,
                                                      )),
                                                ])
                                          ]),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child:
                                              const Text("Enter new password",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: textGrey,
                                                  ),
                                                  textAlign: TextAlign.start)),
                                      const SizedBox(height: 20),
                                      customTextField(1,"Enter New Password"),
                                      customTextField(2,"Re-enter New Password"),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()),
                                          );
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                  colors: [
                                                    primaryColor,
                                                    gradientTwo
                                                  ]),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          height: 48,
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
                                                      color: textGrey,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                                SizedBox(
                                                  width: 24,
                                                ),
                                                Text(
                                                  "Contact Us",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: textGrey,
                                                      decoration: TextDecoration
                                                          .underline),
                                                )
                                              ],
                                            )
                                    ]))
                ]))));
  }
}
