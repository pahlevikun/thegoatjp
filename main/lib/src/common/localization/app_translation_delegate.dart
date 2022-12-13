import 'dart:async';

import 'package:flutter/material.dart';

import 'app_translation.dart';
import 'application.dart';

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  Locale newLocale;

  AppTranslationsDelegate(this.newLocale);

  @override
  bool isSupported(Locale locale) {
    return MultiLanguageAdapter()
        .supportedLanguagesCodes
        .map((e) => e.languageCode)
        .contains(locale.languageCode);
  }

  @override
  Future<AppTranslations> load(Locale locale) {
    return AppTranslations.load(newLocale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return true;
  }
}
