import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/horizontal_space.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';

class StatusWidget extends StatelessWidget {
  IconData icon;
  String title;
  Color color;
  VoidCallback onTap;
  bool value;
  StatusWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            HorizontalSpace(5),
            CircleAvatar(
              radius: 17,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),
            HorizontalSpace(7),
            TextWidget(title, fontWeight: FontWeight.w500, fontSize: 16),
            const Spacer(),
            Radio(value: value, groupValue: title, onChanged: (v) {}),
          ],
        ),
      ),
    );
  }
}
