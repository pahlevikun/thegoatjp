import 'package:thegoatjp/src/h.dart';

export 'item_list_bloc.dart';
export 'model/item_list_event.dart';
export 'model/item_list_state.dart';

class ItemListBloc extends BaseGoatBloc<ItemListEvent, ItemListState> {
  ItemListBloc() : super(const ItemListState()) {
    on<ItemListReady>(_mapEventReady);
  }

  _mapEventReady(
    ItemListReady event,
    Emitter<ItemListState> emitter,
  ) {
    emit(state.copyWith(page: const ItemListMarble.showShimmer()));
  }
}
