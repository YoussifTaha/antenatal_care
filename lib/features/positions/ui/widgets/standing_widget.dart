import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/positions/ui/widgets/point_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StandingWidget extends StatelessWidget {
  const StandingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PointItem(
            text:
                '● Hold your head up straight with your chin in. Don’t tilt your head forward, backward, or sideways.'),
        PointItem(
            text:
                '● Make sure your ear lobes are in line with the middle of your shoulders.'),
        PointItem(
            text: '● Keep your shoulder blades back and your chest forward.'),
        PointItem(text: '● Keep your knees straight, but not locked.'),
        PointItem(text: '● Stretch the top of your head toward the ceiling.'),
        PointItem(
            text:
                '● Tighten your stomach, pulling it in and up when you’re able. Don’t tilt your pelvis forward or backward. Keep your buttocks tucked in when you’re able.'),
        PointItem(
            text:
                '● Point your feet in the same direction, with your weight balanced evenly on both feet. The arches of your feet should be supported with low-heeled (but not flat) shoes.'),
        PointItem(
            text: '● Avoid standing in the same position for a long time.'),
        PointItem(
            text:
                '● If you need to stand for long periods, adjust the height of the work table to a comfortable level if possible. Try to elevate one foot by resting it on a stool or box. After several minutes, switch your foot position.'),
        PointItem(
            text:
                '● While working in the kitchen, open the cabinet under the sink and rest one foot on the inside of the cabinet. Change feet every five to 15 minutes.'),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0010.jpg'),
                ],
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0011.jpg'),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0024.jpg'),
                ],
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0017.jpg'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
