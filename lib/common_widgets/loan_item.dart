import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loubank/constants/colors.dart';
import 'package:loubank/constants/dimens.dart';
import 'package:loubank/constants/image_assets.dart';
import 'package:loubank/localization/language_manager.dart';
import 'package:loubank/redux/modals/loan_state.dart';

class LoanItemWidget extends StatelessWidget {
  final Loan loan;

  LoanItemWidget({required this.loan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: LouDimens.horizon_padding_screen, vertical: 22),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Color(0xFF212121),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: Color(0xFFB2D0CE),
                borderRadius: BorderRadius.circular(12)),
            child: Image.asset(ImageAssets.ICON_LOAN_CARD),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locale.language.account_no(loan.accountNo),
                  style: TextStyle(
                    fontSize: LouDimens.font_size_normal,
                    color: LouColors.white,
                    fontWeight: FontWeight.w400,
                    height: 18 / LouDimens.font_size_normal,
                  ),
                ),
                Text(
                  'Expires ${loan.expiryDate}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: LouDimens.font_size_small,
                    height: LouDimens.font_height_small,
                    color: LouColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${loan.currency} ${NumberFormat.currency(locale: 'en_US', symbol: '', decimalDigits: 0).format(loan.amount)}',
                style: TextStyle(
                  fontSize: LouDimens.font_size_normal,
                  color: LouColors.white,
                  fontWeight: FontWeight.w400,
                  height: 18 / LouDimens.font_size_normal,
                ),
              ),
              Text(
                'Rate ${loan.rate}%',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: LouDimens.font_size_small,
                  height: LouDimens.font_height_small,
                  color: LouColors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
