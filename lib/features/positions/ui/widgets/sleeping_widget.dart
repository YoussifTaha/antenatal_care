import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/positions/ui/widgets/point_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SleepingWidget extends StatelessWidget {
  const SleepingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PointItem(
            text:
                'The best sleep position during pregnancy is sleep on side laying. because it provides the best circulation for you and your baby. It also places the least pressure on your veins and internal organs. Sleeping on your left side will increase the amount of blood and nutrients that reach the placenta and your baby. Plus good circulation helps reduce potential swelling, varicose veins in your legs and hemorrhoids.'),
        PointItem(
            text:
                '● place a pillow under your head, but not your shoulders. The pillow should be a thickness that allows your head to be in a normal position to avoid straining your back. You might also want to put a pillow between your legs for support'),
        PointItem(
            text:
                '● Try to sleep in a position that helps you maintain the curve in your back (such as on your side with your knees slightly bent, with a pillow between your knees). Don’t sleep on your side with your knees drawn up to your chest. Avoid sleeping on your stomach.'),
        PointItem(
            text:
                '● Select a firm mattress and box spring set that doesn’t sag. If necessary, place a board under your mattress. You can also place the mattress on the floor temporarily if necessary. If you have always slept on a soft surface, it might be more painful to change to a hard surface. Try to do what’s most comfortable for you.'),
        PointItem(
            text:
                '● Try using a back support (lumbar support) at night to make you more comfortable. A rolled sheet or towel tied aroundyour waist might be helpful.'),
        PointItem(
            text:
                '● When standing up from the lying position, turn on your side, draw up both knees towards your chest and let your legs gently drop off the bed. Sit up by pushing yourself up with your hands. Avoid bending forward at your waist.'),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0012.jpg'),
                ],
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0018.jpg'),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(30),
      ],
    );
  }
}
