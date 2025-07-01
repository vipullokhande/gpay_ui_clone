import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scratcher/scratcher.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// ignore: must_be_immutable
class InstantRewardScreen extends StatefulWidget {
  String text;
  String title;
  String subtitle;
  VoidCallback onTap;
  bool? isNeedToScratch;
  InstantRewardScreen({
    super.key,
    required this.text,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isNeedToScratch = false,
  });

  @override
  State<InstantRewardScreen> createState() => _InstantRewardScreenState();
}

class _InstantRewardScreenState extends State<InstantRewardScreen> {
  bool isScratchDone = false;
  @override
  void initState() {
    super.initState();
    if (widget.isNeedToScratch != null) {
      if (widget.isNeedToScratch == false) {
        setState(() {
          isScratchDone = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;

    final size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (_, resSize) {
        var resminHeight = resSize.deviceScreenType == DeviceScreenType.mobile
            ? size.height * 0.4
            : size.height * 0.3;
        var resmaxHeight = resSize.deviceScreenType == DeviceScreenType.mobile
            ? size.height * 0.58
            : size.height * 0.5;
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(220, 12, 12, 12),
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
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
              color: const Color.fromARGB(220, 12, 12, 12),
              padding: const EdgeInsets.only(top: 100),
              height: MediaQuery.of(context).size.height * 0.4,
              child: InkWell(
                splashColor: const Color.fromARGB(255, 231, 151, 245),
                borderRadius: BorderRadius.circular(14),
                onTap: widget.onTap,
                child: Ink(
                  child:
                      (widget.isNeedToScratch ?? false) &&
                          isScratchDone == false
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Scratcher(
                            accuracy: ScratchAccuracy.high,
                            enabled: true,
                            onScratchEnd: () => setState(() {
                              isScratchDone = true;
                            }),
                            image: Image.asset(
                              "assets/scratch.png",
                              fit: BoxFit.cover,
                              height: 0,
                              width: 0,
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                              height: 230,
                              width: 230,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(200, 255, 255, 255),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                image: const DecorationImage(
                                  image: AssetImage('assets/rewards_back.png'),
                                  fit: BoxFit.cover,
                                  opacity: 0.2,
                                ),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.title,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        widget.subtitle,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 70,
                                    child: TextButton.icon(
                                      icon: const Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          70,
                                          70,
                                          70,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                        ),
                                        fixedSize: const Size(170, 45),
                                      ),
                                      onPressed: () {},
                                      label: const Text(
                                        'WM0E5Z',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: ClipOval(
                                      child: Image.asset(
                                        widget.text,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                          height: 230,
                          width: 230,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(200, 255, 255, 255),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(width: 1, color: Colors.black),
                            image: const DecorationImage(
                              image: AssetImage('assets/rewards_back.png'),
                              fit: BoxFit.cover,
                              opacity: 0.2,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    widget.subtitle,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 70,
                                child: TextButton.icon(
                                  icon: const Icon(
                                    Icons.copy,
                                    color: Colors.white,
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      70,
                                      70,
                                      70,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    fixedSize: const Size(170, 45),
                                  ),
                                  onPressed: () {},
                                  label: const Text(
                                    'WM0E5Z',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                child: ClipOval(
                                  child: Image.asset(
                                    widget.text,
                                    width: 50,
                                    height: 50,
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
            color: isDark
                ? const Color.fromARGB(255, 23, 23, 23)
                : Colors.white,
            parallaxEnabled: true,
            parallaxOffset: 0.70,
            panelBuilder: (controller) {
              return Container(
                margin: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: isScratchDone == false
                      ? []
                      : [
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 10,
                            ),
                            leading: ClipOval(child: Image.asset(widget.text)),
                            title: TextWidget(
                              widget.title,
                              fontColor: isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            child: Text(
                              widget.subtitle,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: isDark ? Colors.white : Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
