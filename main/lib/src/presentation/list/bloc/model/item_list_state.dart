import 'package:thegoatjp/src/h.dart';

part 'item_list_state.freezed.dart';

@Freezed(
  toStringOverride: false,
  fromJson: false,
  toJson: false,
)
abstract class ItemListMarble with _$ItemListMarble {
  const factory ItemListMarble.renderItems() = ItemListRenderItems;

  const factory ItemListMarble.showShimmer() = ItemListShowShimmer;

  const factory ItemListMarble.showNetworkError() = ItemListShowNetworkError;

  const factory ItemListMarble.showGenericError() = ItemListShowGenericError;
}

class ItemListState extends Equatable {
  final ItemListMarble page;

  const ItemListState({
    this.page = const ItemListMarble.showShimmer(),
  });

  ItemListState copyWith({
    ItemListMarble? page,
  }) {
    return ItemListState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
