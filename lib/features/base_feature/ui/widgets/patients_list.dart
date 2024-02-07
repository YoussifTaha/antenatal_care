import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/base_feature/ui/widgets/patient_card.dart';
import 'package:flutter/material.dart';

class PatientsList extends StatelessWidget {
  const PatientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const PatientCard();
        },
        separatorBuilder: (context, index) => horizontalSpace(10),
        itemCount: 5);
  }
}
