import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBasicInfoPage extends StatefulWidget {
  const AddBasicInfoPage({Key? key}) : super(key: key);

  @override
  State<AddBasicInfoPage> createState() => _AddBasicInfoPageState();
}

class _AddBasicInfoPageState extends State<AddBasicInfoPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController chiefComplainController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basic info:',
                  style: getSemiBoldStyle(color: Colors.black, fontSize: 18.sp),
                ),
                verticalSpace(30),
                Text(
                  'Full Name',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: fullNameController,
                    type: TextInputType.name,
                    validationMessage: 'Full Name Field Cannot Be Empty'),
                verticalSpace(20),
                Text(
                  'Age',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: ageController,
                    type: TextInputType.number,
                    validationMessage: 'Age Field Cannot Be Empty'),
                verticalSpace(20),
                Text(
                  'Occupation',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: occupationController,
                    type: TextInputType.text,
                    validationMessage: 'Occupation Field Cannot Be Empty'),
                verticalSpace(20),
                Text(
                  'Address',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: addressController,
                    type: TextInputType.text,
                    validationMessage: 'Address Field Cannot Be Empty'),
                verticalSpace(20),
                Text(
                  'Chief Complain',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: chiefComplainController,
                    type: TextInputType.text,
                    validationMessage: 'Chief Complain Field Cannot Be Empty'),
                verticalSpace(30),
                button(
                  context: context,
                  function: () {
                    context.pushNamed(Routes.historyOrExaminationScreen);
                    if (formKey.currentState!.validate()) {}
                  },
                  text: 'Next',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
