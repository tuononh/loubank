import 'package:flutter/cupertino.dart';
import 'package:loubank/common_wigdets/card_lite.dart';
import 'package:loubank/constants/dimens.dart';
import 'package:loubank/redux/modals/card_state.dart';

class CardListWidget extends StatelessWidget {
  final List<Card>? cardList;

  CardListWidget({this.cardList});

  @override
  Widget build(BuildContext context) {
    if (cardList == null) return Container();
    List<CardLiteWidget> cards = cardList!
        .map((c) => CardLiteWidget(
              card: c,
            ))
        .toList();
    return Container(
      height: LouDimens.card_lite_height,
      child: ListView(
        padding: EdgeInsets.only(left: LouDimens.horizon_padding_screen),
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }
}
