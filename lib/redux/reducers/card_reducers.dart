import 'package:loubank/redux/actions/card_actions.dart';
import 'package:loubank/redux/modals/card_state.dart';
import 'package:redux/redux.dart';

final cardReducers = combineReducers<CardState>([
  TypedReducer<CardState, GetCardListSuccessAction>(_onGetCardListSuccess),
]);

CardState _onGetCardListSuccess(
    CardState state, GetCardListSuccessAction action) {
  return CardState(cardList: action.cardList);
}
