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
  const factory ItemListMarble.renderItems({
    List<BookItemEntity>? books,
    bool? isFinish,
  }) = ItemListRenderItems;

  const factory ItemListMarble.showShimmer() = ItemListShowShimmer;

  const factory ItemListMarble.showNetworkError() = ItemListShowNetworkError;

  const factory ItemListMarble.showGenericError() = ItemListShowGenericError;

  const factory ItemListMarble.showEmptyError() = ItemListShowEmptyError;
}

class ItemListState extends Equatable {
  final ItemListMarble page;
  final String? title;

  const ItemListState({
    this.page = const ItemListMarble.showShimmer(),
    this.title,
  });

  ItemListState copyWith({
    ItemListMarble? page,
    String? title,
  }) {
    return ItemListState(
      page: page ?? this.page,
      title: title ?? this.title,
    );
  }

  @override
  List<Object> get props => [page, page];
}
