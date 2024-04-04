import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/positions/ui/widgets/point_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SittingWidget extends StatelessWidget {
  const SittingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PointItem(
            text:
                '● Sit up with your back straight and your shoulders back. Your buttocks should touch the back of your chair.'),
        PointItem(
            text:
                '● Sit with a back support (such as a small, rolled-up towel or a lumbar roll) placed at the hollow of your back. Here’s how to find a good sitting position when you’re not using a back support or lumbar roll: Sit at the end of your chair and slouch completely.'),
        PointItem(
            text:
                '● Draw yourself up and accentuate the curve of your back as far as possible.'),
        PointItem(text: '● Hold for a few seconds'),
        PointItem(text: '● Release the position slightly (about 10 degrees)'),
        PointItem(text: '● Distribute your body weight evenly on both hips.'),
        PointItem(
            text:
                '● Keep your hips and knees at a 90-degree angle. Use a footrest or stool if necessary. Your legs shouldn’t be crossed and your feet should be flat on the floor.'),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0007.jpg'),
                ],
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0021.jpg'),
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
