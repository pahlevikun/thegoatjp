import 'package:thegoatjp/src/h.dart';

@module
abstract class RouterModule {
  @Singleton()
  FluroRouter provideFluroRouter() => FluroRouter();

  @Singleton()
  AppRouteRegistry provideInternalRouter(FluroRouter router) =>
      AppRouteRegistry(router);

  @Singleton()
  NavigationDispatcher provideNavigationDispatcher(FluroRouter router) =>
      NavigationDispatcher(router);
}
