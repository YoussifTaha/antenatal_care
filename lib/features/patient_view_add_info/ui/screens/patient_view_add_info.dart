import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';
import 'package:antenatal_app/features/patient_view_add_info/logic/cubit/patient_view_add_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientViewAddInfo extends StatefulWidget {
  const PatientViewAddInfo({super.key});

  @override
  State<PatientViewAddInfo> createState() => _PatientViewAddInfoState();
}

class _PatientViewAddInfoState extends State<PatientViewAddInfo> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = PatientViewAddInfoCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Your Info',
          style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),
                Text(
                  'Age',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: cubit.ageController,
                    type: TextInputType.text,
                    validationMessage: 'This Field Cannot Be Empty'),
                verticalSpace(20),
                Text(
                  'Address',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: cubit.addressController,
                    type: TextInputType.text,
                    validationMessage: 'This Field Cannot Be Empty'),
                verticalSpace(20),
                Text(
                  'Occupation',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: cubit.occupationController,
                    type: TextInputType.text,
                    validationMessage: 'This Field Cannot Be Empty'),
                verticalSpace(30),
                BlocConsumer<PatientViewAddInfoCubit, PatientViewAddInfoState>(
                  listener: (context, state) {
                    if (state is AddPatientInfoFromPatientViewSuccsses) {
                      context.pushNamedAndRemoveUntill(Routes.patientViewScreen,
                          predicate: (Route<dynamic> route) => false);
                    }
                  },
                  builder: (context, state) {
                    if (state is AddPatientInfoFromPatientViewLoadingState) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: ColorManger.primary,
                      ));
                    } else
                      return button(
                        context: context,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            cubit.addPatientInfoFromPatientView();
                          }
                          ;
                        },
                        text: 'Continue',
                      );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
