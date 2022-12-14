import 'package:thegoatjp/src/h.dart';

class AppRouteRegistry {
  final FluroRouter router;

  AppRouteRegistry(this.router);

  initRouter() {
    router.define(
      itemList,
      handler: Handler(
        handlerFunc: (
          BuildContext? context,
          Map<String, List<String>> parameters,
        ) {
          return const ItemListPage();
        },
      ),
    );
  }

  static const itemList = "/list";
}
