import 'package:thegoatjp/src/h.dart';

export 'bloc/book_details_bloc.dart';
export 'view/book_details_page.dart';

@module
abstract class BookDetails {
  @factory
  BookDetailsBloc provideBookDetailsBloc() {
    return BookDetailsBloc();
  }
}
