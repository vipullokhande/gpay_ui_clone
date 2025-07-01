import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';

// ignore: must_be_immutable
class SettingWidget extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback? onTap;
  SettingWidget({Key? key, required this.icon, required this.text, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: AppColors.blue, size: 30),
        title: TextWidget(
          text,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontColor: getForegroundColor(context),
        ),
      ),
    );
  }
}
