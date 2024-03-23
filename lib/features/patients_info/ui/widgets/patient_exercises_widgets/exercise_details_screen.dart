import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/data/models/exercise_model/exercises_model.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_exercises_widgets/exercise_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PatientExerciseDetails extends StatefulWidget {
  final PatientsExercisesModel patientsExercisesModel;
  const PatientExerciseDetails({Key? key, required this.patientsExercisesModel})
      : super(key: key);

  @override
  State<PatientExerciseDetails> createState() => _PatientExerciseDetailsState();
}

late YoutubePlayerController youtubePlayerController;

class _PatientExerciseDetailsState extends State<PatientExerciseDetails>
    with TickerProviderStateMixin {
  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          trimWhitespaces: true, widget.patientsExercisesModel.videoUrl ?? '')!,
      flags: YoutubePlayerFlags(
        startAt: 5,
        autoPlay: false,
        mute: true,
        loop: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: youtubePlayerController,
        showVideoProgressIndicator: true,
      ),
      builder: (p0, p1) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.patientsExercisesModel.name ?? '',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 22.sp),
                  ),
                  verticalSpace(30),
                  Text(
                    'Exercise Details',
                    style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
                  ),
                  verticalSpace(10),
                  Text(
                    widget.patientsExercisesModel.description ?? '',
                    style: getRegularStyle(
                        color: ColorManger.regularGrey.withOpacity(0.8),
                        fontSize: 14.sp,
                        textHeight: 1.1),
                  ),
                  verticalSpace(10),
                  ExerciseVideo(
                    youtubePlayerController: youtubePlayerController,
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
