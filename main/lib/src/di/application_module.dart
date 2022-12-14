import 'package:alice/alice.dart';
import 'package:thegoatjp/src/h.dart';

@module
abstract class ApplicationModules {
  @LazySingleton()
  ConnectionChecker provideConnectionChecker() =>
      ConnectionChecker.getInstance();

  @LazySingleton()
  PermissionHelper providePermissionHelper() => PermissionHelper();

  @Singleton()
  @Named("build_mode")
  bool provideBuildMode() => BuildConfig.BUILD_STAGE_MODE && !kReleaseMode;
}
