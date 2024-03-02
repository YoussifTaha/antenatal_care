import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/history/add_past_history.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/history/add_present_history.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/history/add_urine_system_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'add_drug_history.dart';
import 'add_family_history.dart';
import 'add_obstetric_history.dart';
import 'add_personal_history.dart';
import 'add_psychological_history_page.dart';

class AddPatientHistoryScreen extends StatefulWidget {
  final int patientId;
  const AddPatientHistoryScreen({Key? key, required this.patientId})
      : super(key: key);

  @override
  State<AddPatientHistoryScreen> createState() =>
      _AddPatientHistoryScreenState();
}

class _AddPatientHistoryScreenState extends State<AddPatientHistoryScreen> {
  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 1.1,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'New Patient',
          style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height.h,
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 8,
          controller: pageController,
          itemBuilder: (context, index) {
            switch (index) {
              case 1:
                return AddFamilyHistoryPage(
                  patientId: widget.patientId,
                  pageController: pageController,
                );
              case 2:
                return AddPresentHistoryPage(
                  patientId: widget.patientId,
                  pageController: pageController,
                );
              case 3:
                return AddPastHistoryPage(
                  patientId: widget.patientId,
                  pageController: pageController,
                );
              case 4:
                return AddObstetricHistoryPage(
                  patientId: widget.patientId,
                  pageController: pageController,
                );
              case 5:
                return AddUrineSystemHistoryPage(
                  patientId: widget.patientId,
                  pageController: pageController,
                );
              case 6:
                return AddDrugHistoryPage(
                  patientId: widget.patientId,
                  pageController: pageController,
                );
              case 7:
                return AddPsychologicalHistoryPage(
                  patientId: widget.patientId,
                  pageController: pageController,
                );
              default:
                return AddPersonalHistoryPage(
                  patientId: widget.patientId,
                  pageController: pageController,
                );
            }
          },
        ),
      ),
    );
  }
}
