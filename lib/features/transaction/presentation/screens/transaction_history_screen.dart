import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/controllers/dark_mode_controller.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/nav_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';
import 'package:gpay_ui_clone_clone/features/billings/data/models/transaction_model.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/clear_widget.dart';
import 'package:gpay_ui_clone_clone/widgets/custom_chip_widget.dart';
import 'package:gpay_ui_clone_clone/widgets/payment_type_widget.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/payment_method_widget.dart';
import '../../../../widgets/status_widget.dart';

// ignore: must_be_immutable
class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

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
      transactionDate: "2023-01-23",
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Mohan Sweets",
      receiverImage: "assets/redbus.png",
      status: "Failed",
      statusActionSymbol: "!",
      amount: 10,
      transactionDate: "2023-01-01",
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Omkar Snacks",
      receiverImage: "assets/mv.png",
      status: "Completed",
      statusActionSymbol: "",
      amount: 70,
      transactionDate: "2023-11-09",
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "5 Paisa",
      receiverImage: "assets/5paisa.png",
      status: "Added",
      statusActionSymbol: "+",
      amount: 80,
      transactionDate: "2023-08-12",
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Mohan Sweets",
      receiverImage: "assets/maha.png",
      status: "Failed",
      statusActionSymbol: "!",
      amount: 40,
      transactionDate: "2023-01-23",
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Omkar Snacks",
      receiverImage: "assets/mv.png",
      status: "Completed",
      statusActionSymbol: "",
      amount: 120,
      transactionDate: "2023-01-01",
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "5 Paisa",
      receiverImage: "assets/5paisa.png",
      status: "Added",
      statusActionSymbol: "+",
      amount: 80,
      transactionDate: "2023-11-09",
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Mohan Sweets",
      receiverImage: "assets/maha.png",
      status: "Failed",
      statusActionSymbol: "!",
      amount: 40,
      transactionDate: "2023-08-12",
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Omkar Snacks",
      receiverImage: "assets/mv.png",
      status: "Completed",
      statusActionSymbol: "",
      amount: 120,
      transactionDate: "2023-01-23",
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Jio Prepaid",
      receiverImage: "assets/jio.png",
      status: "Added",
      statusActionSymbol: "+",
      amount: 20,
      transactionDate: "2023-01-01",
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Mohan Sweets",
      receiverImage: "assets/redbus.png",
      status: "Failed",
      statusActionSymbol: "!",
      amount: 10,
      transactionDate: "2023-11-09",
    ),
    TransactionModel(
      senderName: "User X",
      receiverName: "Omkar Snacks",
      receiverImage: "assets/mv.png",
      status: "Failed",
      statusActionSymbol: "!",
      amount: 70,
      transactionDate: "2023-08-12",
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

  @override
  void initState() {
    super.initState();
    transactionHistoryChipTitlesSelectedM();
    var toSort = [];
    for (int i = 0; i < transactions.length; i++) {
      toSort.add([
        int.parse(transactions[i].transactionDate.split("-").first),
        int.parse(transactions[i].transactionDate.split("-")[1]),
        int.parse(transactions[i].transactionDate.split("-").last),
      ]);
    }
    toSort.sort((a, b) => a[1].compareTo(b[1]));
    for (var i = 0; i < transactions.length; i++) {
      transactions[i].transactionDate = "";
    }
    for (var i = 0; i < toSort.length; i++) {
      toSort[i] =
          "${toSort[i].first.toString()}-${toSort[i][1].toString()}-${toSort[i].last.toString()}";
      transactions[i].transactionDate = toSort[i];
    }
  }

  void transactionHistoryChipTitlesSelectedM() {
    for (var i = 0; i < transactionHistoryChipTitles.length; i++) {
      transactionHistoryChipTitlesSelected.add(false);
    }
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
    final searchController = TextEditingController();
    if (filteredtransactions.isNotEmpty) {
      filter = true;
    } else {
      filter = false;
    }

    return Scaffold(
      backgroundColor: isDark
          ? const Color.fromARGB(220, 12, 12, 12)
          : AppColors.white,
      body: Column(
        children: [
          VerticalSpace(20),
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
                // onTap: () {
                //   setState(() {
                //     isSearch = true;
                //   });
                // },
                onEditingComplete: () {
                  setState(() {
                    // if (searchController.text.isEmpty) {
                    //   setState(() {
                    //     isSearch = false;
                    //   });
                    // }
                    for (int i = 0; i < transactions.length; i++) {
                      if (searchResTitles.isEmpty) {
                        if (transactions[i].receiverName.toLowerCase().contains(
                          searchController.text.toLowerCase(),
                        )) {
                          searchResTitles.add(transactions[i].receiverName);
                          searchResAssets.add(transactions[i].receiverImage);
                          searchResSubtitles.add(
                            transactions[i].transactionDate,
                          );
                          searchResAmounts.add(
                            transactions[i].amount.toString(),
                          );
                          isSearch = true;
                        }
                      }
                    }
                  });
                },
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
          VerticalSpace(
            80,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) => Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        controller: allFilterScrollController,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ).copyWith(top: 20),
                              child: Row(
                                children: [
                                  TextWidget('Filters', fontSize: 18),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () => NavUtil.pop(context),
                                    icon: const Icon(Icons.close),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                    bottom: 20,
                                    right: 15,
                                    top: 15,
                                  ),
                                  'Status',
                                  fontSize: 20,
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
                                TextWidget(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                    bottom: 20,
                                    top: 10,
                                  ),
                                  'Payment method',
                                  fontSize: 20,
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
                                TextWidget(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                    bottom: 20,
                                    top: 15,
                                  ),
                                  'Amount',
                                  fontSize: 20,
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
                                    trailing: Checkbox(
                                      value: false,
                                      onChanged: (v) {},
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 10,
                                    bottom: 20,
                                  ),
                                  child: ClearWidget(
                                    onTap1: () {},
                                    onTap2: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.filter_alt_outlined),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: transactionHistoryChipTitles.length,
                    shrinkWrap: true,
                    controller: allFilterScrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomChipWidget(
                        title: transactionHistoryChipTitles[index],
                        isSelected: transactionHistoryChipTitlesSelected[index],
                        onTap: () =>
                            onChipTapped(transactionHistoryChipTitles[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          VerticalSpace(10),
          isSearch
              ? Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: searchResTitles.length,
                    controller: allFilterScrollController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final asset = searchResAssets[index];
                      final title = searchResTitles[index];
                      final subtitle = searchResSubtitles[index];
                      final amount = searchResAmounts[index];
                      return ListTile(
                        onTap: () {},
                        leading: ClipOval(
                          child: Image.asset(
                            asset,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: TextWidget(
                          title,
                          fontColor: getForegroundColor(context),
                          fontWeight: FontWeight.w500,
                        ),
                        subtitle: TextWidget(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontColor: isDark
                              ? const Color.fromARGB(255, 198, 196, 196)
                              : AppColors.black,
                        ),
                        trailing: TextWidget(
                          amount,
                          fontColor: getForegroundColor(context),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      );
                    },
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: filteredtransactions.isNotEmpty
                        ? filteredtransactions.length
                        : transactions.length,
                    controller: allFilterScrollController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      int totalAmount = 0;
                      final asset = filter
                          ? filteredtransactions[index].receiverImage
                          : transactions[index].receiverImage;
                      final title = filter
                          ? filteredtransactions[index].receiverName
                          : transactions[index].receiverName;
                      final subtitle = filter
                          ? filteredtransactions[index].transactionDate
                          : transactions[index].transactionDate;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          index == 0
                              ? Container(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                  ),
                                  height: 70,
                                  width: double.maxFinite,
                                  color: isDark
                                      ? const Color.fromARGB(255, 36, 36, 36)
                                      : const Color.fromARGB(
                                          255,
                                          235,
                                          235,
                                          235,
                                        ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        getMonthName(
                                          int.parse(subtitle.split('-')[1]),
                                        ),
                                        fontSize: 24,
                                        // fontFamily: "Roboto",
                                        fontWeight: FontWeight.w700,
                                        fontColor: getForegroundColor(context),
                                      ),
                                      TextWidget(
                                        "$totalAmount  ",
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        fontColor: getForegroundColor(context),
                                      ),
                                    ],
                                  ),
                                )
                              : index !=
                                    (filter
                                        ? filteredtransactions.length
                                        : transactions.length)
                              ? (filter
                                        ? int.parse(
                                                filteredtransactions[index]
                                                    .transactionDate
                                                    .split('-')[1],
                                              ) !=
                                              int.parse(
                                                filteredtransactions[index - 1]
                                                    .transactionDate
                                                    .split('-')[1],
                                              )
                                        : int.parse(
                                                transactions[index]
                                                    .transactionDate
                                                    .split('-')[1],
                                              ) !=
                                              int.parse(
                                                transactions[index - 1]
                                                    .transactionDate
                                                    .split('-')[1],
                                              ))
                                    ? Container(
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                        ),
                                        height: 70,
                                        width: double.maxFinite,
                                        color: isDark
                                            ? const Color.fromARGB(
                                                255,
                                                36,
                                                36,
                                                36,
                                              )
                                            : const Color.fromARGB(
                                                255,
                                                235,
                                                235,
                                                235,
                                              ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextWidget(
                                              getMonthName(
                                                int.parse(
                                                  filter
                                                      ? filteredtransactions[index]
                                                            .transactionDate
                                                            .split('-')[1]
                                                      : transactions[index]
                                                            .transactionDate
                                                            .split('-')[1],
                                                ),
                                              ),
                                              fontSize: 24,
                                              // fontFamily: "Roboto",
                                              fontWeight: FontWeight.w700,
                                              fontColor: getForegroundColor(
                                                context,
                                              ),
                                            ),
                                            TextWidget(
                                              "$totalAmount  ",
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              fontColor: getForegroundColor(
                                                context,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : VerticalSpace(0)
                              : VerticalSpace(0),
                          ListTile(
                            onTap: () {},
                            leading: ClipOval(
                              child: Image.asset(
                                asset,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: TextWidget(
                              title,
                              fontColor: getForegroundColor(context),
                              fontWeight: FontWeight.w500,
                            ),
                            subtitle: TextWidget(
                              subtitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontColor: isDark
                                  ? const Color.fromARGB(255, 198, 196, 196)
                                  : AppColors.black,
                            ),
                            trailing: TextWidget(
                              filter
                                  ? "${transactions[index].statusActionSymbol}${transactions[index].amount}${transactions[index].statusActionSymbol.startsWith('!') ? '\nFailed' : ''}"
                                  : "${transactions[index].statusActionSymbol}${transactions[index].amount}${transactions[index].statusActionSymbol.startsWith('!') ? '\nFailed' : ''}",
                              textAlign: TextAlign.right,
                              fontColor:
                                  (filter
                                      ? filteredtransactions[index]
                                            .statusActionSymbol
                                            .startsWith('!')
                                      : transactions[index].statusActionSymbol
                                            .startsWith('!'))
                                  ? AppColors.red
                                  : (filter
                                        ? filteredtransactions[index]
                                              .statusActionSymbol
                                              .startsWith('+')
                                        : transactions[index].statusActionSymbol
                                              .startsWith('+'))
                                  ? AppColors.green
                                  : getForegroundColor(context),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
