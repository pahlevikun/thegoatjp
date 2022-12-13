import 'dart:ui';

const Locale defaultLocale = Locale("en", "EN");

class MultiLanguageAdapter {
  final List<Locale> supportedLanguagesCodes = [
    defaultLocale,
  ];

  Iterable<Locale> supportedLocales() => supportedLanguagesCodes;

  LocaleChangeListener? onLocaleChanged;
}

typedef LocaleChangeListener = void Function(Locale locale);
