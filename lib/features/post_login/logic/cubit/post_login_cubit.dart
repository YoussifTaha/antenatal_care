import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/features/post_login/data/repo/post_login_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_login_state.dart';

class PostLoginCubit extends Cubit<PostLoginState> {
  PostLoginCubit(this.postLoginRepo) : super(PostLoginInitial());

  static PostLoginCubit get(context) => BlocProvider.of(context);

  final PostLoginRepo postLoginRepo;

  Future<void> fetchUserType({required String uId}) async {
    emit(GetUserTypeLoadingState());
    var result = await postLoginRepo.fetchUserType(uId: uId);
    result.fold((faliure) {
      emit(GetUserTypeError(error: faliure.message));
    }, (userType) {
      emit(GetUserTypeSuccsses(userType: userType));
    });
  }

  void navigatoToMainScreenBasedOnUserType(BuildContext context) {
    if (CacheHelper.getData(key: 'userType') == 'userDoctor') {
      context.pushNamedAndRemoveUntill(Routes.homeLayout,
          predicate: (Route<dynamic> route) => false);
    } else {
      context.pushNamedAndRemoveUntill(Routes.patientViewScreen,
          predicate: (Route<dynamic> route) => false);
    }
  }
}
