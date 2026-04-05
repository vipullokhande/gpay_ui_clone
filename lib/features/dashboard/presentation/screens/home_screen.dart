import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/horizontal_space.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';
import 'package:gpay_ui_clone_clone/features/dashboard/data/models/businesses_model.dart';
import 'package:gpay_ui_clone_clone/features/profile/data/models/person_model.dart';
import 'package:gpay_ui_clone_clone/features/billings/presentation/screens/bills_screen.dart';
import 'package:gpay_ui_clone_clone/features/billings/presentation/screens/mobile_recharge_screen.dart';
import 'package:gpay_ui_clone_clone/features/rewards/presentation/screens/offers_screen.dart';
import 'package:gpay_ui_clone_clone/features/profile/presentation/screens/profile_screen.dart';
import 'package:gpay_ui_clone_clone/features/rewards/presentation/screens/refferels_screen.dart';
import 'package:gpay_ui_clone_clone/features/rewards/presentation/screens/rewards_screen.dart';
import 'package:gpay_ui_clone_clone/features/transaction/presentation/screens/transaction_history_screen.dart';
import 'package:gpay_ui_clone_clone/widgets/chip.dart';
import 'package:gpay_ui_clone_clone/widgets/drop_widget.dart';
import 'package:gpay_ui_clone_clone/features/dashboard/presentation/widgets/footer_widget.dart';
import 'package:gpay_ui_clone_clone/widgets/grid_widget.dart';
import 'package:gpay_ui_clone_clone/widgets/mid.dart';
import 'package:gpay_ui_clone_clone/widgets/people_widget.dart';
import 'package:gpay_ui_clone_clone/widgets/single_business.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
// class SearchSinglee {
//   final String name;
//   final String asset;

//   SearchSinglee({
//     required this.name,
//     required this.asset,
//   });
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String assets = 'assets/vip.png';
  ExpansibleController _expansibleController = ExpansibleController();
  bool panel = true;
  final scrollController = ScrollController();
  String getInitials(String fullName) {
    List<String> names = fullName.split(" ");
    String initials = '';
    for (var i = 0; i < names.length; i++) {
      initials += names[i][0];
    }
    return initials;
  }

  List<Person> searchPersonList = [];
  List<BusinessesModel> searchBusinessList = [];
  // List<SearchSinglee> searchList = [];
  search(String query) {
    final businesssuggestions = businesses.where((b) {
      final bname = b.businessName.toLowerCase();
      // ignore: iterable_contains_unrelated_type
      return bname.contains(query.toLowerCase());
    }).toList();
    final personsuggestions = person.where((p) {
      final pname = p.name.toLowerCase();
      // ignore: iterable_contains_unrelated_type
      return pname.contains(query.toLowerCase());
    }).toList();
    // for (var i = 0; i < personsuggestions.length; i++) {
    //   searchList.add(SearchSinglee(
    //       name: personsuggestions[i].name,
    //       asset: personsuggestions[i].bg.toString()));
    // }
    // for (var i = 0; i < businesssuggestions.length; i++) {
    //   searchList.add(SearchSinglee(
    //       name: businesssuggestions[i].businessName,
    //       asset: businesssuggestions[i].businessAsset));
    // }
    setState(() {
      searchBusinessList = businesssuggestions;
      searchPersonList = personsuggestions;
      //searchList = searchList;
    });
  }

  List<Person> person = [
    Person(name: 'Akshay Kumar', bg: Colors.blue),
    Person(name: 'Katrina Kaif', bg: Colors.red),
    Person(name: 'Bill Gates', bg: Colors.orange),
    Person(name: 'Elon Musk', bg: Colors.yellowAccent.shade700),
    Person(name: 'Jeff Bezos', bg: Colors.greenAccent.shade700),
    Person(name: 'Warren Buffet', bg: Colors.cyan),
    Person(name: 'Tim Cook', bg: Colors.purple),
    Person(name: 'Mark Zuckerburg', bg: Colors.blueGrey),
    Person(name: 'Jack Maa', bg: Colors.redAccent),
  ];

  List<BusinessesModel> businesses = [
    BusinessesModel(
      businessName: 'Mahavitran',
      businessAsset: 'assets/maha.png',
    ),
    BusinessesModel(
      businessName: 'Jio Prepaid',
      businessAsset: 'assets/jio.png',
    ),
    BusinessesModel(businessName: 'Redbus', businessAsset: 'assets/redbus.png'),
    BusinessesModel(businessName: 'Money view', businessAsset: 'assets/mv.png'),
    BusinessesModel(
      businessName: 'Nearby store',
      businessAsset:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFmL8yI75EyfanQr0X7OONurtiEUjG9dHZFA&usqp=CAU',
    ),
    BusinessesModel(
      businessName: 'CASHe',
      businessAsset:
          'https://play-lh.googleusercontent.com/mlu3_G6TXUBcJCMeOpYu5RJaZIEOjZkykAhE0I8YcZBBsJ717ni02wy0dP4Ssh7gih5K',
    ),
    BusinessesModel(businessName: '5paisa', businessAsset: 'assets/5paisa.png'),
    BusinessesModel(
      businessName: 'Nearby store',
      businessAsset:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQrF0tUNLkb0tnsVJFHO4ezf2ZByHMWJ-_5Q&usqp=CAU',
    ),
    BusinessesModel(
      businessName: 'CASHe',
      businessAsset:
          'https://play-lh.googleusercontent.com/mlu3_G6TXUBcJCMeOpYu5RJaZIEOjZkykAhE0I8YcZBBsJ717ni02wy0dP4Ssh7gih5K',
    ),
    BusinessesModel(businessName: '5paisa', businessAsset: 'assets/5paisa.png'),
  ];
  // List<String> logos = [
  //   'assets/maha.png',
  //   'assets/jio.png',
  //   'assets/redbus.png',
  //   'assets/mv.png',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFmL8yI75EyfanQr0X7OONurtiEUjG9dHZFA&usqp=CAU',
  //   'https://play-lh.googleusercontent.com/mlu3_G6TXUBcJCMeOpYu5RJaZIEOjZkykAhE0I8YcZBBsJ717ni02wy0dP4Ssh7gih5K',
  //   'assets/5paisa.png',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQrF0tUNLkb0tnsVJFHO4ezf2ZByHMWJ-_5Q&usqp=CAU',
  //   'https://play-lh.googleusercontent.com/mlu3_G6TXUBcJCMeOpYu5RJaZIEOjZkykAhE0I8YcZBBsJ717ni02wy0dP4Ssh7gih5K',
  //   'assets/5paisa.png'
  // ];
  // List<String> names = [
  //   'Mahavitran',
  //   'Jio Prepaid',
  //   'Redbus',
  //   'Money view',
  //   'Nearby store',
  //   'CASHe',
  //   '5paisa',
  //   'Nearby store',
  //   'CASHe',
  //   '5paisa'
  // ];
  var searchController = TextEditingController();
  clearAll() {
    setState(() {
      searchPersonList.clear();
      searchBusinessList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    final size = MediaQuery.of(context).size;
    String upiID = 'xnmae1@okhdfcbank';
    Color expTileColor = getForegroundColor(context);
    return Scaffold(
      backgroundColor: isDark
          ? const Color.fromARGB(255, 24, 24, 24)
          : AppColors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor:
      //       isDark ? const Color.fromARGB(255, 24, 24, 24) : Colors.white,
      //   // toolbarHeight: size.height * 0.07,
      //   title: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: SizedBox(
      //       height: 50,
      //       child: TextFormField(
      //         controller: searchController,
      //         textAlign: TextAlign.justify,
      //         style: TextStyle(
      //           color: isDark ? Colors.white : Colors.black,
      //         ),
      //         onChanged: search,
      //         decoration: InputDecoration(
      //           fillColor: isDark
      //               ? const Color.fromARGB(255, 69, 69, 69)
      //               : Colors.white,
      //           filled: true,
      //           hintText: 'Pay friends and merchants',
      //           hintStyle: TextStyle(
      //             color: isDark ? Colors.white : Colors.black,
      //           ),
      //           prefixIcon: IconButton(
      //             onPressed: () {
      //               if (searchPersonList.isNotEmpty ||
      //                   searchBusinessList.isNotEmpty) {
      //                 if (searchController.text.isEmpty) {
      //                   if (FocusScope.of(context).hasFocus) {
      //                     FocusScope.of(context).unfocus();
      //                   }
      //                   setState(() {
      //                     searchController.text = '';
      //                     searchPersonList.clear();
      //                     searchBusinessList.clear();
      //                   });
      //                 } else {
      //                   if (FocusScope.of(context).hasFocus) {
      //                     FocusScope.of(context).unfocus();
      //                   }
      //                   setState(() {
      //                     searchController.text = '';
      //                     searchPersonList.clear();
      //                     searchBusinessList.clear();
      //                   });
      //                 }
      //               } else {
      //                 Navigator.of(context).pop();
      //               }
      //             },
      //             icon: Icon(
      //               searchPersonList.isEmpty
      //                   ? Icons.search
      //                   : Icons.arrow_back_ios_new_rounded,
      //               color: isDark ? Colors.white : Colors.black87,
      //             ),
      //           ),
      //           suffixIcon: searchController.text.isEmpty
      //               ? const SizedBox()
      //               : IconButton(
      //                   padding: EdgeInsets.zero,
      //                   onPressed: () {
      //                     setState(() {
      //                       searchPersonList.clear();
      //                       searchController.text = '';
      //                     });
      //                   },
      //                   icon: Icon(
      //                     Icons.clear,
      //                     color: isDark ? Colors.white : Colors.black,
      //                   ),
      //                 ),
      //           enabledBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(30),
      //             borderSide: BorderSide(
      //               width: 1,
      //               color: isDark ? Colors.white12 : Colors.grey,
      //             ),
      //           ),
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(30),
      //             borderSide: BorderSide(
      //               width: 1,
      //               color: isDark ? Colors.white : Colors.grey,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (context) => ProfileScreen(
      //               asset: assets,
      //             ),
      //           ),
      //         );
      //       },
      //       child: Padding(
      //         padding: const EdgeInsets.only(right: 25, left: 0),
      //         child: ClipOval(
      //           child: Image.asset(
      //             assets,
      //             fit: BoxFit.cover,
      //             height: 50,
      //             width: 50,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: ListView(
        children: [
          Container(
            height: searchPersonList.isNotEmpty || searchBusinessList.isNotEmpty
                ? size.height * 0.1
                : size.height * 0.28,
            width: size.width,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(bottom: 8),
            decoration:
                // searchPersonList.isNotEmpty || searchBusinessList.isNotEmpty
                //     ? BoxDecoration(
                //         gradient: LinearGradient(
                //           colors: isDark
                //               ? [
                //                   Colors.black12,
                //                   Colors.black12,
                //                 ]
                //               : [
                //                   Colors.white24,
                //                   Colors.white10,
                //                 ],
                //         ),
                //       )
                //     :
                BoxDecoration(
                  color: isDark ? AppColors.black : Colors.white38,
                  image: const DecorationImage(
                    opacity: 0.9,
                    image: AssetImage(
                      'assets/event.png',
                      // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVOIYQrX9h0FA7v7Kl1F-7UujQcl-ZElDoNg&usqp=CAU",
                    ),
                    fit: BoxFit.cover,
                    isAntiAlias: true,
                  ),
                ),
            child: Stack(
              children: [
                searchPersonList.isNotEmpty || searchBusinessList.isNotEmpty
                    ? ColoredBox(
                        color: isDark
                            ? const Color.fromARGB(255, 24, 24, 24)
                            : AppColors.white,
                        child: SizedBox(
                          height: size.height * 0.1,
                          width: double.maxFinite,
                        ),
                      )
                    : const SizedBox(),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ).copyWith(left: 25),
                  titleAlignment: ListTileTitleAlignment.center,
                  title: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: searchController,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: getForegroundColor(context)),
                      onChanged: search,
                      decoration: InputDecoration(
                        fillColor: isDark
                            ? const Color.fromARGB(255, 69, 69, 69)
                            : AppColors.white,
                        filled: true,
                        hintText: 'Pay friends and merchants',
                        hintStyle: TextStyle(
                          color: isDark ? AppColors.white : AppColors.black,
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {
                            if (searchPersonList.isNotEmpty ||
                                searchBusinessList.isNotEmpty) {
                              clearAll();
                              searchController.text = '';
                              if (FocusScope.of(context).hasFocus) {
                                FocusScope.of(context).unfocus();
                              }
                            }
                            //  else {
                            //   Navigator.of(context).pop();
                            // }
                          },
                          icon: Icon(
                            searchPersonList.isEmpty
                                ? Icons.search
                                : Icons.arrow_back_ios_new_rounded,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                        suffixIcon:
                            // searchController.text.isEmpty
                            //     ? const SizedBox()
                            //     :
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (searchPersonList.isNotEmpty ||
                                    searchBusinessList.isNotEmpty ||
                                    searchController.text.isNotEmpty) {
                                  clearAll();
                                  setState(() {
                                    searchController.text = '';
                                  });
                                  if (FocusScope.of(context).hasFocus) {
                                    FocusScope.of(context).unfocus();
                                  }
                                } else {
                                  if (FocusScope.of(context).hasFocus) {
                                    FocusScope.of(context).unfocus();
                                  }
                                  return;
                                }
                              },
                              icon: searchController.text.isEmpty
                                  ? const SizedBox()
                                  : const Icon(Icons.clear),
                              color: getForegroundColor(context),
                            ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            width: 1,
                            color: isDark ? Colors.white12 : AppColors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            width: 1,
                            color: isDark ? AppColors.white : AppColors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            width: 1,
                            color: isDark ? AppColors.white : AppColors.grey,
                          ),
                        ),
                        // fillColor: isDark ? Colors.black : Colors.white,
                        // filled: true,
                        // hintText: 'Pay friends and merchants',
                        // hintStyle: TextStyle(
                        //   color: isDark ? Colors.white : Colors.black,
                        // ),
                        // prefixIcon: Icon(
                        //   Icons.search,
                        //   color: isDark ? Colors.white : Colors.black,
                        // ),
                        // suffixIcon: searchController.text.isEmpty
                        //     ? const SizedBox()
                        //     : IconButton(
                        //         onPressed: () {
                        //           if (searchController.text.isEmpty) {
                        //             return;
                        //           } else {
                        //             setState(() {
                        //               searchPersonList.clear();
                        //               searchController.text = '';
                        //             });
                        //           }
                        //         },
                        //         icon: Icon(
                        //           Icons.clear,
                        //           color: isDark ? Colors.white : Colors.black,
                        //         ),
                        //       ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(30),
                        //   borderSide: BorderSide(
                        //     width: 1,
                        //     color: isDark ? Colors.black : Colors.grey,
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(asset: assets),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        assets,
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          searchPersonList.isNotEmpty || searchBusinessList.isNotEmpty
              ?
                // Flexible(child: ListView.builder(itemBuilder: (context, index) {
                //     return SearchResultWidget(
                //         name: searchList[index].name, image: searchList[index].asset);
                //   }))
                Wrap(
                  children: [
                    for (int i = 0; i < searchPersonList.length; i++)
                      PeopleWidget(
                        name: searchPersonList[i].name,
                        getInitial: getInitials(searchPersonList[i].name),
                        color: searchPersonList[i].bg,
                      ),
                    for (int i = 0; i < searchBusinessList.length; i++)
                      SingleBusinessWidget(
                        businessesModel: searchBusinessList[i],
                        onTap: () {},
                        onLongPress: () {},
                      ),
                  ],
                )
              : Column(
                  // scrollDirection: Axis.vertical,
                  children: <Widget>[
                    // Stack(
                    //   children: [
                    //     Image.asset(
                    //       'assets/event.png',
                    //       fit: BoxFit.cover,
                    //       height: size.height * 0.22,
                    //       width: double.maxFinite,
                    //     ),
                    //     Container(
                    //       decoration: BoxDecoration(
                    //         gradient: LinearGradient(
                    //           colors: [
                    //             isDark
                    //                 ? const Color.fromARGB(150, 0, 0, 0)
                    //                 : const Color.fromARGB(150, 255, 255, 255),
                    //             isDark
                    //                 ? const Color.fromARGB(16, 0, 0, 0)
                    //                 : Colors.white10,
                    //           ],
                    //           begin: Alignment.topCenter,
                    //           end: Alignment.bottomCenter,
                    //         ),
                    //       ),
                    //       height: size.height * 0.22,
                    //       width: double.maxFinite,
                    //       child: const SizedBox.expand(),
                    //     ),
                    //   ],
                    // ),
                    Container(
                      height: size.height * 0.25,
                      padding: const EdgeInsets.only(top: 10),
                      width: size.width,
                      // clipBehavior: Clip.antiAlias,
                      // decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 1,
                      // ),
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(20),
                      //     topRight: Radius.circular(20),
                      //   ),
                      // ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: [
                          GridWidget(
                            icon: Icons.qr_code_scanner_rounded,
                            text: 'Scan any\n QR Code',
                            onTap: () {},
                          ),
                          GridWidget(
                            icon: Icons.perm_contact_calendar_sharp,
                            text: 'Pay\n Contacts',
                            onTap: () {},
                          ),
                          GridWidget(
                            icon: Icons.send_to_mobile_rounded,
                            text: 'Pay phone\n number',
                            onTap: () {},
                          ),
                          GridWidget(
                            icon: Icons.card_travel_rounded,
                            text: 'Bank\n transfer',
                            onTap: () {},
                          ),
                          GridWidget(
                            icon: Icons.settings_backup_restore_rounded,
                            text: 'Pay UPI ID\n or number',
                            onTap: () {},
                          ),
                          GridWidget(
                            icon: Icons.person,
                            text: 'Self\n transfer',
                            onTap: () {},
                          ),
                          GridWidget(
                            icon: Icons.electric_bolt_outlined,
                            text: 'Pay\n bills',
                            onTap: () {},
                          ),
                          GridWidget(
                            icon: Icons.mobile_friendly_sharp,
                            text: 'Mobile\n recharge',
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MobileRechargeScreen(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3,
                                horizontal: 10,
                              ),
                              backgroundColor: isDark
                                  ? const Color.fromARGB(255, 36, 36, 36)
                                  : const Color.fromARGB(255, 235, 235, 235),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide.none,
                              ),
                              // fixedSize: Size(size.width * 0.3, 30),
                            ),
                            onPressed: () {},
                            label: Icon(
                              Icons.add_circle_outline,
                              color: getForegroundColor(context),
                              size: 22,
                            ),
                            icon: TextWidget(
                              'Activate UPI Lite',
                              fontSize: 10,
                              fontColor: getForegroundColor(context),
                            ),
                          ),
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3,
                                horizontal: 10,
                              ),
                              backgroundColor: isDark
                                  ? const Color.fromARGB(255, 59, 59, 59)
                                  : AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: isDark
                                      ? Colors.white38
                                      : AppColors.grey,
                                ),
                              ),
                              // fixedSize: Size(size.width * 0.45, 30),
                            ),
                            onPressed: () {},
                            icon: Icon(
                              Icons.copy,
                              color: getForegroundColor(context),
                              size: 20,
                            ),
                            label: TextWidget(
                              'UPI ID : $upiID ',
                              fontColor: getForegroundColor(context),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextWidget(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14.0,
                          vertical: 9,
                        ),
                        'People',
                        fontColor: isDark
                            ? AppColors.white
                            : const Color.fromARGB(255, 44, 43, 43),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    person.isEmpty
                        ? ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 16,
                            ),
                            leading: Image.asset('assets/bg.png'),
                            title: TextWidget(
                              'People you\'ve recently paid will show up here ',
                              fontColor: isDark
                                  ? AppColors.white
                                  : Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : SizedBox(
                            child: Center(
                              child: Wrap(
                                children: [
                                  for (int i = 0; i < person.length; i++)
                                    GestureDetector(
                                      onLongPress: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              alignment: Alignment.center,
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    person.removeAt(i);
                                                    Navigator.of(context).pop();
                                                  });
                                                },
                                                child: TextWidget('remove'),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: PeopleWidget(
                                        name: person[i].name,
                                        getInitial: getInitials(person[i].name),
                                        color: person[i].bg,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          TextWidget(
                            'Businessess',
                            fontColor: isDark
                                ? AppColors.white
                                : AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          const Spacer(),
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                170,
                                213,
                                249,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {},
                            icon: Icon(
                              Icons.explore,
                              color: Colors.blue.shade900,
                            ),
                            label: TextWidget(
                              'Explore',
                              fontColor: const Color.fromARGB(255, 10, 2, 240),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.135,
                      width: size.width,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        itemCount: businesses.length,
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        itemBuilder: ((context, index) {
                          final image = businesses[index].businessAsset;
                          final name = businesses[index].businessName;
                          return SingleBusinessWidget(
                            businessesModel: BusinessesModel(
                              businessName: name,
                              businessAsset: image,
                            ),
                            onTap: () {},
                            onLongPress: () {},
                          );
                        }),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextWidget(
                          "Bills & Recharges",
                          fontSize: 20,
                          fontColor: isDark ? AppColors.white : Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 3,
                        ),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/jio.png',
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            HorizontalSpace(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    'Jio User',
                                    fontColor: getForegroundColor(context),
                                    fontSize: 20,
                                  ),
                                  TextWidget(
                                    'Validity expiring tomorrow',
                                    fontColor: isDark
                                        ? const Color.fromRGBO(233, 187, 185, 1)
                                        : Colors.red,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: isDark
                                    ? Colors.white10
                                    : Colors.grey.shade200,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(26),
                                  side: BorderSide(
                                    width: 1,
                                    color: getForegroundColor(context),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: TextWidget(
                                'Pay',
                                fontSize: 16,
                                fontColor: const Color.fromRGBO(
                                  112,
                                  158,
                                  239,
                                  1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size.height * 0.36,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: isDark
                            ? const Color.fromARGB(255, 48, 47, 47)
                            : const Color.fromARGB(255, 235, 234, 234),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VerticalSpace(8),
                          TextWidget(
                            'ALSO TRY ADDING',
                            fontColor: getForegroundColor(context),
                            fontWeight: FontWeight.bold,
                          ),
                          VerticalSpace(5),
                          Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              Mid(
                                icon: Icons.phone_android_rounded,
                                text: 'Postpaid mobile',
                              ),
                              Mid(
                                icon: Icons.wifi_password_rounded,
                                text: 'Broadband /\nLandline',
                              ),
                              Mid(
                                icon: Icons.gas_meter_outlined,
                                text: 'Piped gas',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    FilterChip(
                      onSelected: (value) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const BillsScreen(),
                          ),
                        );
                      },
                      backgroundColor: isDark
                          ? const Color.fromARGB(255, 48, 47, 47)
                          : Colors.blue.shade100,
                      label: TextWidget(
                        'see all',
                        fontColor: getForegroundColor(context),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(
                          width: 1,
                          color: Colors.blueAccent.shade200,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 17,
                        vertical: 9,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color.fromARGB(255, 48, 47, 47)
                            : const Color.fromARGB(255, 235, 234, 234),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ExpansionTile(
                        controller: _expansibleController,
                        collapsedBackgroundColor: isDark
                            ? const Color.fromARGB(255, 48, 47, 47)
                            : const Color.fromARGB(255, 235, 234, 234),
                        clipBehavior: Clip.antiAlias,
                        collapsedTextColor: expTileColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide.none,
                        ),
                        collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide.none,
                        ),
                        textColor: expTileColor,
                        collapsedIconColor: expTileColor,
                        // collapsedTextColor: isDark ? Colors.white : Colors.black,
                        // textColor: isDark ? Colors.white : Colors.black,
                        // collapsedIconColor: isDark ? Colors.white : Colors.black,
                        tilePadding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        childrenPadding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 5,
                        ),
                        // backgroundColor: isDark
                        //     ? const Color.fromARGB(255, 48, 47, 47)
                        //     : const Color.fromARGB(255, 235, 234, 234),
                        // collapsedBackgroundColor: isDark
                        //     ? const Color.fromARGB(255, 48, 47, 47)
                        //     : const Color.fromARGB(255, 235, 234, 234),
                        onExpansionChanged: (value) => setState(() {}),
                        enabled: false,
                        trailing: GestureDetector(
                          onTap: () {
                            if (_expansibleController.isExpanded) {
                              _expansibleController.collapse();
                            } else {
                              _expansibleController.expand();
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: Icon(
                              _expansibleController.isExpanded
                                  ? Icons.keyboard_control_key_sharp
                                  : Icons.keyboard_arrow_down_rounded,
                              color: Colors.grey,
                              size: 40,
                            ),
                          ),
                        ),
                        title: Row(
                          children: [
                            DropWidget(image: 'assets/jio.png', text: 'Jio'),
                            DropWidget(
                              image: 'assets/redbus.png',
                              text: 'Redbus',
                            ),
                            DropWidget(
                              image: 'assets/5paisa.png',
                              text: '5Paisa',
                            ),
                          ],
                        ),
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.14,
                                child: Row(
                                  children: [
                                    DropWidget(
                                      image: 'assets/maha.png',
                                      text: 'Mahavitran',
                                    ),
                                    DropWidget(
                                      image: 'assets/mv.png',
                                      text: 'Movie view',
                                    ),
                                    DropWidget(
                                      image: 'assets/5paisa.png',
                                      text: '5Paisa',
                                    ),
                                    DropWidget(
                                      image: 'assets/jio.png',
                                      text: 'Jio',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.14,
                                child: Row(
                                  children: [
                                    DropWidget(
                                      image: 'assets/redbus.png',
                                      text: 'Redbus',
                                    ),
                                    DropWidget(
                                      image: 'assets/5paisa.png',
                                      text: '5Paisa',
                                    ),
                                    DropWidget(
                                      image: 'assets/jio.png',
                                      text: 'Jio',
                                    ),
                                    DropWidget(
                                      image: 'assets/redbus.png',
                                      text: 'Redbus',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 5,
                            ),
                            'Offers & rewards',
                            fontColor: isDark
                                ? AppColors.white
                                : AppColors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                            ).copyWith(top: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DropWidget(
                                  image: 'assets/rewards.png',
                                  text: 'Rewards',
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const RewardsScreen(),
                                      ),
                                    );
                                  },
                                ),
                                DropWidget(
                                  image: 'assets/offers.png',
                                  text: 'Offers',
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const OffersScreen(),
                                      ),
                                    );
                                  },
                                ),
                                DropWidget(
                                  image: 'assets/invite.png',
                                  text: 'Invite Friends',
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const ReferrelsScreen(),
                                      ),
                                    );
                                  },
                                ),
                                DropWidget(
                                  image: 'assets/ihome.png',
                                  text: 'Indi-home',
                                ),
                              ],
                            ),
                          ),
                          TextWidget(
                            'Manage your money',
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 8,
                            ),
                            fontColor: isDark ? Colors.white : Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                          Wrap(
                            children: [
                              GChip(
                                text: 'Loans',
                                icon: Icons.local_activity,
                                onTap: () {},
                              ),
                              const SizedBox(width: 10),
                              GChip(
                                text: 'Gold',
                                icon: Icons.flourescent_rounded,
                                onTap: () {},
                              ),
                            ],
                          ),
                          FooterWidget(
                            icon: Icons.credit_card_rounded,
                            title: 'Get a credit card',
                            onTap: () {},
                            issubtitle: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.all(
                                  3,
                                ).copyWith(left: 10, right: 10, top: 0),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(28, 160, 68, 0.6),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: TextWidget(
                                  '₹0 joining fee',
                                  // color: Color.fromRGBO(28, 160, 68, 1),
                                  fontColor: const Color.fromRGBO(
                                    252,
                                    252,
                                    252,
                                    1,
                                  ),
                                ),
                              ),
                            ),
                            istrailing: TextButton(
                              onPressed: () {},
                              child: TextWidget(
                                'Apply now',
                                fontColor: const Color.fromRGBO(
                                  161,
                                  187,
                                  230,
                                  1,
                                ),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          FooterWidget(
                            icon: Icons.speed,
                            title: 'Check your CIBIL score for \nfree',
                            onTap: () {},
                          ),
                          FooterWidget(
                            icon: Icons.access_time_rounded,
                            title: 'Show transaction history',
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TransactionHistoryScreen(),
                              ),
                            ),
                          ),
                          FooterWidget(
                            icon: Icons.house_siding_rounded,
                            title: 'Check bank balance',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 170,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/backbottom.png'),
                          fit: BoxFit.cover,
                          opacity: 0.55,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextWidget(
                            'Invite your friends to Google Pay',
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            fontColor: isDark ? Colors.white : Colors.black,
                          ),
                          TextWidget(
                            'invite your friends to Google Pay and get ₹101 when your friends their first payment. Thet get ₹21!',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontColor: isDark ? Colors.white : Colors.black,
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 5,
                            ),
                            leading: TextWidget(
                              'Copy your code',
                              fontColor: isDark ? Colors.white : Colors.black,
                            ),
                            title: TextWidget(
                              'ac8bx3e',
                              fontWeight: FontWeight.bold,
                              fontColor: isDark ? Colors.white : Colors.black,
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.copy,
                                color: isDark ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
