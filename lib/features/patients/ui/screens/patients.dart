import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/features/patients/ui/widgets/antenatal_patient_card.dart';
import 'package:antenatal_app/features/patients/ui/widgets/page_top_bar.dart';
import 'package:antenatal_app/features/patients/ui/widgets/postpartum_patient_card.dart';
import 'package:flutter/material.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({Key? key}) : super(key: key);

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      backgroundColor: ColorManger.lessLightGray,
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PageTopBar(
            pageController: pageController,
            selectedItemIndex: selectedItemIndex,
            onItemSelected: (index) {
              setState(() {
                selectedItemIndex = index;
              });
            },
          ),
          verticalSpace(15),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  selectedItemIndex == 0;
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return AntenatalPatientCard();
                    },
                    separatorBuilder: (context, index) => verticalSpace(15),
                    itemCount: 3,
                  );
                } else
                  selectedItemIndex == 1;
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return PostpartumPatiendCard();
                  },
                  separatorBuilder: (context, index) => verticalSpace(15),
                  itemCount: 3,
                );
              },
              itemCount: 2,
            ),
          ),
        ],
      )),
    );
  }
}
