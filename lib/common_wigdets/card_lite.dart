import 'package:flutter/material.dart' hide Card;
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:loubank/constants/colors.dart';
import 'package:loubank/constants/dimens.dart';
import 'package:loubank/constants/image_assets.dart';
import 'package:loubank/redux/modals/card_state.dart';

class CardLiteWidget extends StatelessWidget {
  final Card card;

  CardLiteWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 13),
      padding: EdgeInsets.only(
          left: LouDimens.horizon_padding_normal, top: 24, bottom: 20),
      height: LouDimens.card_lite_height,
      width: LouDimens.card_lite_width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: LouColors.card_bg_gradients[card.bgColorIndex],
        ),
        borderRadius: BorderRadius.circular(LouDimens.card_border_radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(ImageAssets.LOGO_VISA),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card.accountType,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: LouDimens.font_size_card_acct_type,
                  height: LouDimens.font_height_card_acct_type,
                ),
              ),
              Text(
                '${card.currency} ${NumberFormat.currency(locale: 'en_US', symbol: '', decimalDigits: 0).format(card.balance)}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: LouDimens.font_size_card_acct_bal,
                  height: LouDimens.font_height_card_acct_bal,
                ),
              ),
            ],
          ),
          Text(
            card.cardNumber,
            style: TextStyle(
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
