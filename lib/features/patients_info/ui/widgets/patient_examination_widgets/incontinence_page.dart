import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/examination_cubit/fetch_examination_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncontinencePage extends StatelessWidget {
  final PageController pageController;
  const IncontinencePage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchExaminationCubit, FetchExaminationState>(
        builder: (context, state) {
      if (state is FetchExaminationLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is FetchIncontinenceSuccsses) {
        String incontinenceDescription = FetchExaminationCubit.get(context)
            .incontinenceDescription(grade: state.incontinenceModel.grade);
        return SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Incontinence:',
                    style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
                  ),
                  BackIconButton(
                    pageController: pageController,
                  ),
                ],
              ),
              verticalSpace(40),
              Row(
                children: [
                  InfoCircles(
                    title: 'Patient\'s Grade',
                    info: 'Grade ${state.incontinenceModel.grade}',
                    icon: Icons.format_list_numbered_rounded,
                  ),
                  horizontalSpace(40),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          incontinenceDescription,
                          style: getBoldStyle(
                              color: ColorManger.darkPrimary,
                              fontSize: 16,
                              textHeight: 1.5.h),
                        ),
                        verticalSpace(8),
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
    });
  }
}
