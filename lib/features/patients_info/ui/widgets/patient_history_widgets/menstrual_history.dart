import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/history_cubit/fetch_history_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenstrualHistoryPage extends StatelessWidget {
  final PageController pageController;
  const MenstrualHistoryPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHistoryCubit, FetchHistoryState>(
        builder: (context, state) {
      if (state is FetchHistoryLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is FetchMenstrualHistorySuccsses) {
        return Column(
          children: [
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menstrual History:',
                  style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
                ),
                BackIconButton(pageController: pageController),
              ],
            ),
            verticalSpace(30),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InfoCircles(
                    title: 'Menarche',
                    info: '',
                    icon: Icons.water_drop,
                  ),
                ),
                horizontalSpace(20),
                Expanded(
                  flex: 2,
                  child: Text(
                    ':   ${state.menstrualHistoryModel.menarche}',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 16),
                  ),
                )
              ],
            ),
            verticalSpace(20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InfoCircles(
                    title: 'Frequency',
                    info: '',
                    icon: Icons.refresh,
                  ),
                ),
                horizontalSpace(20),
                Expanded(
                  flex: 2,
                  child: Text(
                    ':   ${state.menstrualHistoryModel.frequency}',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 16),
                  ),
                )
              ],
            ),
            verticalSpace(20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InfoCircles(
                    title: 'Regularity',
                    info: '',
                    icon: Icons.equalizer,
                  ),
                ),
                horizontalSpace(20),
                Expanded(
                  flex: 2,
                  child: Text(
                    ':   ${state.menstrualHistoryModel.regularity}',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 16),
                  ),
                )
              ],
            ),
            verticalSpace(20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InfoCircles(
                    title: 'Duration',
                    info: '',
                    icon: Icons.timelapse,
                  ),
                ),
                horizontalSpace(20),
                Expanded(
                  flex: 2,
                  child: Text(
                    ':   ${state.menstrualHistoryModel.duration}',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 16),
                  ),
                )
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
