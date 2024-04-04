import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/positions/ui/widgets/point_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DrivingWidget extends StatelessWidget {
  const DrivingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PointItem(
            text:
                '● Use a back support (lumbar roll) at the curve of your back. Your knees should be at the same level as your hips'),
        PointItem(
            text:
                '● Move the seat close to the steering wheel to support the curve of your back. The seat should be close enough to allow your knees to bend and your feet to reach the pedals.'),
        PointItem(
            text:
                '● Always wear both lap and shoulder safety belts. Place the lap belt under your abdomen, as low on your hips as possible and across your upper thighs. Never place the belt above your abdomen. Place the shoulder belt between your breasts. Adjust the shoulder and lap belts as snugly as possible.'),
        PointItem(
            text:
                '● If your vehicle is equipped with an airbag, it’s very important to wear your shoulder and lap belts. In addition, always sit back at least 10 inches away from where the airbag is stored. On the driver’s side, the airbag is located in the steering wheel. When driving, pregnant people should adjust the steering wheel so it’s tilted toward their chest and away from their head and abdomen.'),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0015.jpg'),
                ],
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/IMG-20240327-WA0002.jpg'),
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
