import 'package:thegoatjp/src/h.dart';

extension AppTranslationsExt on BuildContext {
  String getString(String? key) => AppTranslations.of(this).text(key);
}

class AppTranslations {
  Locale locale;
  static Map<dynamic, dynamic> _localisedValues = {};

  AppTranslations(this.locale);

  static AppTranslations of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations)!;
  }

  static Future<AppTranslations> load(Locale locale) async {
    // TODO: Put json file path here if want to use dynamic based on locale
    const languageJson = BuildConfig.DICTIONARY_LANG_IN;
    final appTranslations = AppTranslations(locale);
    final jsonContent = await rootBundle.loadString("packages/$languageJson");
    _localisedValues = json.decode(jsonContent);
    return appTranslations;
  }

  get currentLanguage => locale.languageCode;

  String text(String? key) {
    return key == null ? "" : _localisedValues[key] ?? "$key not found";
  }
}
