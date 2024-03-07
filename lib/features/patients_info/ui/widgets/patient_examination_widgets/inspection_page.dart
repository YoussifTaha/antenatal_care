import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/examination_cubit/fetch_examination_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InspectionScreen extends StatelessWidget {
  final PageController pageController;
  const InspectionScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchExaminationCubit, FetchExaminationState>(
      builder: (context, state) {
        if (state is FetchExaminationLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FetchInspectionSuccsses) {
          Map<String, dynamic>? face = state.inspectionModel.face;
          Map<String, dynamic>? neck = state.inspectionModel.neck;
          Map<String, dynamic>? abdomen = state.inspectionModel.abdomen;
          Map<String, dynamic>? lowerLimbs = state.inspectionModel.lowerLimbs;
          Map<String, dynamic>? breast = state.inspectionModel.breast;
          return SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Inspection:',
                      style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
                    ),
                    BackIconButton(
                      pageController: pageController,
                    ),
                  ],
                ),
                verticalSpace(20),
                Row(
                  children: [
                    InfoCircles(
                      title: 'Face',
                      info: '',
                      icon: Icons.face_4_rounded,
                    ),
                    horizontalSpace(40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fascial expression:  ${face?['expression']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'Color: ${face?['color']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'Edema of eye lids: ${face?['eyeLidsEdema']} , lips: ${face?['lipsEdema']}, cheecks: ${face?['cheeksEdema']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'preclampsia: ${face?['preclampsia']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'Pigmentation(cloasma) : ${face?['cloasma']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                Row(
                  children: [
                    InfoCircles(
                      title: 'Neck',
                      info: '',
                      icon: Icons.nest_cam_wired_stand,
                    ),
                    horizontalSpace(40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thyroid enlargement:  ${neck?['thyroid']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'Pulsating neck veins: ${neck?['pulsatingVeins']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                Row(
                  children: [
                    InfoCircles(
                      title: 'Abdomen',
                      info: '',
                      icon: Icons.pregnant_woman_rounded,
                    ),
                    horizontalSpace(40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Linea nigra:  ${abdomen?['lineaNigra']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'Striae gravidarum (stretch marks): ${abdomen?['stretchMarks']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'Scar on abdomen: ${abdomen?['scar']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                Row(
                  children: [
                    InfoCircles(
                      title: 'Lower limbs',
                      info: '',
                      icon: Icons.airline_seat_legroom_reduced_outlined,
                    ),
                    horizontalSpace(20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deformity: ${lowerLimbs?['deformity']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'Varicose veins: ${lowerLimbs?['oedema']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'Oedema: ${lowerLimbs?['varicoseVenis']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                Row(
                  children: [
                    InfoCircles(
                      title: 'Breast',
                      info: '',
                      icon: Icons.female,
                    ),
                    horizontalSpace(40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Size (enlargement):  ${breast?['size']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'Slight elevation of skin temperature: ${breast?['skinTemp']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'Hyper pigmentation of primary areola: ${breast?['primaryAreola']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(8),
                          Text(
                            'Appearance of secondary areola: ${breast?['secondryAreola']}.',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary, fontSize: 16),
                          ),
                          verticalSpace(15),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is FetchExaminationError) {
          return Center(child: Text('${state.error}'));
        } else
          return Center(child: Text('UnkownError'));
      },
    );
  }
}
