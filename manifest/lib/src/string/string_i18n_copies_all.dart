// DO NOT EDIT. 

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
// ignore: implementation_imports
import 'package:intl/src/intl_helpers.dart';

final _$en_en = $en_en();

class $en_en extends MessageLookupByLibrary {
  get localeName => 'en_en';
  
  final messages = {
		"app_name" : MessageLookupByLibrary.simpleMessage("Gutendex"),
		"error_view_generic_title" : MessageLookupByLibrary.simpleMessage("Opps, sorry something when wrong"),
		"error_view_generic_description" : MessageLookupByLibrary.simpleMessage("Seems like the page you are looking for got lost, don't worry, please try again later"),
		"error_view_connection_title" : MessageLookupByLibrary.simpleMessage("Where's your internet connection?"),
		"error_view_connection_description" : MessageLookupByLibrary.simpleMessage("Please check your internet settings, seems like the internet is slow or unavailable"),
		"error_view_empty_title" : MessageLookupByLibrary.simpleMessage("I'm sorry, no data here"),
		"error_view_empty_description" : MessageLookupByLibrary.simpleMessage("Later it will be shown here"),
		"book_subject" : MessageLookupByLibrary.simpleMessage("Subject"),
		"book_author" : MessageLookupByLibrary.simpleMessage("Author"),
		"book_language" : MessageLookupByLibrary.simpleMessage("Language"),

  };
}



typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
	"en_en": () => Future.value(null),

};

MessageLookupByLibrary? _findExact(localeName) {
  switch (localeName) {
    case "en_en":
        return _$en_en;

    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  var availableLocale = Intl.verifiedLocale(
      localeName,
          (locale) => _deferredLibraries[locale] != null,
      onFailure: (_) => null);
  if (availableLocale == null) {
    return Future.value(false);
  }
  var lib = _deferredLibraries[availableLocale];
  await (lib == null ? Future.value(false) : lib());

  initializeInternalMessageLookup(() => CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);

  return Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(locale) {
  var actualLocale = Intl.verifiedLocale(locale, _messagesExistFor,
      onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}

// ignore_for_file: unnecessary_brace_in_string_interps
