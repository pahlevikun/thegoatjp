import 'package:thegoatjp/src/data/source/remote/remote_gateway.dart';
import 'package:thegoatjp/src/h.dart';

class UserRepositoryImpl implements GutendexRepository {
  final RemoteGateway remoteGateway;

  UserRepositoryImpl(this.remoteGateway);
}
