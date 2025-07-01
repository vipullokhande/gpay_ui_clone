import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/horizontal_space.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';

class CustomChipWidget extends StatefulWidget {
  String title;
  bool isSelected;
  VoidCallback onTap;
  CustomChipWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  @override
  State<CustomChipWidget> createState() => _CustomChipWidgetState();
}

class _CustomChipWidgetState extends State<CustomChipWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Chip(
          backgroundColor: widget.isSelected
              ? const Color.fromARGB(255, 223, 241, 255)
              : AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              width: 1,
              color: widget.isSelected
                  ? const Color.fromARGB(255, 0, 140, 255)
                  : AppColors.black,
            ),
          ),
          label: Row(
            children: [
              TextWidget(
                widget.title,
                fontColor: widget.isSelected
                    ? const Color.fromARGB(255, 0, 140, 255)
                    : AppColors.black,
              ),
              HorizontalSpace(5),
              Icon(
                Icons.arrow_drop_down,
                color: widget.isSelected
                    ? const Color.fromARGB(255, 0, 140, 255)
                    : AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
