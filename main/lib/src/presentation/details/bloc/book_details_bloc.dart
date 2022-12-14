import 'package:thegoatjp/src/h.dart';
import 'package:thegoatjp/src/presentation/details/bloc/book_details_bloc.dart';

export 'package:thegoatjp/src/presentation/details/bloc/book_details_bloc.dart';
export 'package:thegoatjp/src/presentation/details/bloc/model/book_details_event.dart';
export 'package:thegoatjp/src/presentation/details/bloc/model/book_details_state.dart';

class BookDetailsBloc extends BaseGoatBloc<BookDetailsEvent, BookDetailsState> {
  BookDetailsBloc() : super(const BookDetailsState());
}
