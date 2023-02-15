import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zicops/views/screens/course_details/resources/topic/resource_topic_screen.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/modules_dropdown.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ResourcesScreen();
  }
}

class _ResourcesScreen extends State<ResourcesScreen> {
  Widget folder(String label, String totalFiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
                width: 150.sp,
                height: 100.sp,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/folder.png",
                  fit: BoxFit.fill,
                )),
            Positioned(
                left: 16.sp,
                bottom: 12.sp,
                child: Text(
                  totalFiles,
                  style: TextStyle(
                      fontSize: 12.sp, color: textPrimary, height: 1.33),
                ))
          ],
        ),
        SizedBox(
          height: 7.sp,
        ),
        Container(
            height: 20.sp,
            padding: EdgeInsets.only(left: 16.sp),
            child: Text(label,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: textPrimary)))
      ],
    );
  }

  List dummy = [1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 11.sp, right: 20.sp, left: 20.sp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ModulesDropDown(),
        SizedBox(
          height: 9.sp,
        ),
        Container(
          height: 24.sp,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 15.sp),
          child: Text("Topics".toUpperCase(),
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: textGrey2,
                  letterSpacing: 1)),
        ),
        Expanded(
            child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15.sp,
                crossAxisSpacing: 20.sp,
                itemCount: dummy.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResourceTopicScreen(
                                    "Topic ${dummy[index]}")));
                      },
                      child: folder("Topic ${dummy[index]}", "12 Files"));
                }))
      ]),
    );
  }
}
