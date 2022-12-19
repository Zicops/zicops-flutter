import 'package:flutter/material.dart';

import '../../utils/colors.dart';

Widget customPassword(TextEditingController controller, String hint, Function changeVisibility, bool _passwordVisible, bool showErrorP, String errorMsgP) {
  return SizedBox(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextField(
          controller: controller,

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
                    changeVisibility;
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
