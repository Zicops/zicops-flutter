import 'package:flutter/material.dart';

import '../../utils/colors.dart';

Widget prefixInputField(TextEditingController controller, String image, String hint){
  return  TextField(
    controller: controller,
    decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textGrey)),
        filled: true,
        prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ImageIcon(
              AssetImage(image),
              color: textGrey,
              size: 24,
            )),
        prefixIconConstraints:
        const BoxConstraints(minHeight: 24, minWidth: 24),
        hintText: hint),
    cursorColor: textGrey,
  );
}