import 'package:antenatal_app/features/add_patient/data/models/add_user_info_model.dart';
import 'package:antenatal_app/features/add_patient/data/repos/add_patient_repo.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_patient_state.dart';

class AddPatientCubit extends Cubit<AddPatientState> {
  AddPatientCubit(this.addPatientRepo) : super(AddPatientInitial());
  final AddPatientRepo addPatientRepo;

  static AddPatientCubit get(context) => BlocProvider.of(context);

  Future<void> fetchPatientUser(
      {required int patientId, required UserInfoModel patientInfo}) async {
    emit(AddPatientLoadingState());
    var result = await addPatientRepo.fetchPatientUser(
        patientId: patientId, patientInfo: patientInfo);
    result.fold((faliure) {
      emit(AddPatientError(error: faliure.message));
    }, (patient) {
      emit(AddPatientSuccsses(patient: patient));
    });
  }
}
