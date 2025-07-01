import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/nav_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/horizontal_space.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';

class MobileRechargeScreen extends StatefulWidget {
  const MobileRechargeScreen({super.key});

  @override
  State<MobileRechargeScreen> createState() => _MobileRechargeScreenState();
}

class _MobileRechargeScreenState extends State<MobileRechargeScreen> {
  bool isDark = Get.find<DarkModeController>().isDark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => NavUtil.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: TextWidget('Mobile recharge'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 7),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(right: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget('\nEnter mobile number'),
            VerticalSpace(8),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HorizontalSpace(12),
                      Image.asset('assets/flag.png'),
                      HorizontalSpace(12),
                      TextWidget(
                        '+91 ',
                        fontColor: AppColors.black,
                        fontSize: 28,
                      ),
                      HorizontalSpace(
                        MediaQuery.of(context).size.width * 0.5,
                        child: const TextField(
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 28,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 10),
                            hintText: '00000 00000',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(198, 201, 200, 1),
                              fontSize: 30,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
            VerticalSpace(5),
            TextWidget(
              'Ensure this is a valid mobile number',
              fontColor: const Color.fromRGBO(187, 187, 187, 1),
            ),
            TextWidget(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              'My recharges',
              fontSize: 24,
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(),
                title: TextWidget(
                  'Jio Prepaid',
                  fontSize: 24,
                  fontColor: getForegroundColor(context),
                ),
                subtitle: TextWidget(
                  '+91 1234567890',
                  fontSize: 20,
                  fontColor: isDark
                      ? Colors.white.withOpacity(0.6)
                      : AppColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
