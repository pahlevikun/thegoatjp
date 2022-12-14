import 'package:thegoatjp/src/h.dart';

class NavigationDispatcher {
  final FluroRouter _router;

  NavigationDispatcher(this._router);

  void back(context, {dynamic result}) {
    _router.pop(context, result);
  }

  pop(BuildContext context) {
    Navigator.pop(context);
  }

  popDialog(GlobalKey? key) {
    key?.currentContext?.let(
      (context) => Navigator.of(context, rootNavigator: true).pop(),
    );
  }

  Future<dynamic> goToPath(
    BuildContext context,
    String path, {
    bool clearStack = false,
    TransitionType transition = TransitionType.fadeIn,
    RouteSettings? routeSettings,
  }) async {
    return _router.navigateTo(
      context,
      path,
      clearStack: clearStack,
      transition: transition,
      routeSettings: routeSettings,
    );
  }

  Future<dynamic> goToItemList(
    BuildContext context, {
    bool clearStack = false,
  }) async {
    return goToPath(context, AppRouteRegistry.itemList, clearStack: clearStack);
  }

  Future<dynamic> goToItemDetails(
    BuildContext context,
    BookItemEntity book,
  ) async {
    return goToPath(
      context,
      AppRouteRegistry.itemDetails,
      clearStack: false,
      routeSettings: RouteSettings(arguments: book),
    );
  }
}
