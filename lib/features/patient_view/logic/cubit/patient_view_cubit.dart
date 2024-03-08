import 'package:antenatal_app/features/patient_view/data/patient_view_repo.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'patient_view_state.dart';

class PatientViewCubit extends Cubit<PatientViewState> {
  PatientViewCubit(this.patientsViewInfoRepo) : super(PatientViewInitial());

  static PatientViewCubit get(context) => BlocProvider.of(context);

  final PatientsViewInfoRepo patientsViewInfoRepo;

  Future<void> getBasicPatientInfo() async {
    emit(GetPatientBasicInfoLoadingState());
    var result = await patientsViewInfoRepo.getBasicPatientInfo();
    result.fold((faliure) {
      emit(GetPatientBasicInfoError(error: faliure.message));
    }, (patient) {
      emit(GetPatientBasicInfoSuccsses(patient: patient));
    });
  }

  Future<void> fetchPatientName({required String uId}) async {
    await patientsViewInfoRepo.fetchPatientName(uId: uId);
  }
}
