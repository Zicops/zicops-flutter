import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChangePassScreen();
  }
}

class _ChangePassScreen extends State<ChangePassScreen> {
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordVisible = false;
  bool showErrorP = false;
  String errorMsgP = "";
  bool _keyboardVisible = false;


  Widget customTextField(hint) {
    return SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextField(
            controller: _passwordController,

            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: textGrey)),
              hintText: hint ,
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

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.70,
                                      child: const Text(
                                        "Change password!",
                                        style: TextStyle(fontSize: 28),
                                        textAlign: TextAlign.start,
                                      )),
                                ])
                          ]),
                      const SizedBox(height: 12),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "You are required to change the default password.",
                            style: const TextStyle(
                              fontSize: 16,
                              color: textGrey,
                            ),
                            textAlign: _keyboardVisible
                                ? TextAlign.start
                                : TextAlign.center,
                          )),
                      const SizedBox(height: 25),
                      const SizedBox(height: 12),
                      customTextField("Current Password"),
                      const SizedBox(height: 12),
                      customTextField("Enter New Password"),
                      const SizedBox(height: 12),
                      customTextField("Re-enter New Password"),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          print("on login");
                        },
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [primaryColor, gradientTwo]),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: const Text(
                              'Reset Password',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }
}