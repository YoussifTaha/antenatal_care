import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/history_cubit/fetch_history_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalHistoryPage extends StatelessWidget {
  final PageController pageController;
  const PersonalHistoryPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHistoryCubit, FetchHistoryState>(
        builder: (context, state) {
      if (state is FetchHistoryLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is FetchPersonalHistorySuccsses) {
        return Column(
          children: [
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Personal History:',
                  style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
                ),
                BackIconButton(pageController: pageController),
              ],
            ),
            verticalSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCircles(
                  title: 'Parity Count',
                  info: state.personalHistoryModel.parityCount,
                  icon: Icons.pregnant_woman_rounded,
                ),
                horizontalSpace(0.1),
                InfoCircles(
                  title: 'Marital Status',
                  info: state.personalHistoryModel.maritalStatus,
                  icon: Icons.family_restroom_rounded,
                ),
                InfoCircles(
                  title: 'Marriage Duration',
                  info: state.personalHistoryModel.mariageDuration,
                  icon: Icons.calendar_month_rounded,
                ),
              ],
            ),
            verticalSpace(20),
            Row(
              children: [
                Expanded(
                  child: InfoCircles(
                    title: 'Smoking',
                    info: state.personalHistoryModel.smoking,
                    icon: Icons.smoking_rooms_rounded,
                  ),
                ),
                Expanded(
                  child: InfoCircles(
                    title: 'Alchohol',
                    info: state.personalHistoryModel.alchohol,
                    icon: Icons.local_bar_outlined,
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
