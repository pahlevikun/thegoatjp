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
  Single<List<BookEntity>> fetchBooks({required num page}) {
    return _remoteGateway.getBooks(page).map((event) {
      return _mapper.transformBookList(event);
    });
  }
}
