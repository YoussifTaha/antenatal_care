import 'package:antenatal_app/core/Helpers/date_formatter.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({super.key});

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

final EasyInfiniteDateTimelineController _controller =
    EasyInfiniteDateTimelineController();
DateTime now = DateTime.now();
String dayName = getDayName(now);

String getDayName(DateTime date) {
  return const DateFormatter.fullDateDMY().format();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  @override
  Widget build(BuildContext context) {
    return EasyInfiniteDateTimeLine(
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          dayStrStyle: getBoldStyle(
            color: Colors.black,
            fontSize: 13.sp,
            textHeight: 1.2.h,
          ),
          dayNumStyle: getBoldStyle(
              color: Colors.black, fontSize: 20.sp, textHeight: 1.2.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorManger.primary,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: ColorManger.lightBackground,
          ),
        ),
        disabledDayStyle: DayStyle(
          dayStrStyle: getBoldStyle(
            color: Colors.white,
            fontSize: 13.sp,
            textHeight: 1.2.h,
          ),
          dayNumStyle: getBoldStyle(
              color: Colors.white, fontSize: 20.sp, textHeight: 1.2.h),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: ColorManger.primary,
          ),
        ),
      ),
      disabledDates: [DateTime(2024, 2, 11)],
      headerBuilder: (context, date) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                EasyDateFormatter.fullDateDMY(
                  date,
                ),
                style: getBoldStyle(color: Colors.black, fontSize: 16.sp),
              ),
              Text(
                'View Calendar',
                style: getRegularStyle(
                        color: ColorManger.primary,
                        fontSize: 12.sp,
                        textHeight: 1.2.h)
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),
        );
      },
      controller: _controller,
      firstDate: DateTime.now(),
      lastDate: DateTime(2024, 12, 31),
      onDateChange: (selectedDate) {
        setState(() {
          // _focusDate = selectedDate;
        });
      },
      focusDate: null,
    );
  }
}
