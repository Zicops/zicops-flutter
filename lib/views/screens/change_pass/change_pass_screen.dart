import 'package:flutter/material.dart';
import 'package:zicops/views/widgets/GradientButton.dart';

import '../../../utils/colors.dart';
import '../../widgets/CustomPassword.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChangePassScreen();
  }
}

class _ChangePassScreen extends State<ChangePassScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _enterPasswordController =
      TextEditingController();
  final TextEditingController _reenterPasswordController =
      TextEditingController();

  bool showErrorP = false;
  String errorMsgP = "";
  bool _keyboardVisible = false;

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
    super.dispose();
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
                child: CustomScrollView(slivers: [
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                      mainAxisAlignment: _keyboardVisible ||
                              _currentPasswordController.text.isNotEmpty
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        _focusNodes[0].hasFocus ||
                                _focusNodes[1].hasFocus ||
                                _focusNodes[2].hasFocus ||
                                _currentPasswordController.text.isNotEmpty
                            ? const SizedBox.shrink()
                            : const Spacer(),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _keyboardVisible ||
                                            _currentPasswordController
                                                .text.isNotEmpty
                                        ? const SizedBox.shrink()
                                        : Image.asset(
                                            "assets/images/zicops_logo.png",
                                            width: 40,
                                          ),
                                    SizedBox(
                                        height: _focusNodes[0].hasFocus ||
                                                _currentPasswordController
                                                    .text.isNotEmpty
                                            ? 0
                                            : 20),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.70,
                                        child: const Text(
                                          "Change password!",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                              color: textPrimary),
                                          textAlign: TextAlign.start,
                                        )),
                                  ])
                            ]),
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
                        const SizedBox(height: 20),
                        CustomPassword(
                            _focusNodes[0],
                            _currentPasswordController,
                            "Current password",
                            showErrorP,
                            errorMsgP),
                        const SizedBox(height: 12),
                        CustomPassword(_focusNodes[1], _enterPasswordController,
                            "Enter new password", false, ''),
                        const SizedBox(height: 12),
                        CustomPassword(
                            _focusNodes[2],
                            _reenterPasswordController,
                            "Re-enter new password",
                            false,
                            ''),
                        const SizedBox(height: 20),
                        _keyboardVisible ||
                                _currentPasswordController.text.isNotEmpty
                            ? const Spacer()
                            : const SizedBox.shrink(),
                        GestureDetector(
                          onTap: () {
                            print("on login");
                            if (_enterPasswordController.text !=
                                _reenterPasswordController.text) {
                              setState(() {
                                showErrorP = true;
                                errorMsgP = 'Password did not match';
                              });
                            }
                          },
                          child: GradientButton("Reset Password"),
                        ),
                        SizedBox(height: _keyboardVisible ? 0 : 35),
                        _keyboardVisible
                            ? const SizedBox.shrink()
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
                      ]))
            ]))));
  }
}
