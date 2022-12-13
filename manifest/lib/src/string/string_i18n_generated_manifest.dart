// DO NOT EDIT. 

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'string_i18n_copies_all.dart';

class StringGeneratedManifest {
 
  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  static StringGeneratedManifest? of(BuildContext context) {
    return Localizations.of<StringGeneratedManifest>(context, StringGeneratedManifest);
  }
  
  static Future<StringGeneratedManifest> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new StringGeneratedManifest();
    });
  }
  
  String get appName {
    return Intl.message("The GOAT JP", name: 'appName');
  }


}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<StringGeneratedManifest> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
			Locale("en", "en"),

    ];
  }

  LocaleListResolutionCallback? listResolution({Locale? fallback}) {
    return (List<Locale>? locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported);
      }
    };
  }

  LocaleResolutionCallback? resolution({Locale? fallback}) {
    return (Locale? locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported);
    };
  }

  Locale _resolve(Locale? locale, Locale? fallback, Iterable<Locale> supported) {
    if (locale == null || !isSupported(locale)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  @override
  Future<StringGeneratedManifest> load(Locale locale) {
    return StringGeneratedManifest.load(locale);
  }

  @override
  bool isSupported(Locale? locale) =>
    locale != null && supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

// ignore_for_file: unnecessary_brace_in_string_interps
