import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, double textHeight) {
  return TextStyle(
      height: textHeight,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight);
}

// light style

TextStyle getThinStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double textHeight = 1}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color, textHeight);
}

// light style

TextStyle getExtraLightStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double textHeight = 1}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color, textHeight);
}

// light style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double textHeight = 1}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color, textHeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double textHeight = 1}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, textHeight);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double textHeight = 1}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, textHeight);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double textHeight = 1}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, textHeight);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double textHeight = 1}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, textHeight);
}

// Extrabold style

TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double textHeight = 1}) {
  return _getTextStyle(
      fontSize, FontWeightManager.extraBold, color, textHeight);
}

// Black style

TextStyle getBlackStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double textHeight = 1}) {
  return _getTextStyle(fontSize, FontWeightManager.black, color, textHeight);
}
