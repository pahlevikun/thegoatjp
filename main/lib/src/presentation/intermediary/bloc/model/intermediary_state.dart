import 'package:thegoatjp/src/h.dart';

part 'intermediary_state.freezed.dart';

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
abstract class IntermediaryMarble with _$IntermediaryMarble {
  const factory IntermediaryMarble.pure() = IntermediaryPure;
  const factory IntermediaryMarble.navigateToListItem() = IntermediaryRenderItems;
  // TODO: Put other navigation to other page here
}

class IntermediaryState extends Equatable {
  final IntermediaryMarble page;

  const IntermediaryState({
    this.page = const IntermediaryMarble.pure(),
  });

  IntermediaryState copyWith({
    IntermediaryMarble? page,
  }) {
    return IntermediaryState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
