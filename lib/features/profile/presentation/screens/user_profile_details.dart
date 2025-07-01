import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:gpay_ui_clone_clone/features/profile/presentation/widgets/user_detail_info_widget.dart';

// ignore: must_be_immutable
class UserProfileDetails extends StatelessWidget {
  const UserProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: isDark
          ? const Color.fromARGB(115, 37, 37, 37)
          : Colors.white,
      appBar: AppBar(
        foregroundColor: isDark ? Colors.white : Colors.black,
        backgroundColor: isDark
            ? const Color.fromARGB(115, 37, 37, 37)
            : Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text('Personal info'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/vip.png',
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                  ),
                ),
                Positioned(
                  right: size.width * 0.33,
                  bottom: size.height * 0.05,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: IconButton(
                      splashRadius: 26,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mode_edit_outline_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          UserDetailInfoWidget(
            icon: Icons.smartphone,
            title: 'Mobile number',
            subtitle: '+91 7744959632',
            trailText: 'Edit',
            onTap: () {},
          ),
          UserDetailInfoWidget(
            icon: Icons.email_outlined,
            title: 'Email',
            trailText: '',
            subtitle: 'vipullokhande1@gmail.com',
          ),
          UserDetailInfoWidget(
            icon: Icons.language,
            title: 'Language',
            subtitle: 'English (United states)',
            trailText: 'Change',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
