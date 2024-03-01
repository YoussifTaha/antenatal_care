import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBasicInfoPage extends StatelessWidget {
  final PageController pageController;
  const AddBasicInfoPage({Key? key, required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController chiefComplainController = TextEditingController();
    TextEditingController eDDController = TextEditingController();
    return SingleChildScrollView(
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
                'Chief Complain',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: chiefComplainController,
                  type: TextInputType.text,
                  validationMessage: 'Chief Complain Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Expected Delivery Date',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: eDDController,
                  type: TextInputType.text,
                  validationMessage: 'EDD Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Week Number',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: eDDController,
                  type: TextInputType.number,
                  validationMessage: 'Week Number Field Cannot Be Empty'),
              verticalSpace(30),
              button(
                context: context,
                function: () {
                  if (formKey.currentState!.validate()) {
                    context.pushNamed(Routes.historyOrExaminationScreen);
                  }
                },
                text: 'Next',
              )
            ],
          ),
        ),
      ),
    );
  }
}
