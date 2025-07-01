import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/horizontal_space.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GiftCartScreen extends StatelessWidget {
  const GiftCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return ResponsiveBuilder(
      builder: (_, resSize) {
        final size = MediaQuery.of(context).size;
        var resminHeight = resSize.deviceScreenType == DeviceScreenType.mobile
            ? size.height * 0.2
            : size.height * 0.3;
        var resmaxHeight = resSize.deviceScreenType == DeviceScreenType.mobile
            ? size.height * 0.58
            : size.height * 0.5;
        return Scaffold(
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
          body: SlidingUpPanel(
            body: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2,
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              color: !isDark ? AppColors.black : AppColors.grey,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: !isDark ? AppColors.darkMedium : AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 0, color: AppColors.transparent),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        "https://yt3.googleusercontent.com/GCxx7WOY2ZpzNXKRxsgAqUvrj2uWKZapMmM7OY70S9p7bPUArBmWR-luasbvKRlxCICF0tspAFA=s900-c-k-c0x00ffffff-no-rj",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 75,
                      ),
                    ),
                    TextWidget(
                      "Ajio E-Gift Card",
                      fontSize: 15,
                      padding: EdgeInsets.only(top: 25),
                      fontColor: isDark ? AppColors.black : AppColors.white,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          "₹",
                          fontSize: 35,
                          padding: EdgeInsets.zero,
                          fontColor: isDark ? AppColors.black : AppColors.white,
                        ),
                        TextWidget(
                          "50",
                          fontSize: 60,
                          padding: EdgeInsets.zero,
                          fontColor: isDark ? AppColors.black : AppColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            color: AppColors.darkMedium,
            parallaxEnabled: true,
            parallaxOffset: 0.50,
            maxHeight: resmaxHeight,
            minHeight: resminHeight,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            panelBuilder: (sc) => Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: !isDark ? AppColors.darkMedium : AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              width: 200,
              child: Column(
                children: [
                  Container(
                    height: 4,
                    width: 45,
                    margin: EdgeInsets.only(top: 8),
                    color: isDark ? AppColors.black : AppColors.white,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        "Quantity",
                        fontSize: 18,
                        padding: EdgeInsets.only(top: 25, left: 20),
                        fontColor: isDark ? AppColors.black : AppColors.white,
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 0,
                            color: AppColors.transparent,
                          ),
                        ),
                        child: TextWidget(
                          "-",
                          fontSize: 20,
                          padding: EdgeInsets.zero,
                          fontColor: AppColors.white,
                        ),
                      ),
                      TextWidget(
                        "1",
                        fontSize: 15,
                        padding: EdgeInsets.zero,
                        fontColor: isDark ? AppColors.black : AppColors.white,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 0,
                            color: AppColors.transparent,
                          ),
                        ),
                        child: TextWidget(
                          "+",
                          fontSize: 20,
                          padding: EdgeInsets.zero,
                          fontColor: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
