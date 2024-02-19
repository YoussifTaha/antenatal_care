import 'package:antenatal_app/antenatal_app.dart';
import 'package:antenatal_app/core/bloc_observer/bloc_observer.dart';
import 'package:antenatal_app/core/routing/app_router.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(AntenatalApp(
    appRouter: AppRouter(),
  ));
}
