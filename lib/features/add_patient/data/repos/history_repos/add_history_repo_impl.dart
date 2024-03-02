import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/add_patient/data/repos/history_repos/add_history_repo.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/drug_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/family_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/menstrual_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/obstetric_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/past_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/personal_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/present_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/psychological_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/urine_system_history_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddHistoryRepoImpl extends AddHistoryRepo {
  MyFirebaseFireStoreService myFirebaseService = MyFirebaseFireStoreService();

  CollectionReference<Object?> getHistoryCollection(int patientId) {
    CollectionReference historyCollection = myFirebaseService.doctorCollection
        .doc('RLIXEvSewOX33ikNzf8baaksvu62')
        .collection('myPatients')
        .doc('$patientId')
        .collection('History');
    return historyCollection;
  }

  @override
  void addPersonalHistory(
      {required int patientId,
      required PersonalHistoryModel personalHistoryModel}) {
    CollectionReference<Object?> historyCollection =
        getHistoryCollection(patientId);
    historyCollection.doc('PersonalHistory').set(personalHistoryModel.toJson());
  }

  @override
  void addDrugHistory(
      {required int patientId, required DrugHistoryModel drugHistoryModel}) {
    CollectionReference<Object?> historyCollection =
        getHistoryCollection(patientId);
    historyCollection.doc('DrugHistory').set(drugHistoryModel.toJson());
  }

  @override
  void addFamilyHistory(
      {required int patientId,
      required FamilyHistoryModel familyHistoryModel}) {
    CollectionReference<Object?> historyCollection =
        getHistoryCollection(patientId);
    historyCollection.doc('FamilyHistory').set(familyHistoryModel.toJson());
  }

  @override
  void addMenstrualHistory(
      {required int patientId,
      required MenstrualHistoryModel menstrualHistoryModel}) {
    CollectionReference<Object?> historyCollection =
        getHistoryCollection(patientId);
    historyCollection
        .doc('MenstrualHistory')
        .set(menstrualHistoryModel.toJson());
  }

  @override
  void addObstetricHistory(
      {required int patientId,
      required ObstetricHistoryModel obstetricHistoryModel}) {
    CollectionReference<Object?> historyCollection =
        getHistoryCollection(patientId);
    historyCollection
        .doc('ObstetricHistory')
        .set(obstetricHistoryModel.toJson());
  }

  @override
  void addPastHistory(
      {required int patientId, required PastHistoryModel pastHistoryModel}) {
    CollectionReference<Object?> historyCollection =
        getHistoryCollection(patientId);
    historyCollection.doc('PastHistory').set(pastHistoryModel.toJson());
  }

  @override
  void addPresentHistory(
      {required int patientId,
      required PresentHistoryModel presentHistoryModel}) {
    CollectionReference<Object?> historyCollection =
        getHistoryCollection(patientId);
    historyCollection.doc('PresentHistory').set(presentHistoryModel.toJson());
  }

  @override
  void addPsychologicalHistory(
      {required int patientId,
      required PsychologicalHistoryModel psychologicalHistoryModel}) {
    CollectionReference<Object?> historyCollection =
        getHistoryCollection(patientId);
    historyCollection
        .doc('PsychologicalHistory')
        .set(psychologicalHistoryModel.toJson());
  }

  @override
  void addUrinarySystemHistory(
      {required int patientId,
      required UrineSystemHistoryModel urineSystemHistoryModel}) {
    CollectionReference<Object?> historyCollection =
        getHistoryCollection(patientId);
    historyCollection
        .doc('UrineSystemHistory')
        .set(urineSystemHistoryModel.toJson());
  }
}
