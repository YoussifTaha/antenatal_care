import 'package:flutter/material.dart';

class PointItem extends StatelessWidget {
  final String text;

  const PointItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
    );
  }
}
