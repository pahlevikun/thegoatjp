import 'package:manifest/manifest.dart';

class BuildConfig {
  BuildConfig._();

  static const APP_NAME = "The GOAT";
  static const APP_ID = "com.defenxor.casemanagement.app";
  static const _IS_STAGING = true;

  static const LANG_IN = LocaleManifest.EN;
  static const DICTIONARY_LANG_IN = AssetManifest.enEn;

  static const BASE_URL = "http://gutendex.com/";
  static const BUILD_STAGE_MODE = _IS_STAGING;
  static const DEBUG_PREVIEW = true;
}
