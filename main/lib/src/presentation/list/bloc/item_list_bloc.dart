import 'package:thegoatjp/src/common/base_goat_bloc.dart';
import 'package:thegoatjp/src/h.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

export 'item_list_bloc.dart';
export 'model/item_list_event.dart';
export 'model/item_list_state.dart';

class ItemListBloc extends BaseGoatBloc<ItemListEvent, ItemListState> {
  ItemListBloc(
  ) : super(const ItemListState());

}
