import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/horizontal_space.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';

class PaymentMethodWidget extends StatelessWidget {
  String title;
  String image;
  VoidCallback onTap;
  PaymentMethodWidget({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.scaleDown,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            ),
            HorizontalSpace(
              MediaQuery.of(context).size.width * 0.3,
              child: TextWidget(title, fontSize: 15),
            ),
            const Spacer(),
            Checkbox(value: false, onChanged: (v) {}),
          ],
        ),
      ),
    );
  }
}
