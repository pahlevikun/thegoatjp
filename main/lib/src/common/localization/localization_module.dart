import 'package:thegoatjp/src/h.dart';

@module
abstract class LocalizationModules {
  @Singleton()
  MultiLanguageAdapter provideLocalizationApi() => MultiLanguageAdapter();
}
