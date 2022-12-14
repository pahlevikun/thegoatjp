import 'package:thegoatjp/src/h.dart';

part 'intermediary_event.freezed.dart';

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
abstract class IntermediaryEvent with _$IntermediaryEvent {
  const factory IntermediaryEvent.routeNavigation() = IntermediaryRouteNavigation;
}
