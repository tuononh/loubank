import 'package:loubank/localization/language_builder.dart';

class ENUSLanguage implements LanguageBuilder {
  @override
  String get your_balance => 'Your balance';

  @override
  String get finance => 'Finance';

  @override
  String get my_bonuses => 'My bonuses';

  @override
  String get my_budget => 'My budget';

  @override
  String get finance_analysis => 'Finance analysis';

  @override
  String get current_loans => 'Current loans';

  @override
  String account_no(String account) => 'Account № $account';

  @override
  String get locale_name => 'English';
}
