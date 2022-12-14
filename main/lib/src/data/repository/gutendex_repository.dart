import 'package:rxdart_ext/single.dart';
import 'package:thegoatjp/src/data/mapper/gutendex_mapper.dart';
import 'package:thegoatjp/src/data/source/remote/remote_gateway.dart';
import 'package:thegoatjp/src/h.dart';

class UserRepositoryImpl implements GutendexRepository {
  final RemoteGateway _remoteGateway;
  final GutendexMapper _mapper;

  UserRepositoryImpl(
    this._remoteGateway,
    this._mapper,
  );

  @override
  Single<BookEntity> fetchBooks({
    num? page,
    String? keyword,
    String? topic,
  }) {
    return _remoteGateway
        .getBooks(page: page, keyword: keyword, topic: topic)
        .map((event) => _mapper.transformBookEntity(event));
  }
}
