import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/positions/ui/widgets/point_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LiftingWidget extends StatelessWidget {
  const LiftingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PointItem(
            text:
                '● If you must lift objects, don’t try to lift objects that are awkward or heavier than 20 pounds.'),
        PointItem(
            text:
                '● Before you lift an object, make sure you have firm footing'),
        PointItem(
            text:
                '● To pick up an object that’s lower than the level of your waist, keep your back straight and bend at your knees and hips. Don’t bend forward at the waist with your knees straight. Stand with a wide stance close to the object you’re trying to pick up, and keep your feet firmly on the ground. Tighten your stomach muscles, along with your pelvic floor muscles (Kegel) and lift the object using your leg muscles. Straighten your knees in a steady motion. Don’t jerk the object up to your body.'),
        PointItem(
            text:
                '● Stand completely upright without twisting. Always move your feet forward when lifting an object.'),
        PointItem(
            text:
                '● If you’re lifting an object from a table, slide it to the edge of the table so you can hold it close to your body. Bend your knees so you’re close to the object. Use your legs to lift the object and come to a standing position.'),
        PointItem(text: '● Distribute your body weight evenly on both hips.'),
        PointItem(text: '● Avoid lifting heavy objects above waist level.'),
        PointItem(
            text:
                '● Hold packages close to your body with your arms bent. Keep your stomach muscles tight. Take small steps and go slowly.'),
        PointItem(
            text:
                '● To lower the object, place your feet as you did to lift. Tighten your stomach muscles, and bend your hips and knees.'),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0009.jpg'),
                ],
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0004.jpg'),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(30),
        PointItem(
            text:
                '● Try to avoid sitting in the same position for more than 30 minutes.'),
        PointItem(
            text:
                '● At work, adjust your chair height and workstation so you can sit up close to your work and tilt it up at you. Rest your elbows and arms on your chair or desk, keeping your shoulders relaxed. When sitting in a chair that rolls and pivots, don’t twist at the waist while sitting. Instead, turn your whole body.When standing up from the sitting position, move tothe front of the seat of your chair. Stand up by straightening your legs. Avoid bending forward at your waist.Immediately stretch your back by doing 10 standing back bends.'),
        PointItem(
            text:
                '● At work, adjust your chair height and workstation so you can sit up close to your work and tilt it up at you. Rest yourelbows and arms on your chair or desk, keeping your shoulders relaxed. When sitting in a chair that rolls and pivots,don’t twist at the waist while sitting. Instead, turn your whole body.When standing up from the sitting position, move tthe front of the seat of your chair. Stand up by straightening your legs. Avoid bending forward at your waist.Immediately stretch your back by doing 10 standing back bends.'),
      ],
    );
  }
}
