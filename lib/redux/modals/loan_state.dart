class LoanState {
  List<Loan>? loanList;

  LoanState({this.loanList});

  factory LoanState.initial() => LoanState();

  LoanState copyWith({List<Loan>? loanList}) =>
      LoanState(loanList: loanList ?? this.loanList);
}

class Loan {
  String accountNo;
  String currency;
  num amount;
  num rate;
  String expiryDate;

  Loan({
    required this.accountNo,
    required this.currency,
    required this.amount,
    required this.rate,
    required this.expiryDate,
  });
}
