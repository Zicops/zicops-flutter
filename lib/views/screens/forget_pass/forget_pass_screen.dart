import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ForgetPassScreen();
  }
}

class _ForgetPassScreen extends State<ForgetPassScreen> {
  final TextEditingController _emailController = TextEditingController();

  bool showErrorP = false;
  String errorMsgP = "";
  bool _keyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height * 0.23),
                              Image.asset(
                                "assets/images/zicops_logo.png",
                                width: 40,
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.70,
                                  child: const Text(
                                    "Reset password!",
                                    style: TextStyle(fontSize: 28),
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
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {},
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [primaryColor, gradientTwo]),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: const Text(
                              'Send Email',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }
}
