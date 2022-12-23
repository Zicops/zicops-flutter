import 'package:flutter/material.dart';

import '../../utils/colors.dart';

Widget prefixInputField(FocusNode focusNode, TextEditingController controller,
    String image, String hint) {
  return SizedBox(
      height: 48,
      child: TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: lightGrey),
                  borderRadius: BorderRadius.circular(4)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(4)),
              filled: true,
              fillColor: secondaryColorLight,
              prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ImageIcon(
                    AssetImage(image),
                    color: focusNode.hasFocus ? textPrimary : textGrey,
                    size: 16,
                  )),
              prefixIconConstraints:
                  const BoxConstraints(minHeight: 24, minWidth: 24),
              hintText: hint,
              hintStyle: const TextStyle(color: textGrey, fontSize: 16)),
          cursorColor: textPrimary,
          style: const TextStyle(color: textPrimary, fontSize: 16)));
}
