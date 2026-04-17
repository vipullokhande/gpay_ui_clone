import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/nav_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/clear_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';
import 'package:gpay_ui_clone_clone/features/billings/data/models/transaction_model.dart';
import 'package:gpay_ui_clone_clone/widgets/payment_type_widget.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/payment_method_widget.dart';
import '../../../../widgets/status_widget.dart';

// ignore: must_be_immutable
class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  bool latestFirst = true;
  convertDataToMonthWise() {
    yearMonthWise.clear();
    transactions.sort(
      (a, b) => latestFirst
          ? b.transactionDate.compareTo(a.transactionDate)
          : a.transactionDate.compareTo(b.transactionDate),
    );
    for (var txn in transactions) {
      int year = txn.transactionDate.year;
      String month = getMonthName(txn.transactionDate.month);
      yearMonthWise.putIfAbsent(year, () => {});
      yearMonthWise[year]!.putIfAbsent(month, () => []);
      yearMonthWise[year]![month]!.add(txn);
    }
  }

  List monthsCheckIndexes = [];
  List<TransactionModel> filteredtransactions = [];
  bool filter = false;
  List<bool> statusClicked = [false, false, false];
  List<TransactionModel> transactions = [
    TransactionModel(
      senderName: "User X",
      receiverName: "Jio Prepaid",
      receiverImage: "assets/jio.png",
      status: "Added",
      statusActionSymbol: "+",
      amount: 20,
      transactionDate: DateTime(2023, 02, 01, 12, 01, 20),
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Mohan Sweets",
      receiverImage: "assets/redbus.png",
      status: "Failed",
      statusActionSymbol: "!",
      amount: 10,
      transactionDate: DateTime(2023, 02, 02, 12, 02, 20),
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Omkar Snacks",
      receiverImage: "assets/mv.png",
      status: "Completed",
      statusActionSymbol: "",
      amount: 70,
      transactionDate: DateTime(2023, 02, 03, 13, 01, 20),
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "5 Paisa",
      receiverImage: "assets/5paisa.png",
      status: "Added",
      statusActionSymbol: "+",
      amount: 80,
      transactionDate: DateTime(2023, 03, 01, 14, 01, 20),
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Mohan Sweets",
      receiverImage: "assets/maha.png",
      status: "Failed",
      statusActionSymbol: "!",
      amount: 40,
      transactionDate: DateTime(2023, 03, 03, 15, 01, 20),
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Omkar Snacks",
      receiverImage: "assets/mv.png",
      status: "Completed",
      statusActionSymbol: "",
      amount: 120,
      transactionDate: DateTime(2023, 03, 05, 10, 01, 20),
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "5 Paisa",
      receiverImage: "assets/5paisa.png",
      status: "Added",
      statusActionSymbol: "+",
      amount: 80,
      transactionDate: DateTime(2023, 04, 01, 12, 01, 20),
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Mohan Sweets",
      receiverImage: "assets/maha.png",
      status: "Failed",
      statusActionSymbol: "!",
      amount: 40,
      transactionDate: DateTime(2023, 04, 03, 12, 21, 20),
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Omkar Snacks",
      receiverImage: "assets/mv.png",
      status: "Completed",
      statusActionSymbol: "",
      amount: 120,
      transactionDate: DateTime(2023, 05, 04, 12, 01, 20),
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Jio Prepaid",
      receiverImage: "assets/jio.png",
      status: "Added",
      statusActionSymbol: "+",
      amount: 20,
      transactionDate: DateTime(2023, 06, 01, 12, 01, 20),
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Mohan Sweets",
      receiverImage: "assets/redbus.png",
      status: "Failed",
      statusActionSymbol: "!",
      amount: 10,
      transactionDate: DateTime(2023, 06, 10, 12, 19, 20),
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Omkar Snacks",
      receiverImage: "assets/mv.png",
      status: "Failed",
      statusActionSymbol: "!",
      amount: 70,
      transactionDate: DateTime(2023, 07, 1, 12, 01, 20),
    ),
  ];
  getMonthName(int idx) => monthNames[idx - 1];

  bool isSearch = false;
  ScrollController allFilterScrollController = ScrollController();
  List<String> searchResTitles = [];
  List<String> searchResAssets = [];
  List<String> searchResSubtitles = [];
  List<String> searchResAmounts = [];
  List<Color> statusColors = [Colors.green, Colors.red, Colors.yellow];
  List<String> transactionHistoryChipTitles = [
    "Status",
    "Payment method",
    "Date",
    "Amount",
    "Payment Type",
  ];
  List<String> amounta = [
    "Up to ₹200",
    "₹200 to ₹500",
    "₹500 to ₹2000",
    "Above ₹2000",
  ];
  List<String> datesFilter = ["This month", "Last 30 days", "Last 90 days"];
  List<bool> transactionHistoryChipTitlesSelected = [];
  Map<int, Map<String, List<TransactionModel>>> yearMonthWise = {};
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    convertDataToMonthWise();
  }

  void transactionHistoryChipTitlesSelectedM() {
    for (var i = 0; i < transactionHistoryChipTitles.length; i++) {
      transactionHistoryChipTitlesSelected.add(false);
    }
  }

  double getMonthlyNetTotal(int year, String month) {
    if ((!yearMonthWise.containsKey(year)) ||
        (!yearMonthWise[year]!.containsKey(month))) {
      return 0;
    }

    double total = 0;

    for (var txn in yearMonthWise[year]![month]!) {
      if (txn.status == "Added") {
        total += txn.amount;
      } else if (txn.status == "Completed") {
        total -= txn.amount;
      }
    }

    return total;
  }

  onChipTapped(String title) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: title == 'Payment Type'
              ? [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: Row(
                      children: [
                        TextWidget(title, fontSize: 20),
                        const Spacer(),
                        const Icon(Icons.close),
                      ],
                    ),
                  ),
                  Wrap(
                    children: [
                      PaymentTypeWidget(
                        icon: Icons.credit_card,
                        title: "Cashback",
                      ),
                      PaymentTypeWidget(
                        icon: Icons.credit_card,
                        title: "Money Received",
                      ),
                      PaymentTypeWidget(
                        icon: Icons.person_2_outlined,
                        title: "Self transfer",
                      ),
                    ],
                  ),
                  ClearWidget(onTap1: () {}, onTap2: () {}),
                ]
              : title == 'Payment method'
              ? [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: Row(
                      children: [
                        TextWidget(title, fontSize: 20),
                        const Spacer(),
                        const Icon(Icons.close),
                      ],
                    ),
                  ),
                  Wrap(
                    children: [
                      PaymentMethodWidget(
                        title: 'Bank of Maharastra',
                        image: 'assets/bom.png',
                        onTap: () {},
                      ),
                      PaymentMethodWidget(
                        title: 'UPI Lite',
                        image: 'assets/upi.png',
                        onTap: () {},
                      ),
                    ],
                  ),
                  ClearWidget(onTap1: () {}, onTap2: () {}),
                ]
              : title == 'Amount'
              ? [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: Row(
                      children: [
                        TextWidget(title, fontSize: 20),
                        const Spacer(),
                        const Icon(Icons.close),
                      ],
                    ),
                  ),
                  ListView.builder(
                    controller: allFilterScrollController,
                    itemCount: amounta.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      title: TextWidget(amounta[index]),
                      trailing: Checkbox(value: false, onChanged: (v) {}),
                    ),
                  ),
                  VerticalSpace(20),
                  ClearWidget(onTap1: () {}, onTap2: () {}),
                ]
              : title == 'Date'
              ? [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: Row(
                      children: [
                        TextWidget(title, fontSize: 20),
                        const Spacer(),
                        const Icon(Icons.close),
                      ],
                    ),
                  ),
                  ListView.builder(
                    controller: allFilterScrollController,
                    itemCount: datesFilter.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      title: TextWidget(datesFilter[index]),
                      trailing: Checkbox(value: false, onChanged: (v) {}),
                    ),
                  ),
                  VerticalSpace(20),
                  ClearWidget(onTap1: () {}, onTap2: () {}),
                ]
              : [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: Row(
                      children: [
                        TextWidget(title, fontSize: 20),
                        const Spacer(),
                        const Icon(Icons.close),
                      ],
                    ),
                  ),
                  StatusWidget(
                    value: statusClicked[0],
                    icon: Icons.done,
                    title: 'Completed',
                    color: statusColors[0],
                    onTap: () => setState(() {
                      filteredtransactions.clear();
                      filteredtransactions = transactions
                          .where((txn) => txn.status == 'Completed')
                          .toList();
                      NavUtil.pop(context);
                    }),
                  ),
                  StatusWidget(
                    value: statusClicked[1],
                    icon: Icons.close,
                    title: 'Failed',
                    color: statusColors[1],
                    onTap: () => setState(() {
                      filteredtransactions.clear();
                      filteredtransactions = transactions
                          .where((txn) => txn.status == 'Failed')
                          .toList();
                      NavUtil.pop(context);
                    }),
                  ),
                  StatusWidget(
                    value: statusClicked[2],
                    icon: Icons.add,
                    title: 'Added',
                    color: statusColors[2],
                    onTap: () => setState(() {
                      filteredtransactions.clear();
                      filteredtransactions = transactions
                          .where((txn) => txn.status == 'Added')
                          .toList();
                      NavUtil.pop(context);
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: TextWidget("Clear Filter"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            223,
                            241,
                            255,
                          ),
                        ),
                        onPressed: () {},
                        child: TextWidget("Apply"),
                      ),
                    ],
                  ),
                ],
        ),
      ),
    );
    // transactionHistoryChipTitlesSelected[
    //         transactionHistoryChipTitles.indexOf(title)] =
    //     !transactionHistoryChipTitlesSelected[
    //         transactionHistoryChipTitles.indexOf(title)];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color.fromARGB(220, 12, 12, 12)
          : AppColors.white,
      body: Column(
        children: [
          VerticalSpace(MediaQuery.of(context).size.height * 0.035),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.94,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 5,
              ),
              title: TextFormField(
                controller: searchController,
                textAlign: TextAlign.start,
                style: TextStyle(color: getForegroundColor(context)),
                decoration: InputDecoration(
                  hintText: 'Search transactions',
                  hintStyle: TextStyle(color: getForegroundColor(context)),
                  prefixIcon: IconButton(
                    onPressed: () {
                      if (isSearch) {
                        if (FocusScope.of(context).hasFocus) {
                          setState(() {
                            isSearch = false;
                          });
                          FocusScope.of(context).unfocus();
                        }
                        searchResAssets.clear();
                        searchResSubtitles.clear();
                        searchResAmounts.clear();
                        searchResSubtitles.clear();
                        setState(() {
                          isSearch = false;
                        });
                      } else {
                        NavUtil.pop(context);
                      }
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: getForegroundColor(context),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1,
                      color: isDark ? AppColors.blue : AppColors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1,
                      color: isDark ? AppColors.blue : AppColors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (searchController.text.isNotEmpty) {
                        setState(() {
                          searchController.text = '';
                        });
                      }
                    },
                    icon: Icon(
                      searchController.text.isEmpty
                          ? Icons.more_vert_outlined
                          : Icons.close,
                      color: getForegroundColor(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // VerticalSpace(
          //   80,
          //   child: Row(
          //     children: [
          //       IconButton(
          //         onPressed: () => showModalBottomSheet(
          //           backgroundColor: Colors.white,
          //           context: context,
          //           builder: (context) => Container(
          //             color: Colors.white,
          //             child: SingleChildScrollView(
          //               controller: allFilterScrollController,
          //               child: Column(
          //                 children: [
          //                   Padding(
          //                     padding: const EdgeInsets.symmetric(
          //                       horizontal: 15,
          //                     ).copyWith(top: 20),
          //                     child: Row(
          //                       children: [
          //                         TextWidget('Filters', fontSize: 18),
          //                         const Spacer(),
          //                         IconButton(
          //                           onPressed: () => NavUtil.pop(context),
          //                           icon: const Icon(Icons.close),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       TextWidget(
          //                         padding: const EdgeInsets.only(
          //                           left: 15,
          //                           bottom: 20,
          //                           right: 15,
          //                           top: 15,
          //                         ),
          //                         'Status',
          //                         fontSize: 20,
          //                       ),
          //                       Wrap(
          //                         children: [
          //                           PaymentTypeWidget(
          //                             icon: Icons.credit_card,
          //                             title: "Cashback",
          //                           ),
          //                           PaymentTypeWidget(
          //                             icon: Icons.credit_card,
          //                             title: "Money Received",
          //                           ),
          //                           PaymentTypeWidget(
          //                             icon: Icons.person_2_outlined,
          //                             title: "Self transfer",
          //                           ),
          //                         ],
          //                       ),
          //                       TextWidget(
          //                         padding: const EdgeInsets.only(
          //                           left: 15,
          //                           bottom: 20,
          //                           top: 10,
          //                         ),
          //                         'Payment method',
          //                         fontSize: 20,
          //                       ),
          //                       Wrap(
          //                         children: [
          //                           PaymentMethodWidget(
          //                             title: 'Bank of Maharastra',
          //                             image: 'assets/bom.png',
          //                             onTap: () {},
          //                           ),
          //                           PaymentMethodWidget(
          //                             title: 'UPI Lite',
          //                             image: 'assets/upi.png',
          //                             onTap: () {},
          //                           ),
          //                         ],
          //                       ),
          //                       TextWidget(
          //                         padding: const EdgeInsets.only(
          //                           left: 15,
          //                           bottom: 20,
          //                           top: 15,
          //                         ),
          //                         'Amount',
          //                         fontSize: 20,
          //                       ),
          //                       ListView.builder(
          //                         controller: allFilterScrollController,
          //                         itemCount: amounta.length,
          //                         shrinkWrap: true,
          //                         itemBuilder: (context, index) => ListTile(
          //                           contentPadding: const EdgeInsets.symmetric(
          //                             horizontal: 10,
          //                           ),
          //                           title: TextWidget(amounta[index]),
          //                           trailing: Checkbox(
          //                             value: false,
          //                             onChanged: (v) {},
          //                           ),
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: const EdgeInsets.only(
          //                           right: 10,
          //                           bottom: 20,
          //                         ),
          //                         child: ClearWidget(
          //                           onTap1: () {},
          //                           onTap2: () {},
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //         icon: const Icon(Icons.filter_alt_outlined),
          //       ),
          //       Expanded(
          //         child: ListView.builder(
          //           itemCount: transactionHistoryChipTitles.length,
          //           shrinkWrap: true,
          //           controller: allFilterScrollController,
          //           scrollDirection: Axis.horizontal,
          //           itemBuilder: (context, index) {
          //             return CustomChipWidget(
          //               title: transactionHistoryChipTitles[index],
          //               isSelected: transactionHistoryChipTitlesSelected[index],
          //               onTap: () =>
          //                   onChipTapped(transactionHistoryChipTitles[index]),
          //             );
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: ListView(
              children: (() {
                final sortedYears = yearMonthWise.keys.toList()
                  ..sort(
                    (a, b) => latestFirst ? b.compareTo(a) : a.compareTo(b),
                  );

                return sortedYears.map((year) {
                  final monthsMap = yearMonthWise[year]!;

                  final sortedMonths = monthsMap.keys.toList()
                    ..sort((a, b) {
                      int aIndex = monthNames.indexOf(a);
                      int bIndex = monthNames.indexOf(b);
                      return latestFirst
                          ? bIndex.compareTo(aIndex)
                          : aIndex.compareTo(bIndex);
                    });

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...sortedMonths.map((month) {
                        final txns = monthsMap[month]!;
                        final monthTotal = getMonthlyNetTotal(
                          year,
                          month,
                        ).toInt();
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.maxFinite,
                              color: const Color.fromARGB(255, 235, 237, 238),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    year.toString(),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        month,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      TextWidget(
                                        monthTotal.abs().toString(),
                                        fontSize: 18,
                                        fontColor: monthTotal >= 0
                                            ? Colors.green
                                            : Colors.black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ...txns.map((txn) {
                              return ListTile(
                                leading: ClipOval(
                                  child: Image.asset(
                                    txn.receiverImage,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: TextWidget(
                                  txn.receiverName,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                subtitle: TextWidget(
                                  txn.transactionDate
                                      .toString()
                                      .split(".")
                                      .first,
                                  fontSize: 12,
                                ),
                                trailing: TextWidget(
                                  "${txn.statusActionSymbol}${txn.amount}",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontColor: txn.status == "Failed"
                                      ? AppColors.red
                                      : txn.status == "Added"
                                      ? AppColors.green
                                      : getForegroundColor(context),
                                ),
                              );
                            }).toList(),
                          ],
                        );
                      }).toList(),
                    ],
                  );
                }).toList();
              })(),
            ),
          ),
        ],
      ),
    );
  }
}
