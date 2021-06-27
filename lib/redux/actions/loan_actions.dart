import 'package:loubank/redux/modals/loan_state.dart';

class GetLoanListAction {}

class GetLoanListSuccessAction {
  List<Loan> loanList;

  GetLoanListSuccessAction({required this.loanList});
}

class GetLoanListErrorAction {}
