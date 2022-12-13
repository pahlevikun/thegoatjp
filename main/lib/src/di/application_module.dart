import 'package:thegoatjp/src/h.dart';

@module
abstract class ApplicationModules {
  @LazySingleton()
  ConnectionChecker provideConnectionChecker() =>
      ConnectionChecker.getInstance();

  @LazySingleton()
  PermissionHelper providePermissionHelper() => PermissionHelper();
}
