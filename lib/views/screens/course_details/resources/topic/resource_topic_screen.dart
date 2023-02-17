import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/widgets/expansion_container.dart';

import '../../../../../utils/colors.dart';
import '../../../search/search_screen.dart';

class ResourceTopicScreen extends StatefulWidget {
  String title;

  ResourceTopicScreen(this.title, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ResourceTopicScreen();
  }
}

class _ResourceTopicScreen extends State<ResourceTopicScreen> {
  Widget resourceItem() {
    return Container(
        height: 56.sp,
        padding: EdgeInsets.symmetric(horizontal: 12.sp,vertical: 10.sp),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24.sp,
              height: 24.sp,
              alignment: Alignment.center,
              child: Image.asset("assets/images/pdf.png", width: 16.sp, height: 16.sp,),
            ),
            SizedBox(width: 15.sp,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.sp, child: Text("Human Centric Design",style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500,color: textPrimary,height: 1.43))),
                SizedBox(
                    height: 16.sp,
                    child: Row(
                      children: [
                        Text("3mons ago", style: TextStyle(fontSize: 12.sp, color: textGrey2,height: 1.33)),
                        SizedBox(width: 8.sp,),
                        Image.asset("assets/images/dot.png", width: 2.sp,height: 2.sp,),
                        SizedBox(width: 8.sp,),
                        Text("3.8mb", style: TextStyle(fontSize: 12.sp, color: textGrey2,),),
                      ],
                    ))
              ],
            ),
            Spacer(),
            Transform.rotate(angle: -1.5,child:Container(
              width: 24.sp,
              height: 24.sp,
              padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 6.sp),
              alignment: Alignment.center,
              child: Image.asset("assets/images/down_arrow.png"),
            )),
          ],
        ));
  }

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
            title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: textPrimary),
                  ),
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchScreen()));
                      },
                      child: Container(
                          width: 24.sp,
                          height: 24.sp,
                          margin: EdgeInsets.only(right: 16.sp),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/search.png",
                            width: 18.sp,
                            height: 18.sp,
                            color: textPrimary,
                          ))),
                ]),
          ),
        ),
        backgroundColor: secondaryColorDark,
        body: Padding(padding: EdgeInsets.only(left: 20.sp, right: 20.sp),child: SingleChildScrollView(child: Column(
          children: [
            SizedBox(height: 20.sp,),
            ExpansionContainer(
                "Pdf",
                Column(
                  children: [
                    Divider(
                      height: 1.sp,
                      thickness: 1.sp,
                      color: lightGrey,
                    ),
                    resourceItem(),
                    resourceItem(),
                    resourceItem()
                  ],
                )),
            SizedBox(height: 8.sp,),
            ExpansionContainer(
                "Pdf",
                Column(
                  children: [
                    Divider(
                      height: 1.sp,
                      thickness: 1.sp,
                      color: lightGrey,
                    ),
                    resourceItem(),
                    resourceItem(),
                    resourceItem()
                  ],
                )),
            SizedBox(height: 8.sp,),
            ExpansionContainer(
                "Pdf",
                Column(
                  children: [
                    Divider(
                      height: 1.sp,
                      thickness: 1.sp,
                      color: lightGrey,
                    ),
                    resourceItem(),
                    resourceItem(),
                    resourceItem()
                  ],
                )),
            SizedBox(height: 8.sp,),
          ],
        ),)),);
  }
}
