import 'package:thegoatjp/src/h.dart';

export 'intermediary_bloc.dart';
export 'model/intermediary_event.dart';
export 'model/intermediary_state.dart';

class IntermediaryBloc extends BaseGoatBloc<IntermediaryEvent, IntermediaryState> {
  IntermediaryBloc() : super(const IntermediaryState()) {
    on<IntermediaryRouteNavigation>(_mapEventReady);
  }

  _mapEventReady(
      IntermediaryRouteNavigation event,
    Emitter<IntermediaryState> emitter,
  ) {
    // TODO: Put logic for routing to specific page here
    emit(state.copyWith(page: const IntermediaryMarble.navigateToListItem()));
  }
}
