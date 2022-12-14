import 'package:thegoatjp/src/h.dart';

@module
abstract class ApplicationModules {
  @Singleton()
  @Named("build_mode")
  bool provideBuildMode() => BuildConfig.BUILD_STAGE_MODE && !kReleaseMode;
}
