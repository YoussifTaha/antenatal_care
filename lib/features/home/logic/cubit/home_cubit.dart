import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/features/home/data/repos/home_repo.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchMyPatients({required String uId}) async {
    emit(GetMyPatientsLoadingState());
    var result = await homeRepo.fetchMyPatients(uId: uId);
    result.fold((faliure) {
      emit(GetMyPatientsError(error: faliure.message));
    }, (patients) {
      emit(GetMyPatientsSuccsses(patients: patients));
    });
  }

  void removeUserCache() {
    CacheHelper.removeData(key: 'uId');
    CacheHelper.removeData(key: 'isSignedUp');
    CacheHelper.removeData(key: 'isLogedIn');
    CacheHelper.removeData(key: 'isAccountCreated');
    CacheHelper.removeData(key: 'userType');
    CacheHelper.removeData(key: 'doctorName');
    CacheHelper.removeData(key: 'myDoctorUid');
    CacheHelper.removeData(key: 'isPersonalInfoAdded');
    CacheHelper.removeData(key: 'patientId');
    CacheHelper.removeData(key: 'patientName');
  }

  Future<void> fetchDoctorName({required String uId}) async {
    await homeRepo.fetchDoctorName(uId: uId);
  }
}
