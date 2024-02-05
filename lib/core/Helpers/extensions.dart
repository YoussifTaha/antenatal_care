import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(arguments: arguments, routeName);
  }

  Future<dynamic> pushReplacmentNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(arguments: arguments, routeName);
  }

  Future<dynamic> pushNamedAndRemoveUntill(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, arguments: arguments, predicate);
  }

  void pop() => Navigator.of(this).pop();
}
