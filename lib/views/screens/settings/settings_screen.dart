import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingsScreen();
  }
}

class _SettingsScreen extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.sp),
        child: AppBar(
          backgroundColor: secondaryColor,
          elevation: 0,
          leading: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (Navigator.canPop(context)) Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(
                    right: 4.sp, top: 16.sp, bottom: 16.sp, left: 20.sp),
                child: Image.asset(
                  "assets/images/back_arrow.png",
                  height: 16.sp,
                  width: 16.sp,
                ),
              )),
          leadingWidth: 40.sp,
          title: SizedBox(
            height: 24.sp,
            child: Text("Settings",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: textPrimary)),
          ),
        ),
      ),
      body: Container(
        color: secondaryColor,
        padding: EdgeInsets.only(
            left: 20.sp, right: 20.sp, top: 13.sp, bottom: 20.sp),
        child: Column(
          children: [
            SizedBox(height:24.sp,child: Text("Downloads")),
            Container(height: 52.sp,alignment: Alignment.center, child:
              Row(children: [],),)
          ],
        ),
      ),
    );
  }
}
