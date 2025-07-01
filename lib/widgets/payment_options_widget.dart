import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';
import 'package:provider/provider.dart';
import '../core/common/controllers/dark_mode_controller.dart';

class PaymentOptionsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isIcon;
  const PaymentOptionsWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isIcon,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return InkWell(
      splashColor: const Color.fromARGB(255, 231, 204, 236),
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Column(
        children: [
          isIcon
              ? VerticalSpace(
                  55,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: isDark ? 0.9 : 0.75,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: isDark
                              ? Colors.blue.shade900
                              : Colors.blue.shade100,
                          child: Icon(
                            icon,
                            color: getForegroundColor(context),
                            size: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.add_circle,
                          size: 22,
                          color: isDark
                              ? Colors.blue.shade100
                              : Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),
                )
              : VerticalSpace(
                  55,
                  child: Icon(
                    icon,
                    color: isDark ? Colors.blue.shade200 : Colors.blue.shade700,
                    size: 38,
                  ),
                ),
          VerticalSpace(15),
          TextWidget(
            title,
            textAlign: TextAlign.center,
            fontSize: 15,
            fontWeight: FontWeight.w300,
            fontColor: getForegroundColor(context),
          ),
          VerticalSpace(2),
          TextWidget(
            subtitle,
            textAlign: TextAlign.center,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontColor: isDark
                ? const Color.fromARGB(206, 255, 255, 255)
                : const Color.fromARGB(255, 45, 45, 45),
          ),
        ],
      ),
    );
  }
}
