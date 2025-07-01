import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:gpay_ui_clone_clone/features/settings/presentation/screens/settings_screen.dart';
import 'package:gpay_ui_clone_clone/widgets/payment_options_widget.dart';
import 'package:gpay_ui_clone_clone/features/profile/presentation/widgets/profile_bottom_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  String asset;

  ProfileScreen({Key? key, required this.asset}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String rewcount = '14';
  String accounts = '1';
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    var size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        var heightt = sizeInfo.deviceScreenType == DeviceScreenType.mobile
            ? size.height * 0.245
            : size.height * 0.33;
        var botPadding = sizeInfo.deviceScreenType == DeviceScreenType.mobile
            ? EdgeInsets.only(bottom: size.height * 0.03)
            : const EdgeInsets.only(bottom: 0);
        var topHeight = sizeInfo.deviceScreenType == DeviceScreenType.mobile
            ? size.height * 0.295
            : size.height * 0.3;
        var resMargin = sizeInfo.deviceScreenType == DeviceScreenType.mobile
            ? const EdgeInsets.symmetric(
                horizontal: 16,
              ).copyWith(top: MediaQuery.of(context).size.height * 0.27)
            : const EdgeInsets.symmetric(
                horizontal: 16,
              ).copyWith(top: MediaQuery.of(context).size.height * 0.29);
        // var resAlign = sizeInfo.deviceScreenType == DeviceScreenType.mobile
        //     ? MainAxisAlignment.spaceEvenly
        //     : MainAxisAlignment.spaceEvenly;
        return Scaffold(
          backgroundColor: isDark
              ? const Color.fromARGB(255, 24, 24, 24)
              : Colors.white,
          appBar: AppBar(
            foregroundColor: isDark ? Colors.white : Colors.black,
            backgroundColor: isDark
                ? const Color.fromARGB(210, 30, 30, 30)
                : Colors.white,
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
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.53,
                  child: Stack(
                    children: [
                      Container(
                        height: topHeight,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isDark
                                ? const [
                                    Color.fromARGB(210, 30, 30, 30),
                                    Color.fromARGB(249, 67, 67, 67),
                                  ]
                                : const [
                                    Colors.white,
                                    Color.fromARGB(255, 211, 227, 248),
                                    Color.fromARGB(255, 180, 206, 241),
                                  ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          // image: DecorationImage(
                          //   image: AssetImage('assets/gpayprofileback.png'),
                          //   fit: BoxFit.cover,
                          //   opacity: 0.25,
                          // ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Vipul Lokhande',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'vipullokhande1@okhdfcbank',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: isDark
                                            ? const Color.fromARGB(
                                                255,
                                                238,
                                                234,
                                                234,
                                              )
                                            : const Color.fromARGB(
                                                255,
                                                44,
                                                44,
                                                44,
                                              ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          '7744959632',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: isDark
                                                ? const Color.fromARGB(
                                                    255,
                                                    238,
                                                    234,
                                                    234,
                                                  )
                                                : const Color.fromARGB(
                                                    255,
                                                    44,
                                                    44,
                                                    44,
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        TextButton.icon(
                                          style: TextButton.styleFrom(
                                            fixedSize: Size(
                                              size.width * 0.34,
                                              40,
                                            ),
                                            backgroundColor: isDark
                                                ? Colors.blue.shade200
                                                : Colors.blue.shade800,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                          ),
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.check_circle,
                                            color: isDark
                                                ? Colors.black
                                                : Colors.white,
                                            size: 26,
                                          ),
                                          label: Text(
                                            'UPI Number',
                                            style: TextStyle(
                                              color: isDark
                                                  ? Colors.black87
                                                  : const Color.fromARGB(
                                                      255,
                                                      253,
                                                      253,
                                                      253,
                                                    ),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Stack(
                                  children: [
                                    ClipOval(
                                      child: Image.asset(
                                        widget.asset,
                                        fit: BoxFit.cover,
                                        width: 90,
                                        height: 90,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 1,
                                      right: 1,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            26,
                                          ),
                                        ),
                                        child: IconButton(
                                          color: Colors.black,
                                          splashColor: Colors.purple,
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.qr_code_scanner_rounded,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ListTile(
                              leading: ClipOval(
                                child: Image.asset(
                                  'assets/rewards.png',
                                  fit: BoxFit.cover,
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                              title: Text(
                                '₹$rewcount Rewards earned',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        clipBehavior: Clip.antiAlias,
                        color: isDark
                            ? const Color.fromARGB(255, 39, 39, 39)
                            : Colors.white,
                        margin: resMargin,
                        child: SizedBox(
                          height: heightt,
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 3,
                                ),
                                leading: Text(
                                  'Set up payment methods 1/3',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.blue,
                                ),
                                onTap: () {},
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PaymentOptionsWidget(
                                    title: 'Bank Account',
                                    subtitle: '$accounts account',
                                    isIcon: false,
                                    icon: Icons.blinds_closed_rounded,
                                  ),
                                  const PaymentOptionsWidget(
                                    title: 'Rupay Credit  \n Card',
                                    subtitle: 'Pay with UPI',
                                    isIcon: true,
                                    icon: Icons.credit_card_rounded,
                                  ),
                                  const PaymentOptionsWidget(
                                    title: '  UPI Lite  ',
                                    subtitle: 'Pay PIN-free',
                                    isIcon: true,
                                    icon: Icons.arrow_forward_ios_sharp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: botPadding,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileBottomWidget(
                        leading: Icons.credit_card,
                        trailingText: "Add",
                        title: "Pay with credit or debit cards",
                        subtitle: "Bills, online shopping, and more",
                      ),
                      buildBottom(
                        'Your QR code',
                        Icons.qr_code,
                        isDark,
                        () {},
                        true,
                        'Use to receive money from any UPI app',
                      ),
                      ProfileBottomWidget(
                        leading: Icons.card_giftcard_rounded,
                        trailingText: "Share",
                        title: "Invite friends ,get rewards",
                        subtitle: "share your code ac8bx3e",
                      ),
                      ProfileBottomWidget(
                        leading: Icons.credit_card_rounded,
                        trailingText: "Add",
                        title: "Pay businesses",
                        subtitle: "Debit/credit card",
                      ),
                      buildBottom(
                        'Settings',
                        Icons.settings,
                        isDark,
                        () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SettingsScreen(),
                            ),
                          );
                        },
                        false,
                        '',
                      ),
                      buildBottom(
                        'Manage Google account',
                        Icons.person_pin,
                        isDark,
                        () {},
                        false,
                        '',
                      ),
                      buildBottom(
                        'Get Help',
                        Icons.help_outline_outlined,
                        isDark,
                        () {},
                        false,
                        '',
                      ),
                      buildBottom(
                        'Language',
                        Icons.language_rounded,
                        isDark,
                        () {},
                        true,
                        selectedLanguage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildBottom(
    String title,
    IconData icon,
    bool isDark,
    VoidCallback onTap,
    bool isSub,
    String subText,
  ) => GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: 55,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.blue, size: 29),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                isSub
                    ? Text(
                        subText,
                        style: TextStyle(
                          fontSize: 14,
                          color: isDark
                              ? const Color.fromARGB(255, 207, 207, 207)
                              : Colors.black87,
                        ),
                      )
                    : const Center(),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
