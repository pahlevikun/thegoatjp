import 'package:rxdart_ext/rxdart_ext.dart';
import 'package:thegoatjp/src/domain/contract/usecase.dart';
import 'package:thegoatjp/src/h.dart';

@Singleton()
class FetchBookListUseCase extends UseCase<num, Single<List<BookEntity>>> {
  final GutendexRepository _repository;

  FetchBookListUseCase(
    this._repository,
  );

  @override
  Single<List<BookEntity>> execute(num param) {
    return _repository.fetchBooks(page: param);
  }
}
