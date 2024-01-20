import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/cubit/cubit_cubit.dart';
import 'package:pos_system/home.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitCubit(),
      child: BlocBuilder<CubitCubit, CubitState>(
        builder: (context, state) {
          return const MaterialApp(
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
