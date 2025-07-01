import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';

class ClearWidget extends StatelessWidget {
  VoidCallback onTap1;
  VoidCallback onTap2;
  bool? isFilterAll;
  ClearWidget({
    super.key,
    required this.onTap1,
    required this.onTap2,
    this.isFilterAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onTap1,
          child: TextWidget(isFilterAll! ? 'Clear all' : "Clear Filter"),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 223, 241, 255),
          ),
          onPressed: onTap2,
          child: TextWidget("Apply"),
        ),
      ],
    );
  }
}
