enum CardBrand {
  VISA,
  MASTERCARD,
}

class CardState {
  List<Card>? cardList;

  CardState({this.cardList});

  factory CardState.initial() => CardState();

  CardState copyWith({List<Card>? cardList}) =>
      CardState(cardList: cardList ?? this.cardList);
}

class Card {
  final CardBrand brand;
  final String accountType;
  final num balance;
  final String currency;
  final String cardNumber;
  final String holderName;
  final String expiryDate;
  final int bgColorIndex;

  Card({
    required this.brand,
    required this.accountType,
    required this.balance,
    required this.currency,
    required this.cardNumber,
    required this.holderName,
    required this.expiryDate,
    required this.bgColorIndex,
  });
}
