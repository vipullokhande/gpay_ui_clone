import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class InstantOfferScreen extends StatefulWidget {
  String text;
  String title;
  String subtitle;
  VoidCallback onTap;
  InstantOfferScreen({
    Key? key,
    required this.text,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  State<InstantOfferScreen> createState() => _InstantOfferScreenState();
}

class _InstantOfferScreenState extends State<InstantOfferScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    var size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (_, resSize) {
        var resmaxHeight = resSize.deviceScreenType == DeviceScreenType.mobile
            ? size.height * 0.80
            : size.height * 0.60;
        var resminHeight = resSize.deviceScreenType == DeviceScreenType.mobile
            ? size.height * 0.50
            : size.height * 0.30;
        return Scaffold(
          appBar: AppBar(
            foregroundColor: getForegroundColor(context),
            backgroundColor: isDark
                ? const Color.fromARGB(220, 50, 50, 50)
                : const Color.fromARGB(200, 150, 206, 252),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_rounded),
              ),
            ],
          ),
          body: SlidingUpPanel(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              color: isDark
                  ? const Color.fromARGB(220, 50, 50, 50)
                  : const Color.fromARGB(200, 150, 206, 252),
              padding: const EdgeInsets.only(top: 70),
              height: MediaQuery.of(context).size.height * 0.4,
              child: InkWell(
                splashColor: const Color.fromARGB(255, 231, 151, 245),
                borderRadius: BorderRadius.circular(14),
                onTap: widget.onTap,
                child: Ink(
                  child: Container(
                    // padding: const EdgeInsets.fromLTRB(
                    //   12,
                    //   10,
                    //   0,
                    //   0,
                    // ),
                    height: 230,
                    width: 230,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(200, 255, 255, 255),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(width: 1, color: Colors.pink),
                      image: const DecorationImage(
                        image: AssetImage('assets/rewards_back.png'),
                        fit: BoxFit.cover,
                        opacity: 0.2,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       title,
                        //       style: const TextStyle(
                        //         fontSize: 24,
                        //         fontWeight: FontWeight.w500,
                        //         overflow: TextOverflow.ellipsis,
                        //       ),
                        //     ),
                        //     Text(
                        //       subtitle,
                        //       style: const TextStyle(
                        //         fontSize: 18,
                        //         overflow: TextOverflow.ellipsis,
                        //         fontWeight: FontWeight.w400,
                        //       ),
                        //       maxLines: 3,
                        //     ),
                        //   ],
                        // ),
                        // Positioned(
                        //   bottom: 70,
                        //   child: TextButton.icon(
                        //     icon: const Icon(Icons.copy),
                        //     style: TextButton.styleFrom(
                        //       backgroundColor: Color.fromARGB(255, 70, 70, 70),
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(14),
                        //       ),
                        //       fixedSize: const Size(170, 45),
                        //     ),
                        //     onPressed: () {},
                        //     label: const Text(
                        //       'WM0E5Z',
                        //       style: TextStyle(
                        //         fontSize: 18,
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.w800,
                        //         overflow: TextOverflow.ellipsis,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   bottom: 10,
                        //   child: ClipOval(
                        //     child: Image.asset(
                        //       text,
                        //       width: 50,
                        //       height: 50,
                        //     ),
                        //   ),
                        // ),
                        Container(
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            image: const DecorationImage(
                              image: AssetImage('assets/scratch.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            maxHeight: resmaxHeight,
            minHeight: resminHeight,
            parallaxEnabled: true,
            parallaxOffset: 0.28,
            color: isDark
                ? const Color.fromARGB(255, 45, 41, 41)
                : AppColors.white,
            panelBuilder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    leading: Image.asset(widget.text),
                    title: TextWidget(
                      widget.title,
                      fontWeight: FontWeight.w500,
                      fontColor: getForegroundColor(context),
                    ),
                  ),
                  TextWidget(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    widget.subtitle,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontColor: getForegroundColor(context),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
