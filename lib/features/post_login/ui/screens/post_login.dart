import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/post_login/logic/cubit/post_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostLogiScreen extends StatefulWidget {
  const PostLogiScreen({Key? key}) : super(key: key);

  @override
  State<PostLogiScreen> createState() => _PostLogiScreenState();
}

class _PostLogiScreenState extends State<PostLogiScreen> {
  @override
  void initState() {
    super.initState();
    PostLoginCubit.get(context)
        .fetchUserType(uId: '${CacheHelper.getData(key: 'uId')}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<PostLoginCubit, PostLoginState>(
          listener: (context, state) {
            if (state is GetUserTypeSuccsses) {
              PostLoginCubit.get(context)
                  .navigatoToMainScreenBasedOnUserType(context);
            }
            if (state is GetUserTypeError) {
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
                'Logging In',
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
