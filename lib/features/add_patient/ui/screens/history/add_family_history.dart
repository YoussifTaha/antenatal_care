import 'package:antenatal_app/features/add_patient/logic/cubit/history_cubit/cubit/history_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/history_bloc_consumer.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/family_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';

class AddFamilyHistoryPage extends StatefulWidget {
  final int patientId;
  final PageController pageController;
  const AddFamilyHistoryPage({
    super.key,
    required this.pageController,
    required this.patientId,
  });

  @override
  State<AddFamilyHistoryPage> createState() => _AddFamilyHistoryPageState();
}

class _AddFamilyHistoryPageState extends State<AddFamilyHistoryPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController certainDiseasesController = TextEditingController();
  TextEditingController consanguinityController = TextEditingController();
  TextEditingController twinsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Family History:',
                        style: getSemiBoldStyle(
                            color: Colors.black, fontSize: 18.sp),
                      ),
                    ],
                  ),
                  BackIconButton(pageController: widget.pageController)
                ],
              ),
              verticalSpace(30),
              Text(
                'Certain Diseases',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: certainDiseasesController,
                  type: TextInputType.text,
                  validationMessage: 'Certain Diseases Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Consanguinity Marriage',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: consanguinityController,
                  type: TextInputType.text,
                  validationMessage:
                      'Consanguinity marriage Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'History of Twins',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: twinsController,
                  type: TextInputType.text,
                  validationMessage: 'History of Twins Field Cannot Be Empty'),
              verticalSpace(30),
              HistoryBlocConsumer(
                  button: button(
                    context: context,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        FamilyHistoryModel familyHistoryModel =
                            FamilyHistoryModel(
                                certainDisases: certainDiseasesController.text,
                                consanguinityMarriage:
                                    consanguinityController.text,
                                historyOfTwins: twinsController.text);
                        HistoryCubit.get(context).addFamilyHistory(
                            patientId: widget.patientId,
                            familyHistoryModel: familyHistoryModel);
                      }
                    },
                    text: 'Next',
                  ),
                  pageController: widget.pageController),
            ],
          ),
        ),
      ),
    );
  }
}
