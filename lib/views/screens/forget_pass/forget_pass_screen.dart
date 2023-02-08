import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/screens/login_screen/login_screen.dart';
import 'package:zicops/views/widgets/GradientButton.dart';

import '../../../utils/colors.dart';
import '../../../utils/validation.dart';
import '../../widgets/PrefixInputField.dart';

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
  final TextEditingController _enterPass = TextEditingController();
  final TextEditingController _reenterPass = TextEditingController();

  bool _keyboardVisible = false;
  bool showErrorP = false;
  String errorMsgP = "";
  bool mailSent = false;
  bool isEmailValidated = false;
  bool mailSuccessful = false;

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
                padding: const EdgeInsets.all(20),
                child: CustomScrollView(slivers: [
                  SliverFillRemaining(
                      hasScrollBody: false,
                      child: !mailSent
                          ? Column(
                              mainAxisAlignment: _keyboardVisible
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.end,
                              children: [
                                  _focusNodes[0].hasFocus
                                      ? const SizedBox.shrink()
                                      : const Spacer(),
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
                                                width: 40.sp,
                                              ),
                                              SizedBox(height: 12.sp),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.70,
                                                  child: Text(
                                                    "Reset password!",
                                                    style: TextStyle(
                                                        fontSize: 24.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: textPrimary),
                                                    textAlign: TextAlign.start,
                                                  )),
                                            ])
                                      ]),
                                  SizedBox(height: 4.sp),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                          "Enter the email associated with your account and we’ll send you an email with instructions to reset password.",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: textGrey2,
                                          ),
                                          textAlign: TextAlign.start)),
                                  const SizedBox(height: 20),
                                  prefixInputField(
                                      _focusNodes[0],
                                      _emailController,
                                      "assets/images/email.png",
                                      "Email",
                                      true,

                                      validated: isEmailValidated,
                                      onChange: (e) {
                                    setState(() {
                                      isEmailValidated = isValidEmail(e);
                                    });
                                  }),
                                  SizedBox(height: 20.sp),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        mailSent = true;
                                        mailSuccessful = true;
                                      });
                                    },
                                    child: gradientButton('Send Email'),
                                  ),
                                  SizedBox(height: 20.sp),
                                  SizedBox(height: _keyboardVisible ? 0 : 35),
                                  _keyboardVisible
                                      ? const SizedBox.shrink()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Privacy Policy",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: textGrey2,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                            SizedBox(
                                              width: 24.sp,
                                            ),
                                            Text(
                                              "Contact Us",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: textGrey2,
                                                  decoration:
                                                      TextDecoration.underline),
                                            )
                                          ],
                                        )
                                ])
                          : mailSuccessful
                              ? Column(
                                  mainAxisAlignment: _keyboardVisible
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.end,
                                  children: [
                                      _focusNodes[0].hasFocus
                                          ? const SizedBox.shrink()
                                          : const Spacer(),
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
                                                    "assets/images/email_sent.png",
                                                    width: 40.sp,
                                                  ),
                                                  SizedBox(height: 12.sp),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.70,
                                                      child: Text(
                                                        "Email sent!",
                                                        style: TextStyle(
                                                            fontSize: 24.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            height: 1.33,
                                                            color: textPrimary),
                                                        textAlign:
                                                            TextAlign.start,
                                                      )),
                                                ])
                                          ]),
                                      SizedBox(height: 4.sp),
                                      SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                              "If your account exists with us, you will receive a reset password link on your associated email id. Please check your inbox.",
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: textGrey2,
                                                  height: 1.5),
                                              textAlign: TextAlign.start)),
                                      SizedBox(height: 12.sp),
                                      SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text.rich(TextSpan(
                                              text:
                                                  "Did not receive email yet? ",
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: textGrey2,
                                                  height: 1.5),
                                              children: <InlineSpan>[
                                                TextSpan(
                                                    text: "Resend",
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: primaryColor,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        height: 1.5))
                                              ]))),
                                      SizedBox(height: 20.sp),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginScreen()));
                                        },
                                        child:
                                            gradientButton('go back to login'),
                                      ),
                                      SizedBox(
                                          height: _keyboardVisible ? 0 : 35),
                                      _keyboardVisible
                                          ? const SizedBox.shrink()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Privacy Policy",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: textGrey2,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                                SizedBox(
                                                  width: 24.sp,
                                                ),
                                                Text(
                                                  "Contact Us",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: textGrey2,
                                                      decoration: TextDecoration
                                                          .underline),
                                                )
                                              ],
                                            )
                                    ])
                              : Column(
                                  mainAxisAlignment: _keyboardVisible
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.end,
                                  children: [
                                      _focusNodes[0].hasFocus
                                          ? const SizedBox.shrink()
                                          : const Spacer(),
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
                                                    "assets/images/oops.png",
                                                    width: 40.sp,
                                                  ),
                                                  SizedBox(height: 12.sp),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.70,
                                                      child: Text(
                                                        "Oops!",
                                                        style: TextStyle(
                                                            fontSize: 24.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: textPrimary),
                                                        textAlign:
                                                            TextAlign.start,
                                                      )),
                                                ])
                                          ]),
                                      SizedBox(height: 4.sp),
                                      SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text.rich(TextSpan(
                                              text:
                                                  "Something went wrong! Try to ",
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: textGrey2,
                                                  height: 1.5),
                                              children: <InlineSpan>[
                                                TextSpan(
                                                  text: "resend",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: primaryColor,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      height: 1.5),
                                                ),
                                                TextSpan(
                                                  text:
                                                      " the mail now or come back later.\nThank you!",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: textGrey2,
                                                      height: 1.5),
                                                )
                                              ]))),
                                      SizedBox(height: 20.sp),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginScreen()));
                                        },
                                        child:
                                            gradientButton('go back to login'),
                                      ),
                                      SizedBox(
                                          height: _keyboardVisible ? 0 : 35),
                                      _keyboardVisible
                                          ? const SizedBox.shrink()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Privacy Policy",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: textGrey,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                                SizedBox(
                                                  width: 24.sp,
                                                ),
                                                Text(
                                                  "Contact Us",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
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
