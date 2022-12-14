import 'package:thegoatjp/src/data/source/remote/service/model/response/book_list_response.dart';
import 'package:thegoatjp/src/h.dart';

@Singleton()
class GutendexMapper {
  List<BookEntity> transformBookList(BookListResponse? response) {
    return response?.results?.map((e) => transformBookItem(e)).toList() ??
        List.empty();
  }

  BookEntity transformBookItem(BookResultData data) {
    return BookEntity(
      id: data.id.orZero(),
      title: data.title.orEmpty(),
      authors: data.authors?.map((e) => transformBookAuthor(e)).toList() ??
          List.empty(),
      subjects: data.subjects ?? List.empty(),
      bookshelves: data.bookshelves ?? List.empty(),
      languages: data.languages ?? List.empty(),
      copyright: data.copyright.orFalse(),
      mediaType: data.mediaType.orEmpty(),
      downloadCount: data.downloadCount.orZero(),
    );
  }

  BookAuthorEntity transformBookAuthor(BookResultAuthor data) {
    return BookAuthorEntity(
      name: data.name.orEmpty(),
      birthYear: data.birthYear.orZero(),
      deathYear: data.deathYear.orZero(),
    );
  }
}
