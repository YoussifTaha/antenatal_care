import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/add_basic_info.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/add_patient_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewPatient extends StatefulWidget {
  const AddNewPatient({Key? key}) : super(key: key);

  @override
  State<AddNewPatient> createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {
  PageController pageController = PageController();
  TextEditingController iDController = TextEditingController();

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
      body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 0) {
              return AddPatientId(
                iDController: iDController,
                pageController: pageController,
              );
            } else
              return AddBasicInfoPage(
                pageController: pageController,
                iDController: iDController,
              );
          },
          controller: pageController,
          itemCount: 2),
    );
  }
}
