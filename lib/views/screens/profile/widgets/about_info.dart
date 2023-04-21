import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/utils/colors.dart';

import '../../../../controllers/mutation_controller.dart';

class AboutInfo extends StatefulWidget {
  String name;
  List items;
  String userId;
  String orgId;
  String userOrgId;
  String userLspId;

  AboutInfo(this.userId, this.orgId, this.userOrgId, this.userLspId, this.name,
      this.items,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AboutInfo();
  }
}

class _AboutInfo extends State<AboutInfo> {
  bool isDisabled = true;

  Widget itemField(
      String label, TextEditingController controller, bool isDisabled) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16.sp,
          child: Text(
            label,
            style: TextStyle(color: neutral, fontSize: 12.sp),
          ),
        ),
        SizedBox(
          height: 4.sp,
        ),
        SizedBox(
          height: 20.sp,
          child: TextField(
            controller: controller,
            //  enabled: label == "Email ID." "Role in Organization."? false : !isDisabled,
            enabled: (label == "Email ID." ||
                    label == "Organization." ||
                    label == "Organization Unit." ||
                    label == "Learning Space Role.")
                ? false
                : !isDisabled,
            autofocus: true,
            cursorColor: textPrimary,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 2.sp, horizontal: 0),
              border: InputBorder.none,
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: textPrimary)),
              isDense: true,
            ),
            style: GoogleFonts.poppins(
                color: textPrimary, fontSize: 14.sp, height: 1.43),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(children: [
          SizedBox(
            height: 24.sp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name.toUpperCase(),
                  style: TextStyle(
                      color: textGrey2,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      height: 1.33),
                ),
                GestureDetector(
                    onTap: () async {
                      setState(() {
                        isDisabled = !isDisabled;
                      });
                      if (isDisabled) {
                        if (widget.name == "Personal") {
                          print('hi');
                          print(widget.items[3]["controller"].text);
                          updateUser(
                            widget.userId,
                            widget.items[0]["controller"].text,
                            widget.items[1]["controller"].text,
                            widget.items[3]["controller"].text,
                            widget.items[2]["controller"].text,
                            widget.items[4]["controller"].text,
                            null,
                          );
                        } else if (widget.name == "Organization") {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String orgId = prefs.getString("orgId")!;
                          print('hi');
                          print(widget.items[3]["controller"].text);
                          updateUserOrganizationMap(
                            widget.userId,
                            widget.orgId,
                            widget.userOrgId,
                            widget.userLspId,
                            widget.items[2]["controller"].text,
                            widget.items[4]["controller"].text,
                          );
                        }
                      }
                    },
                    child: isDisabled
                        ? Image.asset(
                            "assets/images/edit.png",
                            height: 15.sp,
                            width: 18.sp,
                          )
                        : Icon(
                            Icons.save,
                            color: textPrimary,
                            size: 18.sp,
                          ))
              ],
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Container(
              padding:
                  EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  gradient: LinearGradient(colors: [
                    secondaryColorDarkOutline,
                    secondaryColorDarkOutline.withOpacity(0.15),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(4.sp),
                ),
                child: Column(
                  children: [
                    ...widget.items
                        .asMap()
                        .map((i, item) => MapEntry(
                            i,
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.sp, horizontal: 12.sp),
                                  child: itemField(item["label"],
                                      item["controller"], isDisabled),
                                ),
                                widget.items.length - 1 > i
                                    ? Divider(
                                        height: 0.5.sp,
                                        thickness: 0.5,
                                        color: lightGrey,
                                      )
                                    : const SizedBox.shrink()
                              ],
                            )))
                        .values
                        .toList()
                  ],
                ),
              ))
        ]),
      ],
    );
  }
}
