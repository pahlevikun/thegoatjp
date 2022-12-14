import 'package:thegoatjp/src/h.dart';

class BookItemEntity {
  num id;
  String title;
  List<BookAuthorEntity> authors;
  List<String> subjects;
  List<String> bookshelves;
  List<String> languages;
  bool copyright;
  String mediaType;
  num downloadCount;
  String cover;

  BookItemEntity({
    required this.id,
    required this.title,
    required this.authors,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.downloadCount,
    required this.cover,
  });
}
