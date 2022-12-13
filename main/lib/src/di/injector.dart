import 'package:thegoatjp/src/h.dart';

import 'injector.config.dart';

final _locator = GetIt.instance;

class Injector {
  Injector._();
  static final locator = _locator;
}

@injectableInit
Future<void> configureInjection() async => $initGetIt(_locator);
