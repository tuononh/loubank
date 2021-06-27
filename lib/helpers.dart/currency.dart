import 'package:intl/intl.dart';

class CurrencyHelper {
  static String formatDisplay(String currency, num amount) {
    return currency +
        ' ' +
        NumberFormat.currency(locale: 'en_US', symbol: '', decimalDigits: 0)
            .format(amount);
  }
}
