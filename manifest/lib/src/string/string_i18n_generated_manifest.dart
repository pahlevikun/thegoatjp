// DO NOT EDIT. 

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Intl.message("Gutendex", name: 'appName');
  }

  String get errorViewGenericTitle {
    return Intl.message("Opps, sorry something when wrong", name: 'errorViewGenericTitle');
  }

  String get errorViewGenericDescription {
    return Intl.message("Seems like the page you are looking for got lost, don't worry, please try again later", name: 'errorViewGenericDescription');
  }

  String get errorViewConnectionTitle {
    return Intl.message("Where's your internet connection?", name: 'errorViewConnectionTitle');
  }

  String get errorViewConnectionDescription {
    return Intl.message("Please check your internet settings, seems like the internet is slow or unavailable", name: 'errorViewConnectionDescription');
  }

  String get errorViewEmptyTitle {
    return Intl.message("I'm sorry, no data here", name: 'errorViewEmptyTitle');
  }

  String get errorViewEmptyDescription {
    return Intl.message("Later it will be shown here", name: 'errorViewEmptyDescription');
  }

  String get bookSubject {
    return Intl.message("Subject", name: 'bookSubject');
  }

  String get bookAuthor {
    return Intl.message("Author", name: 'bookAuthor');
  }

  String get bookLanguage {
    return Intl.message("Language", name: 'bookLanguage');
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
