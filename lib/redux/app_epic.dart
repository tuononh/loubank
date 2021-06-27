import 'package:loubank/redux/app_state.dart';
import 'package:loubank/redux/epics/currency_epics.dart';
import 'package:loubank/redux/epics/loan_epics.dart';
import 'package:redux_epics/redux_epics.dart';

import 'epics/card_epics.dart';

Epic<AppState> appEpic() => combineEpics<AppState>([
      getCardListEpic(),
      getLoanListEpic(),
      getCurrencyListEpic(),
    ]);
