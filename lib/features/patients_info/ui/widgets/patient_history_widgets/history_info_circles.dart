import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/history_cubit/fetch_history_cubit.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/patients_info_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';

class HistoryInfoCircles extends StatefulWidget {
  final int patientId;
  final PageController pageController;

  const HistoryInfoCircles({
    super.key,
    required this.pageController,
    required this.patientId,
  });

  @override
  State<HistoryInfoCircles> createState() => _HistoryInfoCirclesState();
}

class _HistoryInfoCirclesState extends State<HistoryInfoCircles> {
  @override
  Widget build(BuildContext context) {
    var cubit = PatientsInfoCubit.get(context);
    var fetchHistoryCubit = FetchHistoryCubit.get(context);
    return Column(
      children: [
        verticalSpace(20),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientHistoryScreenPageView(
                      newHistoryTitle: 'Personal History',
                      pageController: widget.pageController);
                  fetchHistoryCubit.fetchPersonalHistory(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'Personal History',
                  info: '',
                  icon: Icons.person,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientHistoryScreenPageView(
                      newHistoryTitle: 'Family history',
                      pageController: widget.pageController);
                  fetchHistoryCubit.fetchFamilyHistory(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'Family history',
                  info: '',
                  icon: Icons.family_restroom,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(10),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientHistoryScreenPageView(
                      newHistoryTitle: 'Present history',
                      pageController: widget.pageController);
                  fetchHistoryCubit.fetchPresentHistory(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'Present history',
                  info: '',
                  icon: Icons.history,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientHistoryScreenPageView(
                      newHistoryTitle: 'Past history',
                      pageController: widget.pageController);
                  fetchHistoryCubit.fetchPastHistory(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'Past history',
                  info: '',
                  icon: Icons.date_range_rounded,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(10),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientHistoryScreenPageView(
                      newHistoryTitle: 'Obstetric history',
                      pageController: widget.pageController);
                  fetchHistoryCubit.fetchObstetricHistory(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'Obstetric history',
                  info: '',
                  icon: Icons.baby_changing_station_rounded,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientHistoryScreenPageView(
                      newHistoryTitle: 'Menstrual history',
                      pageController: widget.pageController);
                  fetchHistoryCubit.fetchMenstrualHistory(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'Menstrual history',
                  info: '',
                  icon: Icons.water_drop_rounded,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(10),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientHistoryScreenPageView(
                      newHistoryTitle: 'History for urinary System',
                      pageController: widget.pageController);
                  fetchHistoryCubit.fetchUrinarySystemHistory(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'History for urinary System',
                  info: '',
                  icon: Icons.airline_seat_individual_suite_rounded,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientHistoryScreenPageView(
                      newHistoryTitle: 'Drug History',
                      pageController: widget.pageController);
                  fetchHistoryCubit.fetchDrugHistory(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'Drug History',
                  info: '',
                  icon: Icons.local_hospital_rounded,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(10),
        Row(
          children: [
            horizontalSpace(20),
            InkWell(
              onTap: () {
                cubit.changePatientHistoryScreenPageView(
                    newHistoryTitle: 'Psychological History',
                    pageController: widget.pageController);
                fetchHistoryCubit.fetchPsychologicalHistory(
                    patientId: widget.patientId);
              },
              child: InfoCircles(
                title: 'Psychological History',
                info: '',
                icon: Icons.psychology_alt,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
