import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/nav_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';

class ReferrelsScreen extends StatelessWidget {
  const ReferrelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    bool isDark = context.watch<DarkModeController>().isDark;

    return Scaffold(
      body: Stack(
        children: [
          VerticalSpace(
            75,
            child: AppBar(
              elevation: 0,
              foregroundColor: AppColors.black,
              backgroundColor: AppColors.transparent,
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
          ),
          Container(
            color: Colors.yellow,
            height: size.height * 0.3,
            child: const Column(),
          ),
        ],
      ),
    );
  }
}
