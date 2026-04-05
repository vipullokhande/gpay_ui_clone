import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/features/dashboard/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DarkModeController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DarkModeController());
    return GetMaterialApp(
      title: 'Gpay-UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Get.find<DarkModeController>().isDark
            ? const Color.fromARGB(115, 37, 37, 37)
            : AppColors.white,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    return Consumer(
      builder: (context, darkModeController, child) {
        return Scaffold(
          body: const HomeScreen(),
          floatingActionButton: FloatingActionButton(
            splashColor: AppColors.purple,
            backgroundColor: isDark ? AppColors.yellow : AppColors.blue,
            child: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              color: getBackgroundColor(context),
            ),
            onPressed: () {
              if (isDark) {
                context.read<DarkModeController>().changeToLight();
              } else {
                context.read<DarkModeController>().changeToDark();
              }
            },
          ),
        );
      },
    );
  }
}
