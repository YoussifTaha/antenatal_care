import 'package:flutter/material.dart';

Widget button({
  required BuildContext context,
  Color color = Colors.pink,
  Color textColor = Colors.white,
  double width = double.infinity,
  double? height,
  required function,
  required String text,
  double fontSize = 14,
}) =>
    SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        elevation: 0,
        color: color,
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            height: 1,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.50,
          ),
        ),
      ),
    );

Widget outlinedButton({
  Color color = Colors.pink,
  Color textColor = Colors.pink,
  double? height,
  double width = double.infinity,
  required function,
  required String text,
  MaterialStateProperty<OutlinedBorder?>? shape,
  ButtonStyle? style,
  MaterialStateProperty<BorderSide?>? side,
}) =>
    SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            side: MaterialStatePropertyAll(
              BorderSide(
                  style: BorderStyle.solid,
                  strokeAlign: -3.0,
                  width: 2.0,
                  color: color),
            )),
        onPressed: function,
        child: Text(text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
