import 'package:thegoatjp/src/h.dart';

part 'item_list_event.freezed.dart';

@Freezed(
  copyWith: false,
  toStringOverride: false,
  fromJson: false,
  toJson: false,
)
abstract class ItemListEvent with _$ItemListEvent {
  const factory ItemListEvent.ready() = ItemListReady;
}
