import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/nav_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/features/profile/presentation/screens/user_profile_details.dart';
import 'package:gpay_ui_clone_clone/features/settings/presentation/widgets/setting_widget.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color.fromARGB(115, 37, 37, 37)
          : AppColors.white,
      appBar: AppBar(
        foregroundColor: isDark ? Colors.white : Colors.black,
        backgroundColor: isDark
            ? const Color.fromARGB(115, 37, 37, 37)
            : AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => NavUtil.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
            child: TextWidget(
              'Settings',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontColor: getForegroundColor(context),
            ),
          ),
          SettingWidget(
            icon: Icons.person_add_alt_1_outlined,
            text: 'Personal info',
            onTap: () => NavUtil.navTo(
              context: context,
              screen: const UserProfileDetails(),
            ),
          ),
          SettingWidget(
            icon: Icons.notifications_none_rounded,
            text: 'Notifications & email',
          ),
          SettingWidget(
            icon: Icons.privacy_tip_outlined,
            text: 'Privacy & security',
          ),
          SettingWidget(icon: Icons.info_outline_rounded, text: 'About'),
          SettingWidget(
            icon: Icons.help_outline_rounded,
            text: 'Help & feedback',
          ),
          SettingWidget(icon: Icons.lock_outline_rounded, text: 'Lock app'),
          SettingWidget(
            icon: Icons.power_settings_new_outlined,
            text: 'Sign out',
          ),
        ],
      ),
    );
  }
}
