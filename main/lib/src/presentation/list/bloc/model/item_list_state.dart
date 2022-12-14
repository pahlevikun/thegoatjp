import 'package:thegoatjp/src/h.dart';

part 'item_list_state.freezed.dart';

@Freezed(
  toStringOverride: false,
  fromJson: false,
  toJson: false,
  map: FreezedMapOptions(
    map: false,
    mapOrNull: false,
    maybeMap: false,
  ),
)
abstract class ItemListMarble with _$ItemListMarble {
  const factory ItemListMarble.renderItems({List<BookItemEntity>? books}) =
      ItemListRenderItems;

  const factory ItemListMarble.showShimmer() = ItemListShowShimmer;

  const factory ItemListMarble.showNetworkError() = ItemListShowNetworkError;

  const factory ItemListMarble.showGenericError() = ItemListShowGenericError;

  const factory ItemListMarble.showEmptyError() = ItemListShowEmptyError;
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
