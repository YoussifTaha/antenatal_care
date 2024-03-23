import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/patient_view_add_routines/data/repo/patient_view_add_routines_repo.dart';

class PatientViewAddRoutinesRepoImpl extends PatientViewAddRoutinesRepo {
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();
  int? patientId;

  @override
  void addPatientRoutines({required Map<String, dynamic> patientInfo}) async {
    myFirebaseFireStoreService
        .myPatientsCollection(uId: CacheHelper.getData(key: 'myDoctorUid'))
        .doc('${CacheHelper.getData(key: 'patientId')}')
        .update(patientInfo);
  }
}
