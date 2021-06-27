import 'package:loubank/localization/language_builder.dart';
import 'package:loubank/localization/locale/en_US.dart';
import 'package:loubank/localization/locale/vi_VN.dart';

class LanguageManager {
  final List<LanguageBuilder> _builders = [VIVNLanguage(), ENUSLanguage()];

  LanguageBuilder _currentBuilder = ENUSLanguage();

  void init() {}

  static final LanguageManager _languageManager = LanguageManager._internal();

  LanguageManager._internal();

  factory LanguageManager() {
    return _languageManager;
  }

  LanguageBuilder get language => _currentBuilder;
}

final LanguageManager locale = LanguageManager();
