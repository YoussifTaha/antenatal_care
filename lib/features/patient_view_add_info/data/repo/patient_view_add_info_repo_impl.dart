import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/patient_view_add_info/data/repo/patient_view_add_info_repo.dart';

class PatientViewAddInfoRepoImpl extends PatientViewAddInfoRepo {
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();
  int? patientId;

  @override
  void addPatientInfoFromPatientView(
      {required Map<String, dynamic> patientInfo}) async {
    myFirebaseFireStoreService
        .myPatientsCollection(uId: CacheHelper.getData(key: 'myDoctorUid'))
        .doc('${CacheHelper.getData(key: 'patientId')}')
        .update(patientInfo);
  }
}
