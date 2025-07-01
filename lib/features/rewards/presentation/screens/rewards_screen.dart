import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/features/rewards/presentation/screens/instant_reward_screen.dart';
import 'package:gpay_ui_clone_clone/features/rewards/presentation/widgets/reward_widget.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;

    final controller = ScrollController();
    List<bool> scratchList = [
      true,
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];
    List<String> assetsname = [
      'assets/jio.png',
      'assets/redbus.png',
      'assets/mv.png',
      'assets/5paisa.png',
      'assets/maha.png',
      'assets/mv.png',
      'assets/jio.png',
      'assets/redbus.png',
      'assets/mv.png',
    ];
    List<String> titles = [
      '₹20 cashback',
      '90% off ',
      '₹500 voucher',
      '₹100 bonus',
      'Cashback upto ₹50',
      '₹20 cashback',
      '90% off ',
      '₹500 voucher',
      '₹100 off',
    ];
    List<String> subtitles = [
      'Upto ₹20 cashback on Mobile recharges Upto ₹20 cashback on Mobile recharges',
      '90% off on redbus booking',
      'Voucher off worth ₹500',
      '₹100 bonus on opening account',
      'Cashback upto ₹50',
      'Upto ₹20 cashback on Mobile recharges',
      '90% off on redbus booking',
      'Voucher off worth ₹500',
      '₹100 bonus on opening account',
    ];

    return Scaffold(
      backgroundColor: isDark
          ? const Color.fromARGB(115, 37, 37, 37)
          : Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 55,
        foregroundColor: isDark ? Colors.white : Colors.black,
        backgroundColor: isDark ? Colors.black : Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text('Rewards', style: TextStyle(fontSize: 20)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: GridView.builder(
              controller: controller,
              itemCount: assetsname.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final asset = assetsname[index];
                final title = titles[index];
                final subtitle = subtitles[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: RewardWidget(
                    isScratch: scratchList[index],
                    text: asset,
                    title: title,
                    subtitle: subtitle,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => InstantRewardScreen(
                            isNeedToScratch: scratchList[index],
                            text: asset,
                            title: title,
                            subtitle: subtitle,
                            onTap: () {},
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
