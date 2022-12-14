import 'package:thegoatjp/src/h.dart';

export 'bloc/intermediary_bloc.dart';
export 'view/intermediary_page.dart';

@module
abstract class Intermediary {
  @factory
  IntermediaryBloc provideIntermediaryBloc() {
    return IntermediaryBloc();
  }
}

