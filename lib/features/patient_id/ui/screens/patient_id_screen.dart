import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patient_view_loading-screen/logic/cubit/loading_screen_cubit.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientIdScreen extends StatefulWidget {
  const PatientIdScreen({Key? key}) : super(key: key);

  @override
  State<PatientIdScreen> createState() => _PatientIdScreenState();
}

class _PatientIdScreenState extends State<PatientIdScreen> {
  @override
  void initState() {
    super.initState();
    LoadingScreenCubit.get(context)
        .fetchMyId(uId: CacheHelper.getData(key: 'uId'));
  }

  @override
  Widget build(BuildContext context) {
    MyFirebaseFireStoreService myFirebaseFireStoreService =
        MyFirebaseFireStoreService();
    return StreamBuilder(
      stream: myFirebaseFireStoreService.getPatientsCollection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: ColorManger.primary),
          );
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No Messages Found');
        }

        return Scaffold(
          body: BlocConsumer<LoadingScreenCubit, LoadingScreenState>(
            listener: (context, state) {
              var patientsList = snapshot.data!.docs
                  .map((doc) => UserModel.fromJson(doc.data()))
                  .toList();
              var specificPatient = patientsList.firstWhere(
                (element) => element.uId == CacheHelper.getData(key: 'uId'),
              );

              if (specificPatient.myDoctorUid != null) {
                context.pushNamedAndRemoveUntill(Routes.loadingScreen,
                    predicate: (_) => false);
              }
            },
            builder: (context, state) {
              if (state is FetchPatientIdLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FetchPatientIdSuccssesState) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your Id is',
                          style: getBoldStyle(
                              color: ColorManger.darkPrimary, fontSize: 24),
                        ),
                        verticalSpace(5),
                        Text(
                          '${state.patientId}',
                          style: getBoldStyle(
                              color: ColorManger.regularGrey, fontSize: 20),
                        ),
                        verticalSpace(15),
                        Text(
                          textAlign: TextAlign.center,
                          'Wait for your doctor to add your id and then you can follow up with him',
                          style: getMediumStyle(
                              color: ColorManger.regularGrey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is FetchPatientIdErrorState) {
                return Center(
                  child: Text(
                    '${state.error}',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              } else
                return Center(
                  child: Text(
                    'Unexpected Error',
                    style: TextStyle(color: Colors.black),
                  ),
                );
            },
          ),
        );
      },
    );
  }
}
