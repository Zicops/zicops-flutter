import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
class CustomPassword extends StatefulWidget{
  final FocusNode focusNode; final TextEditingController controller; final String hint; bool showErrorP; String errorMsgP; Function? onChange;


  CustomPassword(this.focusNode, this.controller, this.hint, this.showErrorP,
      this.errorMsgP, {Key? key, this.onChange}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomPassword();
  }

}
class _CustomPassword extends State<CustomPassword> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 48.sp,
              child: TextField(
                controller: widget.controller ,
                focusNode: widget.focusNode,

                onChanged: (e) {
                  if(widget.onChange!=null)widget.onChange!();
                },
                decoration: InputDecoration(
                    contentPadding:  EdgeInsets.only(
                        left: 48, top: 12.sp, bottom: 12.sp, right: 12),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: widget.showErrorP ? error :widget.controller.text.isNotEmpty?secondaryColorDarkOutline: lightGrey),
                      borderRadius: BorderRadius.circular(4.sp)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: widget.showErrorP ? error : primaryColor),
                      borderRadius: BorderRadius.circular(4.sp)),
                  hintText: widget.hint,
                  filled: true,
                  fillColor: widget.focusNode.hasFocus?secondaryColorDark:secondaryColorLight,
                  hintStyle: TextStyle(color: textGrey, fontSize: 16.sp),
                  prefixIcon: Container(
                    width: 24.sp,
                      height: 24.sp,
                      margin:  EdgeInsets.only(top: 12.sp, bottom: 12.sp, left: 16, right: 12),
                      padding:
                      EdgeInsets.symmetric(horizontal: 4, vertical: 1.5.sp),
                      child: Image.asset(
                        "assets/images/lock.png",
                        color: widget.focusNode.hasFocus ? textPrimary : textGrey,
                      )),

                  suffixIcon: !widget.showErrorP
                      ? GestureDetector(
                      onTap: () {
                        setState(() {_passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Container(
                        width: 24.sp,
                          height: 24.sp,
                          margin: const EdgeInsets.only(top: 12, bottom: 12, right: 12),
                          padding:
                          const EdgeInsets.symmetric(horizontal:1, vertical: 2.5),
                          child:Image.asset(
                            "assets/images/hidden.png",
                            color: widget.focusNode.hasFocus ? textPrimary : textGrey,
                            width: 22.sp,height: 20.sp,
                          )))
                      :  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ImageIcon(
                        const AssetImage("assets/images/about.png"),
                        color: error,
                        size: 18.sp,
                      )),
                  suffixIconConstraints:
                  const BoxConstraints(minHeight: 24, minWidth: 24),
                ),
                cursorColor: textPrimary,
                style: GoogleFonts.poppins(color: textPrimary, fontSize:16.sp, height: 1.5),
                obscureText: !_passwordVisible,
                obscuringCharacter: '*',
              )),
          widget.showErrorP
              ? Container(
              margin: EdgeInsets.only(top: 10.sp),
              child: Text(
                widget.errorMsgP,
                style:  TextStyle(color: error, fontSize: 12.sp),
              ))
              : const SizedBox.shrink(),
        ]));

  }
}
