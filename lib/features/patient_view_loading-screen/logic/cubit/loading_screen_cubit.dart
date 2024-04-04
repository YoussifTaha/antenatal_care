import 'package:antenatal_app/features/patient_view_loading-screen/data/repo/loading_screen_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'loading_screen_state.dart';

class LoadingScreenCubit extends Cubit<LoadingScreenState> {
  LoadingScreenCubit(this.loadingScreenRepo) : super(LoadingScreenInitial());

  static LoadingScreenCubit get(context) => BlocProvider.of(context);

  final LoadingScreenRepo loadingScreenRepo;

  Future<void> fetchMyDoctorUidAndCheckPersonalInfo(
      {required String uId}) async {
    await fetchMyId(uId: uId);
    fetchMyDoctorUid(uId: uId);
  }

  Future<void> fetchMyDoctorUid({required String uId}) async {
    emit(GetMyDoctorUidLoadingState());
    var result = await loadingScreenRepo.fetchMyDoctorUid(uId: uId);
    await fetchIsPersonalInfoAdded(uId: uId);
    result.fold((faliure) {
      emit(GetMyDoctorUidError(error: faliure.message));
    }, (myDoctorUid) {
      emit(GetMyDoctorUidSuccsses(myDoctorUid: myDoctorUid));
    });
  }

  Future<void> fetchIsPersonalInfoAdded({required String uId}) async {
    await loadingScreenRepo.fetchIsPersonalInfoAdded(uId: uId);
  }

  Future<void> fetchMyId({required String uId}) async {
    emit(FetchPatientIdLoadingState());
    var result = await loadingScreenRepo.fetchMyId(uId: uId);
    result.fold((faliure) {
      emit(FetchPatientIdErrorState(error: faliure.message));
    }, (patientId) {
      emit(FetchPatientIdSuccssesState(patientId: patientId));
    });
  }
}
