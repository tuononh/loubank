import 'package:flutter/cupertino.dart';
import 'package:loubank/constants/colors.dart';
import 'package:loubank/constants/dimens.dart';

class UtilityItem {
  final String title;
  final Color iconBgColor;
  final String iconPath;

  UtilityItem(
      {required this.title, required this.iconBgColor, required this.iconPath});
}

class UtilityItemWidget extends StatelessWidget {
  final UtilityItem item;

  UtilityItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14.0),
      width: LouDimens.utility_item_width,
      height: LouDimens.utility_item_height,
      padding: EdgeInsets.only(
        top: LouDimens.horizon_padding_normal,
        left: LouDimens.horizon_padding_normal,
        right: LouDimens.horizon_padding_normal,
        bottom: 14.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LouDimens.border_radius),
          color: LouColors.utility_bg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: item.iconBgColor,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(item.iconPath),
          ),
          Text(
            item.title,
            style: TextStyle(
              color: LouColors.white,
              fontWeight: FontWeight.w500,
              fontSize: LouDimens.font_size_card_acct_type,
              height: LouDimens.font_height_card_acct_type,
            ),
          ),
        ],
      ),
    );
  }
}
