import 'dart:developer';

import 'package:thegoatjp/src/h.dart';

class Logger {
  static void debug(String message) {
    if (!kReleaseMode) {
      log("APP_LOGGER >>> $message");
    }
  }
}
