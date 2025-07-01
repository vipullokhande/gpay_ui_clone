import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:provider/provider.dart';

getForegroundColor(BuildContext context) =>
    context.watch<DarkModeController>().isDark
    ? AppColors.white
    : AppColors.black;

getBackgroundColor(BuildContext context) =>
    context.watch<DarkModeController>().isDark
    ? AppColors.black
    : AppColors.white;
