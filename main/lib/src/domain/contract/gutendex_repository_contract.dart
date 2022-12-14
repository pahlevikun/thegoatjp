import 'package:rxdart_ext/single.dart';
import 'package:thegoatjp/src/h.dart';

abstract class GutendexRepository {
  Single<BookEntity> fetchBooks({
    num? page,
    String? keyword,
    String? topic,
  });
}
