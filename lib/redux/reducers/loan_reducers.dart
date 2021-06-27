import 'package:loubank/redux/actions/loan_actions.dart';
import 'package:loubank/redux/modals/loan_state.dart';
import 'package:redux/redux.dart';

final loanReducers = combineReducers<LoanState>([
  TypedReducer<LoanState, GetLoanListSuccessAction>(_onGetLoanListSuccess),
]);

LoanState _onGetLoanListSuccess(
    LoanState state, GetLoanListSuccessAction action) {
  return LoanState(loanList: action.loanList);
}
