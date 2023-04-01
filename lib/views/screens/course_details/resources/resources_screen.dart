import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zicops/blocs/course/course_bloc.dart';
import 'package:zicops/repositories/course_repository.dart';
import 'package:zicops/views/screens/course_details/resources/topic/resource_topic_screen.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/modules_dropdown.dart';

class ResourcesScreen extends StatefulWidget {
  String courseId;
  var isCourseAssigned;
  ResourcesScreen(this.courseId, this.isCourseAssigned, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ResourcesScreen();
  }
}

class _ResourcesScreen extends State<ResourcesScreen> {
  String _selectedValue = '';

  void _onDropdownChanged(String newValue) {
    setState(() {
      _selectedValue = newValue;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc(courseRepository: CourseRepository())
        ..add(ResourceDataRequested(courseId: widget.courseId)),
      child: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is ResourcesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ResourcesLoaded) {
            List dummy = [];
            Map<String, String> moduleData = {};
            List dropdownItems = [];
            state.courseModules.forEach((element) {
              dropdownItems.add('Module ${element['sequence']}');
              moduleData['Module ${element['sequence']}'] = element['id'];
            });
            dropdownItems.sort();
            if (_selectedValue == "") {
              _selectedValue = dropdownItems[0];
            }
            //Find number of topics in module
            List topics = state.topicData
                .where((element) =>
                    element['moduleId'] == moduleData[_selectedValue])
                .toList();
            for (var i = 0; i < topics.length; i++) {
              dummy.add(i + 1);
            }
            List resources = [];
            resources = state.resourcesData;
            print(resources);

            return Container(
              padding: EdgeInsets.only(top: 11.sp, right: 20.sp, left: 20.sp),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ModulesDropDown(
                      onChanged: _onDropdownChanged,
                      dropdownList: dropdownItems,
                    ),
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
                      child: state.topicData
                              .where((element) =>
                                  element['moduleId'] ==
                                  moduleData[_selectedValue])
                              .isNotEmpty
                          ? MasonryGridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15.sp,
                              crossAxisSpacing: 20.sp,
                              itemCount: dummy.length,
                              itemBuilder: (context, index) {
                                List resourcesInTopic = [];
                                for (var element in resources) {
                                  if (element['topicId'] ==
                                      topics[index]['topicId']) {
                                    resourcesInTopic.add(element);
                                  }
                                }
                                print(resourcesInTopic);
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ResourceTopicScreen(
                                                      "Topic ${dummy[index]}")));
                                    },
                                    child: folder("Topic ${dummy[index]}",
                                        "${resourcesInTopic.length} Files"));
                              })
                          : Center(
                              child: Text(
                                "No Topics in this Module",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                    ),
                  ]),
            );
          }
          if (state is ResourcesError) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        },
      ),
    );
  }
}
