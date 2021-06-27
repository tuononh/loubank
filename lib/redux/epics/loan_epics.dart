import 'package:loubank/redux/actions/loan_actions.dart';
import 'package:loubank/redux/app_state.dart';
import 'package:loubank/redux/modals/loan_state.dart';
import 'package:redux_epics/redux_epics.dart';

Epic<AppState> getLoanListEpic() =>
    (Stream actions, EpicStore<AppState> store) {
      return actions
          .where((action) => action is GetLoanListAction)
          .asyncMap((action) => getLoanList(action));
    };

Future<dynamic> getLoanList(GetLoanListAction action) async {
  return GetLoanListSuccessAction(
    loanList: [
      Loan(
        accountNo: '3874825',
        currency: '\$',
        amount: 7892,
        rate: 3.5,
        expiryDate: '12/22/2023',
      )
    ],
  );
}
