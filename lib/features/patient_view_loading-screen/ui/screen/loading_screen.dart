import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/patient_view_loading-screen/logic/cubit/loading_screen_cubit.dart';
import 'package:antenatal_app/features/post_login/logic/cubit/post_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    LoadingScreenCubit.get(context).fetchMyDoctorUidAndCheckPersonalInfo(
        uId: '${CacheHelper.getData(key: 'uId')}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<LoadingScreenCubit, LoadingScreenState>(
          listener: (context, state) {
            if (state is GetMyDoctorUidSuccsses) {}
            if (state is GetMyDoctorUidError) {
              showToast(text: state.error, state: ToastStates.error);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: ColorManger.primary,
              ),
              verticalSpace(20),
              Text(
                'Loading',
                style:
                    getBoldStyle(color: ColorManger.primary, fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
