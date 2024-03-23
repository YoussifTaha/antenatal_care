import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/history_cubit/fetch_history_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ObstetricHistoryPage extends StatelessWidget {
  final PageController pageController;
  const ObstetricHistoryPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHistoryCubit, FetchHistoryState>(
        builder: (context, state) {
      if (state is FetchHistoryLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is FetchObstetricHistorySuccsses) {
        return Column(
          children: [
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Obstetric History:',
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
                    title: 'Previous Full Term Pregnancy',
                    info: state.obstetricHistoryModel.fullTermPregnancy,
                    icon: Icons.baby_changing_station_rounded,
                  ),
                ),
                horizontalSpace(0.1),
                Expanded(
                  child: InfoCircles(
                    title: 'Gravidity',
                    info: state.obstetricHistoryModel.gravidity,
                    icon: Icons.pregnant_woman_rounded,
                  ),
                ),
                Expanded(
                  child: InfoCircles(
                    title: 'Previous Abortion',
                    info: state.obstetricHistoryModel.previousAbortion,
                    icon: Icons.local_hospital_rounded,
                  ),
                ),
              ],
            ),
            verticalSpace(20),
            Row(
              children: [
                Expanded(
                  child: InfoCircles(
                    title: 'Previous Living Children',
                    info: state.obstetricHistoryModel.previousLivingChildren,
                    icon: Icons.child_care_rounded,
                  ),
                ),
                Expanded(
                  child: InfoCircles(
                    title: 'Previous Premature Pregnancy',
                    info:
                        state.obstetricHistoryModel.previousPrematurePregnancy,
                    icon: Icons.woman_rounded,
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
