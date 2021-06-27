import 'package:flutter/cupertino.dart';
import 'package:loubank/constants/colors.dart';
import 'package:loubank/constants/dimens.dart';
import 'package:loubank/helpers/currency.dart';
import 'package:loubank/redux/modals/currency_state.dart';

class CurrencyItemWidget extends StatelessWidget {
  final List<Currency> currencyList;
  final String title;

  CurrencyItemWidget({required this.currencyList, required this.title});

  @override
  Widget build(BuildContext context) {
    List<Widget> currencyWidgetList =
        currencyList.map((c) => _currencyBuildCurrencyItem(c)).toList();
    return Container(
      padding: EdgeInsets.all(LouDimens.horizon_padding_screen),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Color(0xFF212121),
      ),
      child: Column(
        children: [
          _buildHeader(),
          SizedBox(
            height: 4,
          ),
          ...currencyWidgetList,
        ],
      ),
    );
  }

  Widget _buildHeader() {
    Text headerText(text, align) {
      return Text(
        text,
        textAlign: align,
        style: TextStyle(
          color: LouColors.grey,
          fontSize: 12,
          height: 16 / 12,
          fontWeight: FontWeight.w400,
        ),
      );
    }

    return Row(
      children: [
        Expanded(
          child: headerText(title, TextAlign.left),
        ),
        Expanded(
          child: headerText('Buy', TextAlign.right),
        ),
        Expanded(
          child: headerText('Sell', TextAlign.right),
        ),
      ],
    );
  }

  Widget _currencyBuildCurrencyItem(Currency c) {
    Text itemText(text, align) {
      return Text(
        text,
        textAlign: align,
        style: TextStyle(
          color: LouColors.white,
          fontSize: 15,
          height: 18 / 15,
          fontWeight: FontWeight.w400,
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFFB2D0CE),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(c.icon),
                ),
                SizedBox(
                  width: 12,
                ),
                itemText(c.name, TextAlign.left),
              ],
            ),
          ),
          Expanded(
            child: itemText(
                CurrencyHelper.formatDisplay(c.currency, c.buyPrice),
                TextAlign.right),
          ),
          Expanded(
            child: itemText(
                CurrencyHelper.formatDisplay(c.currency, c.sellPrice),
                TextAlign.right),
          ),
        ],
      ),
    );
  }
}
