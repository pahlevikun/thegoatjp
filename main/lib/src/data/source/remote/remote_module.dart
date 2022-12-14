import 'package:thegoatjp/src/data/source/remote/remote_gateway.dart';
import 'package:thegoatjp/src/data/source/remote/service/gutendex_api_service.dart';
import 'package:thegoatjp/src/h.dart';

@module
abstract class RemoteModule {
  @Singleton()
  RemoteGateway provideRemoteGateway(GutendexApiService gutendexApiService) =>
      RemoteGateway(gutendexApiService);
}
