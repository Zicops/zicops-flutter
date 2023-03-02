import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/screens/profile/widgets/date_card.dart';
import 'package:zicops/views/screens/profile/widgets/dropdown_list_item.dart';
import 'package:zicops/views/screens/profile/widgets/dropdown_with_class_card.dart';
import 'package:zicops/views/screens/profile/widgets/skill_matrix.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zicops/views/widgets/modules_dropdown.dart';
import '../../../utils/dummies.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DashboardTabScreen extends StatefulWidget {
  const DashboardTabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DashboardTabScreen();
  }
}

class _DashboardTabScreen extends State<DashboardTabScreen> {
  late TooltipBehavior _tooltipBehavior;
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: false, canShowMarker: true);
    _trackballBehavior = TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        lineColor: primaryColor,
        builder: (context, details) {
          return Container(
              width: 95.sp,
              height: 58.sp,
              padding: EdgeInsets.all(8.sp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: secondaryColorDark,
                  borderRadius: BorderRadius.circular(4.sp)),
              child: Column(
                children: [
                  Text(
                    '${details.point?.y.toString()} hour',
                    style: TextStyle(fontSize: 16.sp, color: primaryColor),
                  ),
                  Text(
                    'Day ${details.point?.x.toString()}',
                    style: TextStyle(fontSize: 12.sp, color: textGrey2),
                  )
                ],
              ));
        });

    super.initState();
  }

  Widget CircularProgressBar() {
    return CircularProgressIndicator();
  }

  final List<ChartData> chartData = [
    ChartData(2010, 35),
    ChartData(2011, 28),
    ChartData(2012, 34),
    ChartData(2013, 32),
    ChartData(2014, 40),
    ChartData(2015, 28),
    ChartData(2016, 34),
    ChartData(2017, 32),
    ChartData(2018, 40)
  ];

  Widget SectionHeader(String label) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        margin: EdgeInsets.only(bottom: 8.sp),
        child: Row(
          children: [
            Container(
              height: 16.sp,
              alignment: Alignment.center,
              child: Text(
                label.toUpperCase(),
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: neutral,
                    letterSpacing: 1),
              ),
            ),
            const Spacer(),
            Container(
              width: 24.sp,
              height: 24.sp,
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/horiz_dots.png",
                width: 16.sp,
                height: 4.sp,
              ),
            )
          ],
        ));
  }

  Widget AreaGraph(List<ChartData> chart) {
    return Container(
      height: 268.sp,
      margin: EdgeInsets.symmetric(vertical: 16.sp),
      alignment: Alignment.center,
      child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          backgroundColor: Colors.transparent,
          tooltipBehavior: _tooltipBehavior,
          trackballBehavior: _trackballBehavior,
          primaryXAxis: CategoryAxis(
            title: AxisTitle(
                text: "Days",
                textStyle: TextStyle(fontSize: 12.sp, color: textGrey2),
                alignment: ChartAlignment.near),
            majorGridLines: MajorGridLines(width: 0),
            majorTickLines: MajorTickLines(width: 0),
            axisLine: AxisLine(width: 0),
          ),
          primaryYAxis: NumericAxis(
              title: AxisTitle(
                  text: "Minutes",
                  textStyle: TextStyle(fontSize: 12.sp, color: textGrey2),
                  alignment: ChartAlignment.far),
              majorTickLines: MajorTickLines(width: 0),
              axisLine: AxisLine(width: 0),
              opposedPosition: true,
              anchorRangeToVisiblePoints: true),
          series: [
            // Renders area chart
            AreaSeries<ChartData, double>(
                dataSource: chart,
                borderColor: const Color(0xFF03DAC5),
                borderWidth: 1.sp,
                gradient: const LinearGradient(colors: [
                  Color(0xFF22AAA1),
                  Color(0x0022AAA1),
                ], stops: [
                  0,
                  1
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                xValueMapper: (ChartData data, _) => data.year,
                yValueMapper: (ChartData data, _) => data.data)
          ]),
    );
  }

  Widget RadialGraph() {
    return Container(
        width: 260.sp,
        height: 130.sp,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 20.sp),
        padding: EdgeInsets.zero,
        child: Transform.translate(
          offset: Offset(0, 20.sp),
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                startAngle: 180,
                endAngle: 0,
                interval: 10,
                radiusFactor: 1.4,
                centerX: 0,
                centerY: 0,
                canScaleToFit: true,
                showLabels: false,
                showTicks: false,
                axisLineStyle:
                    AxisLineStyle(thickness: 20.sp, color: secondaryColorDark),
                ranges: [
                  GaugeRange(
                    startValue: 0,
                    endValue: 60,
                    startWidth: 20.sp,
                    endWidth: 20.sp,
                    color: Color(0xFF03DAC5),
                  )
                ],
                pointers: <GaugePointer>[
                  WidgetPointer(
                    value: 80,
                    offset: 7.sp,
                    child: Transform.scale(
                        scale: 1.8,
                        child: Container(
                          width: 20.sp,
                          alignment: Alignment.center,
                          child: Image.asset("assets/images/image_pointer.png"),
                        )),
                  )
                ],
                annotations: [
                  GaugeAnnotation(
                      angle: 90,
                      positionFactor: 0.2,
                      widget: Column(
                        children: [
                          Text(
                            '15.4hours',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: primaryColor,
                                height: 1.33),
                          ),
                          SizedBox(
                              height: 28.sp,
                              child: Text(
                                '20 hours',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                    color: textPrimary,
                                    height: 1.4),
                              ))
                        ],
                      )),
                ])
          ]),
        ));
  }

  Widget PreviewListItem(String asset) {
    return Container(
      height: 68.sp,
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 44.sp, width: 44.sp, child: Image.asset(asset)),
          SizedBox(
            width: 12.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 24.sp,
                child: Text(
                  "03",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              SizedBox(
                height: 4.sp,
              ),
              SizedBox(
                height: 16.sp,
                child: Text(
                  "Number of courses completed",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: textGrey2),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget EngagedSubCatListItem() {
    return SizedBox(
      height: 54.sp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20.sp,
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Text(
              "UI/UX Design",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: textPrimary),
            ),
          ),
          SizedBox(
            width: 2.sp,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Row(
                children: [
                  SizedBox(
                    height: 16.sp,
                    child: Text(
                      "Design",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: textGrey2),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 16.sp,
                    child: Text(
                      "47 mins",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: textGrey2),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 8.sp,
          ),
          Divider(
            height: 1.sp,
            thickness: 1.sp,
            color: lightGrey,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          color: secondaryColorDark,
          padding: EdgeInsets.symmetric(horizontal: 0.sp),
          child: ListView(children: [
            SizedBox(
              height: 15.sp,
            ),
            SectionHeader("Skill matrix dashboard"),
            SizedBox(
              height: 15.sp,
            ),
            const SkillMatrix(),
            SizedBox(
              height: 8.sp,
            ),
            DateCard(Column(
              children: [
                ...[
                  "assets/images/course_complete.png",
                  "assets/images/course_complete.png",
                  "assets/images/course_complete.png"
                ].map((e) => PreviewListItem(e)),
                Container(
                  height: 36.sp,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 16.sp),
                  child: Text(
                    "See All".toUpperCase(),
                    style: TextStyle(
                        fontSize: 14.sp, color: textGrey2, letterSpacing: 2),
                  ),
                )
              ],
            )),
            SizedBox(
              height: 16.sp,
            ),
            SectionHeader("Organizational Learning Target"),
            DateCard(Column(
              children: [
                SizedBox(
                  height: 8.sp,
                ),
                ModulesDropDown(
                  dropdownList: const [
                    'Learning hour',
                    'Learning hour',
                    'Learning hour'
                  ],
                  showTitle: false,
                  borderRadius: 0,
                ),
                RadialGraph()
              ],
            )),
            SizedBox(
              height: 16.sp,
            ),
            SectionHeader("Engagement in Zicops"),
            DateCard(AreaGraph(chartData)),
            SizedBox(
              height: 16.sp,
            ),
            SectionHeader("Your cohorts"),
            Container(
                height: 156.sp,
                alignment: Alignment.center,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  SizedBox(
                    width: 20.sp,
                  ),
                  ...[1, 2, 3].map((e) => CohortCardItem(e.toString(),
                      "Java Refresher", "assets/images/course_preview.png"))
                ])),
            SizedBox(
              height: 16.sp,
            ),
            SectionHeader("Most Engaged subcategories"),
            DateCard(Column(
              children: [
                ...courseItems
                    .sublist(0, 4)
                    .map((e) => EngagedSubCatListItem()),
                Container(
                  height: 36.sp,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 16.sp),
                  child: Text(
                    "See All".toUpperCase(),
                    style: TextStyle(
                        fontSize: 14.sp, color: textGrey2, letterSpacing: 2),
                  ),
                )
              ],
            )),
            SizedBox(
              height: 16.sp,
            ),
            SectionHeader("Self-paced"),
            DropdownWithListCard(),
            SizedBox(
              height: 16.sp,
            ),
            SectionHeader("Classroom"),
            DropdownWithListCard(),
            SizedBox(
              height: 16.sp,
            ),
            SectionHeader("Exams"),
            DropdownWithListCard(),
            SizedBox(
              height: 20.sp,
            )
          ])),
    );
  }
}

class ChartData {
  ChartData(this.year, this.data);
  final double year;
  final double data;
}

class CohortCardItem extends StatelessWidget {
  String count;
  String course;
  String preview;
  CohortCardItem(this.count, this.course, this.preview, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 156.sp,
          height: 156.sp,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
          margin: EdgeInsets.only(right: 8.sp),
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
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4.sp),
                                topLeft: Radius.circular(4.sp)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  preview,
                                  fit: BoxFit.fill,
                                  width: 156.sp,
                                  height: 88.sp,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.43),
                                  height: 87.75.sp,
                                ),
                              ],
                            ))),
                    Container(
                      height: 64.sp,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 24.sp,
                                height: 24.sp,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/medal.png",
                                  width: 16.sp,
                                  height: 21.sp,
                                ),
                              ),
                              Text(
                                count,
                                style: TextStyle(
                                  color: textPrimary,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Text(
                            course,
                            style: TextStyle(
                                color: textGrey2,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.42),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
