import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/features/home/logic/cubit/home_cubit.dart';
import 'package:antenatal_app/features/patients/ui/widgets/antenatal_patient_card.dart';
import 'package:antenatal_app/features/patients/ui/widgets/page_top_bar.dart';
import 'package:antenatal_app/features/patients/ui/widgets/postpartum_patient_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({Key? key}) : super(key: key);

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  int selectedItemIndex = 0;

  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).fetchMyPatients(uId: 'RLIXEvSewOX33ikNzf8baaksvu62');
  }

  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      backgroundColor: ColorManger.lessLightGray,
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PageTopBar(
            pageController: pageController,
            selectedItemIndex: selectedItemIndex,
            onItemSelected: (index) {
              setState(() {
                selectedItemIndex = index;
              });
            },
          ),
          verticalSpace(15),
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                if (value == 0) {
                  setState(() {
                    selectedItemIndex = value;
                  });
                } else if (value == 1) {
                  setState(() {
                    selectedItemIndex = value;
                  });
                }
              },
              controller: pageController,
              itemBuilder: (context, index) {
                if (index == 0) {
                  selectedItemIndex == 0;
                  return BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                    if (state is GetMyPatientsLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetMyPatientsSuccsses) {
                      if (state.patients.length != 0) {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return AntenatalPatientCard(
                              patient: state.patients[index],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              verticalSpace(15),
                          itemCount: state.patients.length,
                        );
                      } else
                        return Center(child: Text('No Patients Yet'));
                    } else if (state is GetMyPatientsError) {
                      return Text(state.error);
                    } else
                      return Text('Unkown Error');
                  });
                } else
                  selectedItemIndex == 1;
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return PostpartumPatiendCard();
                  },
                  separatorBuilder: (context, index) => verticalSpace(15),
                  itemCount: 3,
                );
              },
              itemCount: 2,
            ),
          ),
        ],
      )),
    );
  }
}
