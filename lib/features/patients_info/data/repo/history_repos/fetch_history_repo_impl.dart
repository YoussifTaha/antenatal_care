import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/drug_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/family_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/menstrual_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/obstetric_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/past_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/personal_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/present_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/psychological_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/urine_system_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/repo/history_repos/fetch_history_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FetchHistoryRepoImpl extends FetchHistoryRepo {
  MyFirebaseFireStoreService myFirebaseService = MyFirebaseFireStoreService();

  CollectionReference<Object?> getHistoryCollection(int patientId) {
    CollectionReference historyCollection = myFirebaseService.doctorCollection
        .doc('${CacheHelper.getData(key: 'uId')}')
        .collection('myPatients')
        .doc('$patientId')
        .collection('History');
    return historyCollection;
  }

  @override
  Future<Either<Failure, PersonalHistoryModel>> fetchPersonalHistory({
    required int patientId,
  }) async {
    DocumentSnapshot personalHistoryDoc =
        await getHistoryCollection(patientId).doc('PersonalHistory').get();
    try {
      PersonalHistoryModel personalHistoryModel = PersonalHistoryModel(
        alchohol: personalHistoryDoc.get('alchohol'),
        mariageDuration: personalHistoryDoc.get('mariageDuration'),
        maritalStatus: personalHistoryDoc.get('maritalStatus'),
        parityCount: personalHistoryDoc.get('parityCount'),
        smoking: personalHistoryDoc.get('smoking'),
      );
      return right(personalHistoryModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, DrugHistoryModel>> fetchDrugHistory(
      {required int patientId}) async {
    DocumentSnapshot drugHistoryDoc =
        await getHistoryCollection(patientId).doc('DrugHistory').get();
    try {
      DrugHistoryModel drugHistoryModel = DrugHistoryModel(
          antiemetics: drugHistoryDoc.get('antiemetics'),
          antacids: drugHistoryDoc.get('antacids'),
          antihistamines: drugHistoryDoc.get('antihistamines'),
          analgesics: drugHistoryDoc.get('analgesics'),
          antimicrobials: drugHistoryDoc.get('antimicrobials'),
          diuretics: drugHistoryDoc.get('diuretics'),
          antidepressants: drugHistoryDoc.get('antidepressants'),
          tranquilizers: drugHistoryDoc.get('tranquilizers'));
      return right(drugHistoryModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, FamilyHistoryModel>> fetchFamilyHistory(
      {required int patientId}) async {
    DocumentSnapshot familyHistoryDoc =
        await getHistoryCollection(patientId).doc('FamilyHistory').get();
    try {
      FamilyHistoryModel familyHistoryModel = FamilyHistoryModel(
        certainDisases: familyHistoryDoc.get('certainDisases'),
        consanguinityMarriage: familyHistoryDoc.get('consanguinityMarriage'),
        historyOfTwins: familyHistoryDoc.get('historyOfTwins'),
      );

      return right(familyHistoryModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, MenstrualHistoryModel>> fetchMenstrualHistory(
      {required int patientId}) async {
    DocumentSnapshot menstrualHistoryDoc =
        await getHistoryCollection(patientId).doc('MenstrualHistory').get();
    try {
      MenstrualHistoryModel menstrualHistoryModel = MenstrualHistoryModel(
          menarche: menstrualHistoryDoc.get('menarche'),
          frequency: menstrualHistoryDoc.get('frequency'),
          regularity: menstrualHistoryDoc.get('regularity'),
          duration: menstrualHistoryDoc.get('duration'));

      return right(menstrualHistoryModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, ObstetricHistoryModel>> fetchObstetricHistory(
      {required int patientId}) async {
    DocumentSnapshot obstetricHistoryDoc =
        await getHistoryCollection(patientId).doc('ObstetricHistory').get();
    try {
      ObstetricHistoryModel obstetricHistoryModel = ObstetricHistoryModel(
        fullTermPregnancy: obstetricHistoryDoc.get('fullTermPregnancy'),
        gravidity: obstetricHistoryDoc.get('gravidity'),
        previousAbortion: obstetricHistoryDoc.get('previousAbortion'),
        previousLivingChildren:
            obstetricHistoryDoc.get('previousLivingChildren'),
        previousPrematurePregnancy:
            obstetricHistoryDoc.get('previousPrematurePregnancy'),
      );

      return right(obstetricHistoryModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, PastHistoryModel>> fetchPastHistory(
      {required int patientId}) async {
    DocumentSnapshot pastHistoryDoc =
        await getHistoryCollection(patientId).doc('PastHistory').get();
    try {
      PastHistoryModel pastHistoryModel = PastHistoryModel(
          diseases: pastHistoryDoc.get('diseases'),
          operations: pastHistoryDoc.get('operations'),
          trauma: pastHistoryDoc.get('trauma'));

      return right(pastHistoryModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, PresentHistoryModel>> fetchPresentHistory(
      {required int patientId}) async {
    DocumentSnapshot presentHistoryDoc =
        await getHistoryCollection(patientId).doc('PresentHistory').get();
    try {
      PresentHistoryModel presentHistoryModel = PresentHistoryModel(
          onsetOfComplain: presentHistoryDoc.get('onsetOfComplain'),
          course: presentHistoryDoc.get('course'),
          duration: presentHistoryDoc.get('duration'),
          dateOfAdmission: presentHistoryDoc.get('dateOfAdmission'));

      return right(presentHistoryModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, PsychologicalHistoryModel>> fetchPsychologicalHistory(
      {required int patientId}) async {
    DocumentSnapshot psychologicalHistoryDoc =
        await getHistoryCollection(patientId).doc('PsychologicalHistory').get();
    try {
      PsychologicalHistoryModel psychologicalHistoryModel =
          PsychologicalHistoryModel(
              emotions: psychologicalHistoryDoc.get('emotions'),
              anxiety: psychologicalHistoryDoc.get('anxiety'),
              stress: psychologicalHistoryDoc.get('stress'));

      return right(psychologicalHistoryModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, UrineSystemHistoryModel>> fetchUrinarySystemHistory(
      {required int patientId}) async {
    DocumentSnapshot psychologicalHistoryDoc =
        await getHistoryCollection(patientId).doc('UrineSystemHistory').get();
    try {
      UrineSystemHistoryModel urineSystemHistoryModel = UrineSystemHistoryModel(
        burning: psychologicalHistoryDoc.get('burning'),
        retention: psychologicalHistoryDoc.get('retention'),
        polyuria: psychologicalHistoryDoc.get('polyuria'),
        dribbling: psychologicalHistoryDoc.get('dribbling'),
        feeling: psychologicalHistoryDoc.get('feeling'),
      );

      return right(urineSystemHistoryModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }
}
