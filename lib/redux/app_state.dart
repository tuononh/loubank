import 'package:loubank/redux/modals/card_state.dart';
import 'package:loubank/redux/modals/currency_state.dart';
import 'package:loubank/redux/modals/loan_state.dart';

class AppState {
  CardState cardState;
  LoanState loanState;
  CurrencyState currencyState;
  num balance;
  String currency;

  AppState({
    required this.cardState,
    required this.loanState,
    required this.currencyState,
    required this.balance,
    required this.currency,
  });

  factory AppState.initial() => AppState(
        cardState: CardState.initial(),
        loanState: LoanState.initial(),
        currencyState: CurrencyState.initial(),
        balance: 7896,
        currency: '\$',
      );

  AppState copyWith({
    CardState? cardState,
    LoanState? loanState,
    CurrencyState? currencyState,
    num? balance,
    String? currency,
  }) =>
      AppState(
          cardState: cardState ?? this.cardState,
          loanState: loanState ?? this.loanState,
          currencyState: currencyState ?? this.currencyState,
          balance: balance ?? this.balance,
          currency: currency ?? this.currency);
}
