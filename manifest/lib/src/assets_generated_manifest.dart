import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class AssetManifest {
  AssetManifest._();
  static const String enEn = "resources/lang/en_en.json";
}

class LottieManifest {
  LottieManifest._();
  static AssetLottie get lottieConfirmationSuccess => AssetLottie("../resources/lottie/lottie_confirmation_success.json", package: "manifest");
}

class ImageManifest {
  ImageManifest._();
  static AssetImage get imgSplashLogo => const AssetImage("../resources/image/img_splash_logo.png", package: "manifest");
}

