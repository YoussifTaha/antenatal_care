import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patient_view/logic/cubit/patient_view_cubit.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientViewBasicInfo extends StatefulWidget {
  const PatientViewBasicInfo({super.key});

  @override
  State<PatientViewBasicInfo> createState() => _PatientViewBasicInfoState();
}

class _PatientViewBasicInfoState extends State<PatientViewBasicInfo> {
  @override
  void initState() {
    super.initState();
    PatientViewCubit.get(context).getBasicPatientInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientViewCubit, PatientViewState>(
        builder: (context, state) {
      if (state is GetPatientBasicInfoLoadingState) {
        return Center(
            child: CircularProgressIndicator(
          color: ColorManger.primary,
        ));
      } else if (state is GetPatientBasicInfoSuccsses) {
        UserModel patient = state.patient;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorManger.primary,
                        foregroundColor: Colors.white,
                        radius: 45,
                        child: Icon(
                          Icons.person,
                          size: 55,
                        ),
                      ),
                    ],
                  ),
                  horizontalSpace(18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patient.fullName,
                          style: getBoldStyle(
                              color: Colors.black, fontSize: 15.sp),
                        ),
                        verticalSpace(10),
                        Text(
                          'Age : ${patient.age} |  Occupation : ${patient.occupation}',
                          style: getMediumStyle(
                              color: ColorManger.regularGrey, fontSize: 13.sp),
                        ),
                        verticalSpace(8),
                        Text(
                          'Address : ${patient.address}',
                          style: getRegularStyle(
                              color: ColorManger.regularGrey.withOpacity(0.8),
                              fontSize: 11.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(30),
              Text(
                'Chief Complain : ${patient.chiefComplain}',
                style: getBoldStyle(color: Colors.black, fontSize: 16.sp),
              ),
              verticalSpace(20),
              Text(
                'EDD: ${patient.eDD}',
                style: getRegularStyle(color: Colors.black, fontSize: 12.sp),
              ),
              verticalSpace(20),
              Image.asset(
                'assets/images/baby.png',
                height: 100.h,
                width: 100.h,
              ),
              verticalSpace(15),
              Text(
                'Week ${patient.weekNumber}',
                style: getRegularStyle(
                    color: ColorManger.regularGrey, fontSize: 12.sp),
              ),
              verticalSpace(20),
              Text(
                'First Session At : ${patient.firstSessionDate}',
                style: getRegularStyle(
                    color: ColorManger.regularGrey, fontSize: 15.sp),
              ),
              verticalSpace(30),
            ],
          ),
        );
      } else if (state is GetPatientBasicInfoError) {
        return Center(child: Text('${state.error}'));
      } else
        return Center(child: Text('UnkownError'));
    });
  }
}
