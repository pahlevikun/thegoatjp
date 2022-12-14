import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class AssetManifest {
  AssetManifest._();
  static const String enEn = "resources/lang/en_en.json";
}

class LottieManifest {
  LottieManifest._();
  static AssetLottie get lottieEmptyError => AssetLottie("../resources/lottie/lottie_empty_error.json", package: "manifest");
  static AssetLottie get lottieGenericError => AssetLottie("../resources/lottie/lottie_generic_error.json", package: "manifest");
  static AssetLottie get lottieNetworkError => AssetLottie("../resources/lottie/lottie_network_error.json", package: "manifest");
}

class ImageManifest {
  ImageManifest._();
  static AssetImage get imgSplashLogo => const AssetImage("../resources/image/img_splash_logo.png", package: "manifest");
}

