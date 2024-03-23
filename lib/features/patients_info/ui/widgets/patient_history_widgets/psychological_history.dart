import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/history_cubit/fetch_history_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PsychologicalHistoryPage extends StatelessWidget {
  final PageController pageController;
  const PsychologicalHistoryPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHistoryCubit, FetchHistoryState>(
        builder: (context, state) {
      if (state is FetchHistoryLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is FetchPsychologicalHistorySuccsses) {
        return Column(
          children: [
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Psychological History:',
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
                    title: 'Any emotional disturbances',
                    info: '',
                    icon: Icons.sentiment_dissatisfied_outlined,
                  ),
                ),
                horizontalSpace(20),
                Expanded(
                  flex: 2,
                  child: Text(
                    ':   ${state.psychologicalHistoryModel.emotions}',
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
                    title: 'Anxiety or depression',
                    info: '',
                    icon: Icons.psychology_alt_rounded,
                  ),
                ),
                horizontalSpace(20),
                Expanded(
                  flex: 2,
                  child: Text(
                    ':   ${state.psychologicalHistoryModel.anxiety}',
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
                    title: 'Any stress to the patient during Pregnancy',
                    info: '',
                    icon: Icons.attribution_rounded,
                  ),
                ),
                horizontalSpace(20),
                Expanded(
                  flex: 2,
                  child: Text(
                    ':   ${state.psychologicalHistoryModel.stress}',
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
