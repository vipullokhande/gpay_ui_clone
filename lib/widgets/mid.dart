// ignore_for_file: must_be_immutable
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:flutter/material.dart';

class Mid extends StatelessWidget {
  IconData icon;
  String text;
  Mid({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return InkWell(
      onTap: () {},
      splashColor: Colors.purpleAccent,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 100,
        margin: const EdgeInsets.all(7),
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
          color: isDark
              ? const Color.fromARGB(126, 0, 0, 0)
              : const Color.fromARGB(100, 172, 171, 171),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: AppColors.blue),
            TextWidget(
              text,
              fontSize: 12,
              fontColor: getForegroundColor(context),
            ),
          ],
        ),
      ),
    );
  }
}
