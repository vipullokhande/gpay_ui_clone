import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';

class PaymentTypeWidget extends StatelessWidget {
  IconData icon;
  String title;
  PaymentTypeWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      margin: const EdgeInsets.only(right: 10, left: 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: getForegroundColor(context)),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon),
          VerticalSpace(10),
          TextWidget(title, fontColor: getForegroundColor(context)),
        ],
      ),
    );
  }
}
