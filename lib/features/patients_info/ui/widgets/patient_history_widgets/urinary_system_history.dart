import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/history_cubit/fetch_history_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UrineSystemHistoryPage extends StatelessWidget {
  final PageController pageController;
  const UrineSystemHistoryPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHistoryCubit, FetchHistoryState>(
        builder: (context, state) {
      if (state is FetchHistoryLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is FetchUrinarySystemHistorySuccsses) {
        return Column(
          children: [
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Urine System History:',
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
                    title: 'Burning Sensations During Micturition',
                    info: state.urineSystemHistoryModel.burning,
                    icon: Icons.local_fire_department,
                  ),
                ),
                horizontalSpace(0.1),
                Expanded(
                  child: InfoCircles(
                    title: 'Retention Of Urine',
                    info: state.urineSystemHistoryModel.retention,
                    icon: Icons.warning_rounded,
                  ),
                ),
                Expanded(
                  child: InfoCircles(
                    title: 'Polyuria',
                    info: state.urineSystemHistoryModel.polyuria,
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
                    title:
                        'Dribbling of urine during coughing, or other activities',
                    info: state.urineSystemHistoryModel.dribbling,
                    icon: Icons.water_drop_rounded,
                  ),
                ),
                Expanded(
                  child: InfoCircles(
                    title: 'Feeling of something descending down per vagina',
                    info: state.urineSystemHistoryModel.feeling,
                    icon: Icons.female,
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
