import 'package:thegoatjp/src/h.dart';

export 'bloc/item_list_bloc.dart';
export 'view/item_list_page.dart';

@module
abstract class ItemList {
  @factory
  ItemListBloc provideItemListBloc(
    FetchBookListUseCase fetchBookListUseCase,
  ) {
    return ItemListBloc(fetchBookListUseCase);
  }
}
