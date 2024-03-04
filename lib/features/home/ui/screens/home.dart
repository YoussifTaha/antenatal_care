import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/home/logic/cubit/home_cubit.dart';
import 'package:antenatal_app/features/home/ui/widgets/add_patient_two_buttons_row.dart';
import 'package:antenatal_app/features/home/ui/widgets/home_drawer.dart';
import 'package:antenatal_app/features/home/ui/widgets/horizontal_calendar.dart';
import 'package:antenatal_app/features/home/ui/widgets/patients_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeCubit.get(context)
        .fetchMyPatients(uId: '${CacheHelper.getData(key: 'uId')}');
    HomeCubit.get(context)
        .fetchDoctorName(uId: '${CacheHelper.getData(key: 'uId')}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: const HomeDrawer(),
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
                    'Hello! Doctor Mohamed',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 18.sp),
                  ),
                ),
                verticalSpace(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: const HorizontalCalendar(),
                ),
                verticalSpace(25),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: SizedBox(
                    height: 240.h,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            height: 210.h,
                            width: 380.w,
                            'assets/images/purpleBackground.png',
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: CachedNetworkImage(
                              width: 160.w,
                              height: 250.h,
                              imageUrl:
                                  'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/wepik-export-20240130141812K144.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 125),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Add New Patients Either Manually Or By Their Id',
                                    style: getBoldStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        textHeight: 1.3),
                                  ),
                                  verticalSpace(20),
                                  const AddPatientsTwoButtonsRow()
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Patients',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary,
                                fontSize: 18.sp),
                          ),
                          Text(
                            'View All',
                            style: getRegularStyle(
                                    color: ColorManger.primary,
                                    fontSize: 12.sp,
                                    textHeight: 1.2.h)
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                    SizedBox(height: 260.h, child: const PatientsList()),
                    verticalSpace(20),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
