library manifest;

export 'src/assets_generated_manifest.dart' show AssetManifest, ImageManifest, LottieManifest;
export 'src/build_config.dart' show BuildConfig;
export 'src/color_manifest.dart' show ColorManifest;
export 'src/dimension_manifest.dart' show DimensionsManifest;
export 'src/shape_style_manifest.dart' show ShapeStylesManifest;
export 'src/string/string_i18n_constant_manifest.dart' show StringManifest, LocaleManifest;

/**
    How to generate file, Please note that you need to run flutter pub get or pub get in each generator module first
    1.  All String : Go to manifest directory, run on terminal `flutter pub run language:generate --source-dir=../../resources/lang/ --output-dir=lib/src/string/`, you need to run this command since this generator is dart specific
    2.  All Assets : Go to manifest directory, run on terminal `flutter pub run assets:generate` for this one, this generator is flutter specific
    3.  Code : Go to root directory of the project, run on terminal `flutter packages pub run build_runner build`, this generator is flutter specific

    All files will generated, you can just use it, cheers!
 **/
