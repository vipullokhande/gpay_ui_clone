import 'package:flutter/material.dart';

class NavUtil {
  //
  NavUtil._();

  //
  static navTo({
    required BuildContext context,
    required Widget screen,
  }) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );
  //
  static pop(BuildContext context) => Navigator.of(context).pop();
}
