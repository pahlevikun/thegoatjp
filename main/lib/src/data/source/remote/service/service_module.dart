import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:thegoatjp/src/data/source/remote/service/dio_logger.dart';
import 'package:thegoatjp/src/data/source/remote/service/gutendex_api_service.dart';
import 'package:thegoatjp/src/h.dart';

@module
abstract class ServiceModule {
  @factory
  GutendexApiService provideGutendexApiService(
    Dio dio,
    @Named("base_url") String baseUrl,
  ) {
    return GutendexApiService(
      dio,
      baseUrl: baseUrl,
    );
  }

  @Singleton()
  Alice provideAlice(
    @Named("build_mode") bool shouldActive,
  ) {
    return Alice(
      showNotification: shouldActive,
      showInspectorOnShake: shouldActive,
    );
  }

  @Singleton()
  @Named("dio_generic")
  Dio provideDio(
    BaseOptions baseOptions,
    @Named("build_mode") bool shouldShowLogger,
    DioLogger dioLogger,
    Alice alice,
  ) {
    final dio = Dio(baseOptions);
    if (shouldShowLogger) {
      dio.interceptors.add(alice.getDioInterceptor());
      dio.interceptors.add(dioLogger);
    }
    return dio;
  }

  @Singleton()
  @Named("dio_refresh_token")
  Dio provideDioRefreshToken(
    BaseOptions baseOptions,
    @Named("build_mode") bool shouldShowLogger,
    DioLogger dioLogger,
    Alice alice,
  ) {
    final dio = Dio(baseOptions);
    if (shouldShowLogger) {
      dio.interceptors.add(alice.getDioInterceptor());
      dio.interceptors.add(dioLogger);
    }
    return dio;
  }

  @Singleton()
  DioLogger provideDioLogger() {
    return DioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    );
  }

  @Singleton()
  BaseOptions provideDioBaseOptions(
    @Named("base_url") String baseUrl,
    @Named("headers") Map<String, String> headers,
    @Named("connect_time_out") int connectTimeOut,
    @Named("read_time_out") int readTimeOut,
  ) {
    return BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: connectTimeOut,
      receiveTimeout: readTimeOut,
    );
  }

  @Named("headers")
  Future<Map<String, String>> provideHeaders() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String code = packageInfo.buildNumber;
    String package = packageInfo.packageName;

    return {
      "Accept": "application/json",
      "x_app_version": version,
      "x_app_buildnumber": code,
      "x_package": package,
      "x_platform": Platform.isAndroid
          ? "android"
          : Platform.isIOS
              ? "iOS"
              : "unknown",
    };
  }

  @Singleton()
  @Named("base_url")
  String provideBaseUrl() => BuildConfig.BASE_URL;

  @Singleton()
  @Named("read_time_out")
  int get readTimeOut => 15000;

  @Singleton()
  @Named("connect_time_out")
  int get connectTimeOut => 15000;
}
