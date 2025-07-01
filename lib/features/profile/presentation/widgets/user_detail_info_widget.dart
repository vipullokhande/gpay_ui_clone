import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class UserDetailInfoWidget extends StatelessWidget {
  IconData icon;
  String title;
  String subtitle;
  String trailText;
  VoidCallback? onTap;
  UserDetailInfoWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      leading: Icon(icon, color: Colors.blue, size: 30),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isDark
              ? const Color.fromARGB(182, 255, 255, 255)
              : const Color.fromARGB(182, 0, 0, 0),
        ),
      ),
      trailing: Text(
        trailText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.blue,
        ),
      ),
      onTap: onTap,
    );
  }
}
