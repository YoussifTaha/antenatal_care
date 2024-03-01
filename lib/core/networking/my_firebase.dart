import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirebaseFireStoreService {
  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorsCollection() async {
    return await FirebaseFirestore.instance.collection('userDoctor').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getPatientsCollection() async {
    return await FirebaseFirestore.instance.collection('userPatient').get();
  }
}
