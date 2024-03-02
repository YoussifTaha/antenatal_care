import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/abdomen_examination_section.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/breast_examination_section.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/face_examination_section.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/lower_limbs_examination_section.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/neck_examination_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';

class InspectionFields extends StatefulWidget {
  const InspectionFields({super.key});

  @override
  State<InspectionFields> createState() => _InspectionFieldsState();
}

class _InspectionFieldsState extends State<InspectionFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Inspection:',
          style: getSemiBoldStyle(color: Colors.black, fontSize: 20.sp),
        ),
        verticalSpace(30),
        FaceExaminationSection(),
        verticalSpace(20),
        myVerticalDivider(),
        verticalSpace(20),
        NeckExaminationSection(),
        verticalSpace(20),
        myVerticalDivider(),
        verticalSpace(20),
        AbdomenExaminationSection(),
        verticalSpace(20),
        myVerticalDivider(),
        verticalSpace(20),
        LowerLimbsExaminationSection(),
        verticalSpace(20),
        myVerticalDivider(),
        verticalSpace(20),
        BreastExaminationSection(),
        verticalSpace(30),
      ],
    );
  }
}
