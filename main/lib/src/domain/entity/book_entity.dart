import 'package:thegoatjp/src/h.dart';

class BookEntity {
  List<BookItemEntity> books;
  num count;

  BookEntity({
    required this.books,
    required this.count,
  });

  static BookEntity empty() => BookEntity(
        books: [],
        count: 0,
      );
}
