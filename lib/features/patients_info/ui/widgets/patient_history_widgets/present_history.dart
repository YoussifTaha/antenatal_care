import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/history_cubit/fetch_history_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PresentHistoryPage extends StatelessWidget {
  final PageController pageController;
  const PresentHistoryPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHistoryCubit, FetchHistoryState>(
        builder: (context, state) {
      if (state is FetchHistoryLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is FetchPresentHistorySuccsses) {
        return Column(
          children: [
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Present History:',
                  style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
                ),
                BackIconButton(pageController: pageController),
              ],
            ),
            verticalSpace(50),
            Row(
              children: [
                Expanded(
                  child: InfoCircles(
                    title: 'Onset Of Complain',
                    info: state.presentHistoryModel.onsetOfComplain,
                    icon: Icons.personal_injury,
                  ),
                ),
                horizontalSpace(0.1),
                Expanded(
                  child: InfoCircles(
                    title: 'Course',
                    info: state.presentHistoryModel.course,
                    icon: Icons.timelapse,
                  ),
                ),
              ],
            ),
            verticalSpace(20),
            Row(
              children: [
                Expanded(
                  child: InfoCircles(
                    title: 'Duration',
                    info: state.presentHistoryModel.duration,
                    icon: Icons.timer,
                  ),
                ),
                Expanded(
                  child: InfoCircles(
                    title: 'Date of Admission',
                    info: state.presentHistoryModel.dateOfAdmission,
                    icon: Icons.calendar_month,
                  ),
                ),
              ],
            ),
          ],
        );
      } else if (state is FetchHistoryError) {
        return Center(child: Text('${state.error}'));
      } else
        return Center(child: Text('UnkownError'));
    });
  }
}
