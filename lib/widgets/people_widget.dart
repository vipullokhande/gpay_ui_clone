import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/vertical_space.dart';

class PeopleWidget extends StatelessWidget {
  final String name;
  final String getInitial;
  final Color color;
  const PeopleWidget({
    super.key,
    required this.name,
    required this.getInitial,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: TextWidget(
              getInitial,
              fontColor: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          VerticalSpace(5),
          TextWidget(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            fontColor: getForegroundColor(context),
          ),
        ],
      ),
    );
  }
}
