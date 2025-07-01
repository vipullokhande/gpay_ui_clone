import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/controllers/dark_mode_controller.dart';

class ProfileBottomWidget extends StatelessWidget {
  String trailingText;
  String title;
  String subtitle;
  IconData leading;
  ProfileBottomWidget({
    super.key,
    required this.leading,
    required this.trailingText,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 3,
      ),
      onTap: () {},
      leading: Icon(
        leading,
        color: Colors.blue,
        size: 26,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: isDark ? Colors.white : Colors.black,
              fontSize: 17,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: isDark
                  ? const Color.fromARGB(225, 255, 255, 255)
                  : const Color.fromARGB(255, 66, 65, 65),
              fontSize: 13,
            ),
          ),
        ],
      ),
      trailing: TextButton(
        onPressed: () {},
        child: Text(
          // 'Add',
          trailingText,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
