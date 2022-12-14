import 'package:thegoatjp/src/h.dart';

part 'item_list_event.freezed.dart';

@Freezed(
  copyWith: false,
  toStringOverride: false,
  fromJson: false,
  toJson: false,
  when: FreezedWhenOptions(
    when: false,
    whenOrNull: false,
    maybeWhen: false,
  ),
  map: FreezedMapOptions(
    map: false,
    mapOrNull: false,
    maybeMap: false,
  ),
)
abstract class ItemListEvent with _$ItemListEvent {
  const factory ItemListEvent.ready({String? subject}) = ItemListReady;
  const factory ItemListEvent.search({required String keyword}) = ItemListSearch;
  const factory ItemListEvent.loadMore() = ItemListLoadMore;
}
