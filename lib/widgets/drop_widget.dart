import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';

// ignore: must_be_immutable
class DropWidget extends StatelessWidget {
  String text;
  String image;
  double? width;
  VoidCallback? onTap;
  DropWidget({
    Key? key,
    required this.image,
    required this.text,
    this.onTap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width * 0.22,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: image.length > 20
                  ? Image.network(
                      image,
                      isAntiAlias: true,
                      height: 55,
                      width: 55,
                    )
                  : Image.asset(
                      image,
                      isAntiAlias: true,
                      fit: BoxFit.cover,
                      height: 55,
                      width: 55,
                    ),
            ),
            VerticalSpace(3),
            TextWidget(
              text,
              maxLines: 1,
              textAlign: TextAlign.center,
              fontSize: 13,
              overflow: TextOverflow.ellipsis,
              fontColor: getForegroundColor(context),
            ),
            VerticalSpace(3),
          ],
        ),
      ),
    );
  }
}
