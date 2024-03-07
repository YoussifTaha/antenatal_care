import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/history_cubit/fetch_history_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrugHistoryPage extends StatelessWidget {
  final PageController pageController;
  const DrugHistoryPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHistoryCubit, FetchHistoryState>(
        builder: (context, state) {
      if (state is FetchHistoryLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is FetchDrugHistorySuccsses) {
        return Column(
          children: [
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Drug History:',
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
                    title: 'Antiemetics',
                    info: state.drugHistoryModel.antiemetics,
                    icon: Icons.medication_outlined,
                  ),
                ),
                Expanded(
                  child: InfoCircles(
                    title: 'Antacids',
                    info: state.drugHistoryModel.antacids,
                    icon: Icons.medication_outlined,
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                Expanded(
                  child: InfoCircles(
                    title: 'Antihistamines',
                    info: state.drugHistoryModel.antihistamines,
                    icon: Icons.medication_outlined,
                  ),
                ),
                Expanded(
                  child: InfoCircles(
                    title: 'Analgesics',
                    info: state.drugHistoryModel.analgesics,
                    icon: Icons.medication_outlined,
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                Expanded(
                  child: InfoCircles(
                    title: 'Antimicrobials',
                    info: state.drugHistoryModel.antimicrobials,
                    icon: Icons.medication_outlined,
                  ),
                ),
                Expanded(
                  child: InfoCircles(
                    title: 'Diuretics',
                    info: state.drugHistoryModel.diuretics,
                    icon: Icons.medication_outlined,
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                Expanded(
                  child: InfoCircles(
                    title: 'Antidepressants',
                    info: state.drugHistoryModel.antidepressants,
                    icon: Icons.medication_outlined,
                  ),
                ),
                Expanded(
                  child: InfoCircles(
                    title: 'Tranquilizers',
                    info: state.drugHistoryModel.tranquilizers,
                    icon: Icons.medication_outlined,
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
