import 'package:thegoatjp/src/data/repository/gutendex_repository.dart';
import 'package:thegoatjp/src/data/source/remote/remote_gateway.dart';
import 'package:thegoatjp/src/h.dart';

@module
abstract class RepositoryModule {
  @Singleton()
  GutendexRepository provideGutendexRepository(
    RemoteGateway remoteGateway,
  ) {
    return UserRepositoryImpl(
      remoteGateway,
    );
  }
}
