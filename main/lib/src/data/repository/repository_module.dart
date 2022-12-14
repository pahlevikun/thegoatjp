import 'package:thegoatjp/src/data/mapper/gutendex_mapper.dart';
import 'package:thegoatjp/src/data/repository/gutendex_repository.dart';
import 'package:thegoatjp/src/data/source/remote/remote_gateway.dart';
import 'package:thegoatjp/src/h.dart';

@module
abstract class RepositoryModule {
  @Singleton()
  GutendexRepository provideGutendexRepository(
    RemoteGateway remoteGateway,
    GutendexMapper mapper,
  ) {
    return UserRepositoryImpl(
      remoteGateway,
      mapper,
    );
  }
}
