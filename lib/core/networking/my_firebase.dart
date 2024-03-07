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
}
