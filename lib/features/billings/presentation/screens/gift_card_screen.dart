import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_string.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';
import 'package:gpay_ui_clone_clone/features/billings/presentation/screens/gift_info_screen.dart';
import 'package:provider/provider.dart';

class GiftCardScreen extends StatelessWidget {
  const GiftCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return Consumer(
      builder: (context, darkModeController, child) => Scaffold(
        backgroundColor: !isDark ? AppColors.black : AppColors.white,
        appBar: AppBar(
          backgroundColor: !isDark ? AppColors.black : AppColors.white,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: isDark ? AppColors.black : AppColors.white,
            ),
          ),
          title: TextWidget(
            "Gift cards",
            fontColor: isDark ? AppColors.black : AppColors.white,
            fontSize: 20,
          ),
          actions: [
            Icon(
              Icons.more_vert,
              color: isDark ? AppColors.black : AppColors.white,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18).copyWith(top: 8),
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.darkLight,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    width: 1,
                    color: !isDark ? AppColors.darkLight : AppColors.white,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.card_giftcard,
                      color: isDark ? AppColors.black : AppColors.white,
                    ),
                    TextWidget(
                      "Your gift cards",
                      padding: EdgeInsets.only(left: 10),
                      fontColor: isDark ? AppColors.black : AppColors.white,
                      fontSize: 16,
                    ),
                    Spacer(),
                    TextWidget(
                      "See all",
                      fontColor: const Color.fromARGB(255, 153, 205, 248),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: AppString.giftCardTitles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Chip(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          width: 1,
                          color: isDark ? AppColors.black : AppColors.white,
                        ),
                      ),
                      backgroundColor: index == 0
                          ? AppColors.blue
                          : !isDark
                          ? AppColors.black
                          : AppColors.white,
                      label: TextWidget(
                        AppString.giftCardTitles[index],
                        fontSize: 12,
                        fontColor: index == 0
                            ? AppColors.white
                            : isDark
                            ? AppColors.black
                            : AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GiftInfoScreen()),
                  );
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: !isDark ? AppColors.darkLight : AppColors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide.none,
                  ),
                  child: Column(
                    children: [
                      VerticalSpace(5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            "https://yt3.googleusercontent.com/GCxx7WOY2ZpzNXKRxsgAqUvrj2uWKZapMmM7OY70S9p7bPUArBmWR-luasbvKRlxCICF0tspAFA=s900-c-k-c0x00ffffff-no-rj",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.235,
                            height: 60,
                          ),
                        ),
                      ),
                      TextWidget(
                        "Ajio E-Gift\nCard",
                        fontColor: isDark ? AppColors.black : AppColors.white,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
