import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';

// ignore: must_be_immutable
class GridWidget extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback onTap;
  GridWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return GestureDetector(
      // splashColor: Colors.deepPurple.shade200,
      // borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: Container(
        color: getBackgroundColor(context),
        width: size * 0.23,
        height: 90,
        child: Column(
          children: [
            VerticalSpace(10),
            Icon(icon, color: getForegroundColor(context), size: 28),
            VerticalSpace(7),
            TextWidget(
              text,
              textAlign: TextAlign.center,
              fontSize: 13,
              fontColor: getForegroundColor(context),
            ),
          ],
        ),
      ),
    );
  }
}
