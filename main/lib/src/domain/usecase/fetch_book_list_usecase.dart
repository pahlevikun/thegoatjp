import 'package:rxdart_ext/rxdart_ext.dart';
import 'package:thegoatjp/src/domain/contract/usecase.dart';
import 'package:thegoatjp/src/h.dart';

@Singleton()
class FetchBookListUseCase
    extends UseCase<BookQuery, Single<BookEntity>> {
  final GutendexRepository _repository;

  FetchBookListUseCase(
    this._repository,
  );

  @override
  Single<BookEntity> execute(BookQuery param) {
    return _repository.fetchBooks(
      page: param.page,
      keyword: param.keyword,
      topic: param.topic,
    );
  }
}
