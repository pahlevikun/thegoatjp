import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:thegoatjp/src/h.dart';

part 'gutendex_api_service.g.dart';

@RestApi(baseUrl: BuildConfig.BASE_URL)
abstract class GutendexApiService {
  factory GutendexApiService(Dio dio, {String baseUrl}) = _GutendexApiService;
}
