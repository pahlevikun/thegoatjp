import 'package:rxdart_ext/single.dart';
import 'package:thegoatjp/src/h.dart';

abstract class GutendexRepository {

  Single<List<BookEntity>> fetchBooks({required num page});
}
