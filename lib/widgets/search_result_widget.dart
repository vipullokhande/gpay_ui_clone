import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/app_colors.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';

// ignore: must_be_immutable
class SearchResultWidget extends StatelessWidget {
  final String name;
  final String image;
  Color? color;
  SearchResultWidget({
    super.key,
    required this.name,
    required this.image,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image.length == 2
            ? CircleAvatar(
                backgroundColor: color,
                radius: 30,
                child: TextWidget(
                  name,
                  fontColor: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              )
            : ClipOval(
                clipBehavior: Clip.antiAlias,
                child: image.length > 30
                    ? Image.network(
                        image,
                        isAntiAlias: true,
                        height: 55,
                        width: 55,
                      )
                    : Image.asset(
                        image,
                        isAntiAlias: true,
                        height: 55,
                        width: 55,
                      ),
              ),
      ],
    );
  }
}
