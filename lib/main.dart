import 'package:antenatal_app/antenatal_app.dart';
import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:antenatal_app/core/Helpers/notification_service.dart';
import 'package:antenatal_app/core/bloc_observer/bloc_observer.dart';
import 'package:antenatal_app/core/di/dependency_injection.dart';
import 'package:antenatal_app/core/routing/app_router.dart';
import 'package:antenatal_app/firebase_options.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService().initializeNotifications();
  tz.initializeTimeZones();
  await CacheHelper.init();
  setupLocator();
  Bloc.observer = MyBlocObserver();
  runApp(AntenatalApp(
    appRouter: AppRouter(),
  ));
}
