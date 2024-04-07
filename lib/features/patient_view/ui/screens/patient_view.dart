import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/notification_service.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/home/ui/widgets/horizontal_calendar.dart';
import 'package:antenatal_app/features/patient_view/ui/widgets/chat_with_doctor_section.dart';
import 'package:antenatal_app/features/patient_view/ui/widgets/patient_view_basic_info.dart';
import 'package:antenatal_app/features/patient_view/ui/widgets/patient_view_drawer.dart';
import 'package:antenatal_app/features/patient_view_add_routines/ui/widgets/routines_section.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_info_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientView extends StatefulWidget {
  const PatientView({super.key});

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  @override
  void initState() {
    super.initState();
    NotificationService().requestNotificationsPermission();
    NotificationService().requestExactAlarmsPermission();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: const PatientViewDrawer(),
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                );
              },
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Text(
                    'Hello! ${CacheHelper.getData(key: 'patientName') ?? ''}',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 18.sp),
                  ),
                ),
                verticalSpace(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: const HorizontalCalendar(),
                ),
                verticalSpace(30),
                RoutinesSection(),
                verticalSpace(20),
                PatientViewBasicInfo(),
                verticalSpace(20),
                ChatWithDoctorSection(),
                verticalSpace(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(Routes.fetchPatientExercisesScreen,
                          arguments: {
                            'patientId': CacheHelper.getData(key: 'patientId'),
                          });
                    },
                    child: PatientInfoChoice(
                        choice: 'My Exercises', icon: Icons.run_circle_rounded),
                  ),
                ),
                verticalSpace(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(
                        Routes.nutritionScreen,
                      );
                    },
                    child: PatientInfoChoice(
                        choice: 'Nutrition Recommedations',
                        icon: Icons.food_bank_rounded),
                  ),
                ),
                verticalSpace(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(
                        Routes.recommendationScreen,
                      );
                    },
                    child: PatientInfoChoice(
                        choice: 'Positions Recommedations',
                        icon: Icons.pregnant_woman_rounded),
                  ),
                ),
                verticalSpace(20),
              ],
            ),
          )),
    );
  }
}
