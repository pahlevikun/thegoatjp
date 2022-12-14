import 'package:rxdart_ext/single.dart';
import 'package:thegoatjp/src/data/source/remote/service/gutendex_api_service.dart';
import 'package:thegoatjp/src/data/source/remote/service/model/response/book_list_response.dart';

class RemoteGateway {
  final GutendexApiService _gutendexApiService;

  RemoteGateway(
    this._gutendexApiService,
  );

  Single<BookListResponse> getBooks({
    num? page,
    String? keyword,
    String? topic,
  }) {
    return Single.fromFuture(
      _gutendexApiService.getBooks(page: page, topic: topic, keyword: keyword),
    );
  }
}
