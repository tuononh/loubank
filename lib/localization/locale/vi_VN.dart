import 'package:loubank/localization/language_builder.dart';

class VIVNLanguage implements LanguageBuilder {
  @override
  String get your_balance => 'Số dư';

  @override
  String get finance => 'Tài chính';

  @override
  String get my_bonuses => 'Điểm thưởng';

  @override
  String get my_budget => 'Ví của tôi';

  @override
  String get finance_analysis => 'Phân tích tài chính';

  @override
  String get current_loans => 'Các khoản vay';

  @override
  String account_no(String account) => 'Tài khoản $account';

  @override
  String get locale_name => 'Tiếng Việt';
}
