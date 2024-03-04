import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirebaseFireStoreService {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference patientCollection = _firestore.collection('userPatient');
  CollectionReference doctorCollection = _firestore.collection('userDoctor');

  Future<QuerySnapshot<Map<String, dynamic>>> getExercisesCollection() async {
    return await FirebaseFirestore.instance.collection('exercises').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMyPatientsCollection(
      {required String uid}) async {
    return await doctorCollection.doc(uid).collection('myPatients').get();
  }
}
