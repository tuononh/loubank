class CurrencyState {
  List<Currency>? currencyList;
  List<Currency>? metalList;

  CurrencyState({this.currencyList, this.metalList});

  factory CurrencyState.initial() => CurrencyState();

  CurrencyState copyWith({
    List<Currency>? currencyList,
    List<Currency>? metalList,
  }) =>
      CurrencyState(
        currencyList: currencyList ?? this.currencyList,
        metalList: metalList ?? this.metalList,
      );
}

class Currency {
  String name;
  num buyPrice;
  num sellPrice;
  String currency;
  String icon;

  Currency({
    required this.name,
    required this.buyPrice,
    required this.sellPrice,
    required this.currency,
    required this.icon,
  });
}
