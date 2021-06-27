import 'package:loubank/redux/modals/card_state.dart';

class GetCardListAction {}

class GetCardListSuccessAction {
  List<Card>? cardList;

  GetCardListSuccessAction({this.cardList});
}

class GetCardListErrorAction {}
