import 'package:thegoatjp/src/h.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseGoatBloc<Event, State> extends Bloc<Event, State> {
  BaseGoatBloc(State initialState) : super(initialState);
  final compositeSubscription = CompositeSubscription();

  @override
  Future<void> close() async {
    compositeSubscription.clear();
    super.close();
  }
}
