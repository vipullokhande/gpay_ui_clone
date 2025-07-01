import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_string.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/horizontal_space.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';
import 'package:gpay_ui_clone_clone/features/billings/presentation/screens/gift_cart_screen.dart';
import 'package:provider/provider.dart';

class GiftInfoScreen extends StatelessWidget {
  const GiftInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return Scaffold(
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
          HorizontalSpace(15),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            VerticalSpace(30),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                "https://yt3.googleusercontent.com/GCxx7WOY2ZpzNXKRxsgAqUvrj2uWKZapMmM7OY70S9p7bPUArBmWR-luasbvKRlxCICF0tspAFA=s900-c-k-c0x00ffffff-no-rj",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.4,
                height: 110,
              ),
            ),
            TextWidget(
              "Ajio E-Gift Card",
              fontSize: 25,
              padding: EdgeInsets.only(top: 15, bottom: 35),
              fontColor: isDark ? AppColors.black : AppColors.white,
            ),
            Divider(height: 1, color: Color.fromRGBO(66, 67, 67, 1)),
            VerticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  "Select gift cards",
                  fontSize: 15,
                  padding: EdgeInsets.only(left: 25, top: 10),
                  fontColor: isDark
                      ? AppColors.black
                      : Color.fromRGBO(201, 202, 202, 1),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: AppString.giftCardPrices.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GiftCartScreen()),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 8),
                  decoration: BoxDecoration(
                    color: !isDark ? AppColors.darkLight : AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0, color: AppColors.transparent),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        "₹${AppString.giftCardPrices[index]}",
                        fontColor: isDark ? AppColors.black : AppColors.white,
                        fontSize: 20,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: isDark ? AppColors.black : AppColors.white,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
