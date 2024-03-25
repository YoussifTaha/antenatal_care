import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirebaseFireStoreService {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference patientCollection = _firestore.collection('userPatient');
  CollectionReference doctorCollection = _firestore.collection('userDoctor');
  CollectionReference myPatientsCollection({required String uId}) {
    return _firestore
        .collection('userDoctor')
        .doc(uId)
        .collection('myPatients');
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getExercisesCollection() async {
    return await FirebaseFirestore.instance.collection('exercises').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMyPatientsCollection(
      {required String uid}) async {
    return await doctorCollection.doc(uid).collection('myPatients').get();
  }

  Future<DocumentSnapshot> getDoctorDoc({required String uid}) async {
    return await doctorCollection.doc(uid).get();
  }

  Future<DocumentSnapshot> getPatientDoc({required String uid}) async {
    return await patientCollection.doc(uid).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getPatientExercisesCollection(
      {required int patientId}) async {
    return await doctorCollection
        .doc(CacheHelper.getData(key: 'uId'))
        .collection('myPatients')
        .doc('$patientId')
        .collection('Exercises')
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorChatsCollection(
      {required String uId}) async {
    return await doctorCollection
        .doc(CacheHelper.getData(key: 'uId'))
        .collection('myChats')
        .get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessagesCollection(
      {required String patientId}) {
    print(patientId);
    return doctorCollection
        .doc(doctorUid())
        .collection('myChats')
        .doc(patientId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots();
  }

  String doctorUid() {
    if (CacheHelper.getData(key: 'userType') == 'doctorUser') {
      return CacheHelper.getData(key: 'uId');
    } else
      return CacheHelper.getData(key: 'myDoctorUid');
  }

  DocumentReference<Object?> myChatsDoc(String patientId) {
    DocumentReference documentReference =
        doctorCollection.doc(doctorUid()).collection('myChats').doc(patientId);
    return documentReference;
  }
}
