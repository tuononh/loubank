import 'package:loubank/redux/app_state.dart';
import 'package:loubank/redux/modals/card_state.dart';
import 'package:loubank/redux/modals/currency_state.dart';
import 'package:loubank/redux/modals/loan_state.dart';
import 'package:redux/redux.dart';

class HomeViewModel {
  List<Card>? cardList;
  List<Loan>? loanList;
  List<Currency>? currencyList;
  List<Currency>? metalList;
  String currency;
  num balance;

  HomeViewModel({
    this.cardList,
    this.loanList,
    this.currencyList,
    this.metalList,
    required this.currency,
    required this.balance,
  });

  factory HomeViewModel.convertFromStore(Store<AppState> store) {
    return HomeViewModel(
      cardList: store.state.cardState.cardList,
      loanList: store.state.loanState.loanList,
      currencyList: store.state.currencyState.currencyList,
      metalList: store.state.currencyState.metalList,
      currency: store.state.currency,
      balance: store.state.balance,
    );
  }
}
