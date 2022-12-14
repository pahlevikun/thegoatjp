import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart_ext/rxdart_ext.dart';
import 'package:thegoatjp/src/domain/contract/gutendex_repository_contract.dart';
import 'package:thegoatjp/src/domain/entity/book_entity.dart';
import 'package:thegoatjp/src/domain/entity/book_query.dart';
import 'package:thegoatjp/src/domain/usecase/fetch_book_list_usecase.dart';

import 'fetch_book_list_usecase_test.mocks.dart';

@GenerateMocks([GutendexRepository])
void main() {
  group('FetchBookListUseCase Test', () {
    late GutendexRepository _repository;
    late FetchBookListUseCase useCase;

    setUp(() {
      _repository = MockGutendexRepository();
      useCase = FetchBookListUseCase(_repository);
    });

    test('Success fetch the books', () {
      // GIVEN
      final emptyBook = BookEntity.empty();
      final result = Single.value(emptyBook);

      // WHEN
      when(_repository.fetchBooks()).thenAnswer((inv) => result);

      // THEN
      useCase.execute(BookQuery()).listen((value) { });

      // verify the mock repository was called
      verify(_repository.fetchBooks()).called(1);
      verifyNoMoreInteractions(_repository);
    });
  });
}
