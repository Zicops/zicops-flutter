import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:zicops/views/widgets/GradientButton.dart';
import 'package:zicops/views/widgets/spacer_line.dart';

import '../../utils/colors.dart';

class DateLabelView extends StatefulWidget {
  String label;
  DateTime date;
  DateLabelView(this.date, this.label, {super.key});

  @override
  State<DateLabelView> createState() => _DateLabelViewState();
}

class _DateLabelViewState extends State<DateLabelView> {
  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd MMMM, yyyy');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: textGrey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.33),
        ),
        Text(
          formatter.format(widget.date),
          textAlign: TextAlign.left,
          style: TextStyle(
              color: textPrimary,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.33),
        )
      ],
    );
  }
}

final DateRangePickerController _controller = DateRangePickerController();

Widget cellBuilder(
    BuildContext context, DateRangePickerCellDetails cellDetails) {
  if (_controller.view == DateRangePickerView.month) {
    final isInRange = _controller.selectedDates?.contains(cellDetails.date);
    final isStartDate =
        _controller.selectedRange?.startDate == cellDetails.date;
    final isEndDate = _controller.selectedRange?.endDate == cellDetails.date;
    return Container(
        alignment: Alignment.center, // TODO - make border radius 2.sp
        child: Text(
          DateFormat('dd').format(cellDetails.date),
          style: TextStyle(
            color: isStartDate || isEndDate
                ? secondaryColor
                : DateFormat('dd-MM-yyyy').format(cellDetails.date) ==
                        DateFormat('dd-MM-yyyy').format(DateTime.now())
                    ? primaryColor
                    : textPrimary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ));
  } else if (_controller.view == DateRangePickerView.year) {
    return Container(
        alignment: Alignment.center, // TODO - make border radius 2.sp
        child: Text(
          DateFormat('MMM').format(cellDetails.date),
          style: TextStyle(
            color: textPrimary,
          ),
        ));
  } else if (_controller.view == DateRangePickerView.decade) {
    return Container(
        alignment: Alignment.center, // TODO - make border radius 2.sp
        child: Text(
          DateFormat('yyy').format(cellDetails.date),
          style: TextStyle(
            color: textPrimary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ));
  } else {
    final int yearValue = cellDetails.date.year;
    return Container(
        alignment: Alignment.center, // TODO - make border radius 2.sp
        child: Text(
          yearValue.toString() + ' - ' + (yearValue + 9).toString(),
          style: TextStyle(
            color: textPrimary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}

assignCourseBottomSheet(BuildContext context, double maxHeight, double width) {
  DateTime selectedDate = DateTime.now();
  DateFormat df = DateFormat("dd MMMM, yyyy");
  isOpen(int index, int selectedIndex) {
    return index == selectedIndex;
  }

  showModalBottomSheet<void>(
    context: context,
    backgroundColor: secondaryColor,
    shape: const RoundedRectangleBorder(
        side: BorderSide(color: lightGrey),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16), topLeft: Radius.circular(16))),
    constraints: BoxConstraints(minHeight: 0, maxHeight: maxHeight),
    isScrollControlled: true,
    builder: (BuildContext context) {
      bool showCalander = false;
      bool isChecked = false;

      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
        return SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4.sp,
              width: 36.sp,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 8.sp, bottom: 11.sp),
              decoration: BoxDecoration(
                  color: secondaryColorDark,
                  borderRadius: BorderRadius.circular(4)),
            ),
            Container(
              width: width,
              height: 24.sp,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 15.sp),
              padding: EdgeInsets.symmetric(
                horizontal: 20.sp,
              ),
              child: Text(
                "Assign Course",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: textPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.33),
              ),
            ),
            SpacerLine(width, 1.sp, const EdgeInsets.symmetric(horizontal: 0)),
            Container(
              width: width,
              height: 24.sp,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              margin: EdgeInsets.only(top: 11.sp),
              child: Text(
                "Expected completion date:",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: textPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.33),
              ),
            ),
            Container(
              width: width,
              height: 44.sp,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              margin: EdgeInsets.only(top: 16.sp, bottom: 16.sp),
              child: Row(children: [
                Expanded(
                    child: DateLabelView(
                        _controller.selectedRange?.startDate ??
                            DateTime.now(), // TODO make this reactive
                        "Today")),
                Expanded(
                    child: DateLabelView(
                        _controller.selectedRange?.endDate ??
                            DateTime.now(), // TODO make this reactive
                        "End date"))
              ]),
            ),
            SpacerLine(width, 1.sp, EdgeInsets.symmetric(horizontal: 20.sp)),
            Container(
              width: width,
              height: 24.sp,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 20.sp,
              ),
              margin: EdgeInsets.only(top: 16.sp, bottom: 16.sp),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      df.format(selectedDate),
                      style: TextStyle(
                          color: textPrimary,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.33),
                    ),
                    GestureDetector(
                      onTap: () {
                        setModalState(() {
                          showCalander = !showCalander;
                        });
                      },
                      child: Image.asset(
                        showCalander
                            ? "assets/images/collapse.png"
                            : "assets/images/edit_pen.png",
                        width: 18.sp,
                        height: 18.sp,
                      ),
                    )
                  ]),
            ),
            showCalander
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.sp,
                          child: Text("select date".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  color: textGrey2)),
                        ),
                        SfDateRangePicker(
                          selectionMode: DateRangePickerSelectionMode.range,
                          selectionShape:
                              DateRangePickerSelectionShape.rectangle,
                          startRangeSelectionColor: textPrimary,
                          endRangeSelectionColor: textPrimary,
                          selectionTextStyle: const TextStyle(
                            color: secondaryColorLight,
                          ),
                          rangeSelectionColor: Color(0XFF34363F),
                          cellBuilder: cellBuilder,
                          controller: _controller,
                          selectionRadius: 0,
                        )
                      ],
                    ))
                : const SizedBox.shrink(),
            SpacerLine(width, 1.sp, EdgeInsets.symmetric(horizontal: 20.sp)),
            SizedBox(
              height: 16.sp,
            ),
            SizedBox(
                height: 48.sp,
                child: Row(
                  children: [
                    Checkbox(
                        activeColor: primaryColor,
                        side: BorderSide(color: textPrimary, width: 2.sp),
                        checkColor: Colors.black,
                        value: isChecked,
                        onChanged: (val) {
                          setModalState(() {
                            isChecked = !isChecked;
                          });
                        }),
                    Text(
                      "Course Mandatory",
                      style: TextStyle(
                          color: isChecked ? textPrimary : textGrey2,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.33),
                    ),
                  ],
                )),
            Container(
              width: width,
              height: 40.sp,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Text(
                "By checking the box this course will be assigned to you as a mandatory course.",
                style: TextStyle(
                    color: textGrey2,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.33),
              ),
            ),
            Container(
              width: width,
              height: 112.sp,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              margin: EdgeInsets.symmetric(vertical: 16.sp),
              child: Column(children: [
                GestureDetector(child: GradientButton("Save")),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 48.sp,
                      margin: EdgeInsets.only(top: 16.sp),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: lightGrey, width: 1.sp),
                          borderRadius: BorderRadius.circular(4.sp)),
                      child: Text("Cancel".toUpperCase(),
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: textPrimary,
                              letterSpacing: 2)),
                    )),
              ]),
            )
          ],
        ));
      });
    },
  );
}
