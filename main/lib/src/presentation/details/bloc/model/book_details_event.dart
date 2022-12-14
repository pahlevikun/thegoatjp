import 'package:thegoatjp/src/h.dart';

part 'book_details_event.freezed.dart';

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
abstract class BookDetailsEvent with _$BookDetailsEvent {
  const factory BookDetailsEvent.ready({required BookItemEntity book}) =
      BookDetailsReady;
}
