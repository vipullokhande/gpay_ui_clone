import 'package:flutter/material.dart';
import 'package:gpay_ui_clone_clone/core/common/utils/color_util.dart';
import 'package:gpay_ui_clone_clone/core/common/widgets/text_widget.dart';
import 'package:gpay_ui_clone_clone/features/dashboard/data/models/businesses_model.dart';

class SingleBusinessWidget extends StatelessWidget {
  final BusinessesModel businessesModel;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const SingleBusinessWidget({
    super.key,
    required this.businessesModel,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        width: 90,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipOval(
              clipBehavior: Clip.antiAlias,
              child: businessesModel.businessAsset.length > 30
                  ? Image.network(
                      businessesModel.businessAsset,
                      isAntiAlias: true,
                      height: 55,
                      width: 55,
                    )
                  : Image.asset(
                      businessesModel.businessAsset,
                      isAntiAlias: true,
                      height: 55,
                      width: 55,
                    ),
            ),
            TextWidget(
              businessesModel.businessName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              fontColor: getForegroundColor(context),
            ),
          ],
        ),
      ),
    );
  }
}
