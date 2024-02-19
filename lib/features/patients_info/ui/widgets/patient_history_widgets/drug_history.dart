import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrugHistoryPage extends StatelessWidget {
  const DrugHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Drug History:',
            style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        verticalSpace(50),
        Row(
          children: [
            Expanded(
              child: InfoCircles(
                title: 'Antiemetics',
                info: 'False',
                icon: Icons.medication_outlined,
              ),
            ),
            Expanded(
              child: InfoCircles(
                title: 'Antacids',
                info: 'False',
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
                info: 'True',
                icon: Icons.medication_outlined,
              ),
            ),
            Expanded(
              child: InfoCircles(
                title: 'Analgesics',
                info: 'True',
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
                info: 'True',
                icon: Icons.medication_outlined,
              ),
            ),
            Expanded(
              child: InfoCircles(
                title: 'Diuretics',
                info: 'False',
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
                info: 'False',
                icon: Icons.medication_outlined,
              ),
            ),
            Expanded(
              child: InfoCircles(
                title: 'Tranquilizers',
                info: 'False',
                icon: Icons.medication_outlined,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
