import 'package:loubank/constants/image_assets.dart';
import 'package:loubank/redux/actions/currency_actions.dart';
import 'package:loubank/redux/app_state.dart';
import 'package:loubank/redux/modals/currency_state.dart';
import 'package:redux_epics/redux_epics.dart';

Epic<AppState> getCurrencyListEpic() =>
    (Stream actions, EpicStore<AppState> store) {
      return actions
          .where((action) => action is GetCurrencyListAction)
          .asyncMap((action) => getCurrencyList(action));
    };

Future<dynamic> getCurrencyList(GetCurrencyListAction action) async {
  return GetCurrencyListSuccessAction(
    currencyList: [
      Currency(
          name: 'USD',
          buyPrice: 7892,
          sellPrice: 7892,
          currency: '\$',
          icon: ImageAssets.ICON_DOLLAR),
      Currency(
          name: 'EUR',
          buyPrice: 7892,
          sellPrice: 7892,
          currency: '\$',
          icon: ImageAssets.ICON_EURO),
    ],
    metalList: [
      Currency(
          name: 'Gold',
          buyPrice: 7892,
          sellPrice: 7892,
          currency: '\$',
          icon: ImageAssets.ICON_METAL),
      Currency(
          name: 'Silver',
          buyPrice: 7892,
          sellPrice: 7892,
          currency: '\$',
          icon: ImageAssets.ICON_METAL),
    ],
  );
}
