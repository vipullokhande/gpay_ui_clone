import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class MidBillWidget extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback onTap;
  MidBillWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: getForegroundColor(context),
          shadowColor: isDark ? AppColors.blue : AppColors.grey,
          backgroundColor: isDark
              ? const Color.fromARGB(255, 48, 47, 47)
              : AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Container(
          height: 105,
          width: size.width * 0.14,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.blue),
              TextWidget(
                text,
                textAlign: TextAlign.center,
                maxLines: 2,
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
                fontColor: getForegroundColor(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
