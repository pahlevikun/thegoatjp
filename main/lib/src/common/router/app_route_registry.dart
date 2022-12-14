import 'package:thegoatjp/src/h.dart';

class AppRouteRegistry {
  final FluroRouter router;

  AppRouteRegistry(this.router);

  initRouter() {
    router.define(
      intermediary,
      handler: Handler(
        handlerFunc: (
          BuildContext? context,
          Map<String, List<String>> parameters,
        ) {
          return const ItemListPage();
        },
      ),
    );
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
    router.define(
      itemDetails,
      handler: Handler(
        handlerFunc: (
          BuildContext? context,
          Map<String, List<String>> parameters,
        ) {
          final BookItemEntity book =
              (context?.settings?.arguments as BookItemEntity?) ??
                  BookItemEntity.empty();
          return BookDetailsPage(book: book);
        },
      ),
    );
  }

  static const intermediary = "/intermediary";
  static const itemList = "/list";
  static const itemDetails = "/listDetails";
}
