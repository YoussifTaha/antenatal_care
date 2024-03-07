import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/examination_cubit/fetch_examination_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PalpationScreen extends StatelessWidget {
  final PageController pageController;
  const PalpationScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchExaminationCubit, FetchExaminationState>(
        builder: (context, state) {
      if (state is FetchExaminationLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is FetchPalpationSuccsses) {
        String? edemaDescription = FetchExaminationCubit.get(context)
            .edemaDescription(grade: state.palpationModel.edemaTest);
        return SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Palpation:',
                    style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
                  ),
                  BackIconButton(
                    pageController: pageController,
                  ),
                ],
              ),
              verticalSpace(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InfoCircles(
                      title: 'Fundus level test',
                      info: state.palpationModel.fundusLevel,
                      icon: Icons.arrow_upward_rounded,
                    ),
                  ),
                  Expanded(
                    child: InfoCircles(
                      title: 'Rectus diastasis test',
                      info: state.palpationModel.rectusDiastasis,
                      icon: Icons.space_bar_rounded,
                    ),
                  ),
                ],
              ),
              verticalSpace(20),
              Row(
                children: [
                  Expanded(
                    child: InfoCircles(
                      title: 'Edema test',
                      info:
                          'Grade ${state.palpationModel.edemaTest}: $edemaDescription',
                      icon: Icons.water_drop_rounded,
                    ),
                  ),
                ],
              ),
              verticalSpace(15),
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
