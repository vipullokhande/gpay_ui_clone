import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/controllers/dark_mode_controller.dart';

class FooterWidget extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onTap;
  Widget? istrailing;
  Widget? issubtitle;
  FooterWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.istrailing,
    this.issubtitle,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return Consumer<DarkModeController>(
      builder: (context, value, child) => Stack(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            onTap: onTap,
            leading: Icon(
              // Icons.speed,
              icon,
              color: AppColors.blue,
            ),
            title: TextWidget(
              // 'Check your CIBIL score for \nfree',
              title,
              maxLines: 2,
              fontColor: isDark ? AppColors.white : Colors.black87,
              fontSize: 18,
            ),
            trailing:
                istrailing ??
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: getForegroundColor(context),
                ),
          ),
          VerticalSpace(
            MediaQuery.of(context).size.height * 0.075,
            child: Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.4,
              ),
              child: issubtitle ?? const Padding(padding: EdgeInsets.zero),
            ),
          ),
        ],
      ),
    );
  }
}
