import 'package:antenatal_app/core/Helpers/notification_service.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/patient_view_add_routines/data/repo/patient_view_add_routines_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'patient_view_add_routines.dart';

class PatientViewAddRoutinesCubit extends Cubit<PatientViewAddRoutinesState> {
  PatientViewAddRoutinesCubit(this.patientViewAddInfoRepo)
      : super(PatientViewAddRoutinesInitial());
  final PatientViewAddRoutinesRepo patientViewAddInfoRepo;

  static PatientViewAddRoutinesCubit get(context) => BlocProvider.of(context);

  TimeOfDay? standingTime;
  DateTime standingDate = DateTime.now();
  TimeOfDay? sittingTime;
  DateTime sittingDate = DateTime.now();
  TimeOfDay? houseWorkTime;
  DateTime houseWorkDate = DateTime.now();
  TimeOfDay? drivingTime;
  DateTime drivingDate = DateTime.now();
  TimeOfDay? exercisesTime;
  DateTime exercisesDate = DateTime.now();
  TimeOfDay? bedTime;
  DateTime bedDate = DateTime.now();

  Future<void> selectStandingTime(
    BuildContext context,
  ) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      standingTime = pickedTime;
      standingDate = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, pickedTime.hour, pickedTime.minute);
      NotificationService().scheduleNotification(
        scheduledNotificationDateTime: standingDate,
        title: 'Standing Reminder',
        body: 'We are giving you a reminder To stand Correctly',
        id: 1,
        payload: 'recommendationScreen',
      );
      emit(PatientViewNewTimeAdded());
    }
    emit(PatientViewAddRoutinesInitial());
  }

  Future<void> selectSittingTime(
    BuildContext context,
  ) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      sittingTime = pickedTime;
      sittingDate = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, pickedTime.hour, pickedTime.minute);
      NotificationService().scheduleNotification(
        scheduledNotificationDateTime: sittingDate,
        title: 'Sitting Reminder',
        body: 'We are giving you a reminder To sit Correctly',
        id: 1,
      );
      emit(PatientViewNewTimeAdded());
    }
    emit(PatientViewAddRoutinesInitial());
  }

  Future<void> selectHouseWorkTime(
    BuildContext context,
  ) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      houseWorkTime = pickedTime;
      houseWorkDate = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, pickedTime.hour, pickedTime.minute);
      NotificationService().scheduleNotification(
        scheduledNotificationDateTime: houseWorkDate,
        title: 'House Work Reminder',
        body: 'We are giving you a reminder To do House Work Correctly',
        id: 1,
      );
      emit(PatientViewNewTimeAdded());
    }
    emit(PatientViewAddRoutinesInitial());
  }

  Future<void> selectDrivingTime(
    BuildContext context,
  ) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      drivingTime = pickedTime;
      drivingDate = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, pickedTime.hour, pickedTime.minute);
      NotificationService().scheduleNotification(
        scheduledNotificationDateTime: drivingDate,
        title: 'Driving Reminder',
        body: 'We are giving you a reminder To Drive Correctly',
        id: 1,
      );
      emit(PatientViewNewTimeAdded());
    }
    emit(PatientViewAddRoutinesInitial());
  }

  Future<void> selectExercisesTime(
    BuildContext context,
  ) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      exercisesTime = pickedTime;
      exercisesDate = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, pickedTime.hour, pickedTime.minute);
      emit(PatientViewNewTimeAdded());
      NotificationService().scheduleNotification(
        scheduledNotificationDateTime: exercisesDate,
        title: 'Exercises Reminder',
        body: 'We are giving you a reminder To do Exercises Correctly',
        id: 1,
      );
    }
    emit(PatientViewAddRoutinesInitial());
  }

  Future<void> selectBedTime(
    BuildContext context,
  ) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      bedTime = pickedTime;
      bedDate = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, pickedTime.hour, pickedTime.minute);
      NotificationService().scheduleNotification(
        scheduledNotificationDateTime: bedDate,
        title: 'Bed Time Reminder',
        body: 'We are giving you a reminder To sleep Correctly',
        id: 1,
      );
      emit(PatientViewNewTimeAdded());
    }
    emit(PatientViewAddRoutinesInitial());
  }

  void addPatientRoutines() {
    try {
      patientViewAddInfoRepo.addPatientRoutines(patientInfo: {
        'standingTime': standingDate,
        'sittingDate': sittingDate,
        'houseWorkDate': houseWorkDate,
        'drivingDate': drivingDate,
        'exercisesDate': exercisesDate,
        'bedDate': bedDate,
      });
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
  }

  void catchFireBaseException(FirebaseException e) {
    FirebaseFailure failure = FirebaseFailure.fromFirebaseFirestoreException(e);
    emit(AddPatientRoutinesFromPatientViewError(error: failure.message));
  }
}
