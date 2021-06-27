import 'package:loubank/redux/actions/card_actions.dart';
import 'package:loubank/redux/app_state.dart';
import 'package:loubank/redux/modals/card_state.dart';
import 'package:redux_epics/redux_epics.dart';

Epic<AppState> getCardListEpic() =>
    (Stream actions, EpicStore<AppState> store) {
      return actions
          .where((action) => action is GetCardListAction)
          .asyncMap((action) => getCardList(action));
    };

Future<dynamic> getCardList(GetCardListAction action) async {
  return GetCardListSuccessAction(
    cardList: [
      Card(
        brand: CardBrand.VISA,
        accountType: "Salary",
        balance: 2230,
        currency: "\$",
        cardNumber: "** 6917",
        holderName: "Pham Tuan Anh",
        expiryDate: "12/22",
        bgColorIndex: 0,
      ),
      Card(
        brand: CardBrand.VISA,
        accountType: "Savings account",
        balance: 5556,
        currency: "\$",
        cardNumber: "** 4552",
        holderName: "Pham Tuan Anh",
        expiryDate: "12/22",
        bgColorIndex: 1,
      ),
      Card(
        brand: CardBrand.VISA,
        accountType: "Savings account",
        balance: 5556,
        currency: "\$",
        cardNumber: "** 4552",
        holderName: "Pham Tuan Anh",
        expiryDate: "12/22",
        bgColorIndex: 2,
      ),
    ],
  );
}
