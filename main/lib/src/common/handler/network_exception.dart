import 'package:dio/dio.dart';
import 'package:thegoatjp/src/h.dart';

part 'network_exception.freezed.dart';

@freezed
abstract class NetworkException with _$NetworkException {
  const factory NetworkException.requestCancelled() = RequestCancelled;

  const factory NetworkException.unknownError(
      int? serverCode,
      String? message,
      ) = UnknownError;

  const factory NetworkException.connectionTimeout() = ConnectionTimeout;

  const factory NetworkException.sendTimeout() = SendTimeout;

  const factory NetworkException.receiveTimeout() = ReceiveTimeout;

  const factory NetworkException.noInternetConnection() = NoInternetConnection;

  const factory NetworkException.unProcessableEntity(
      int? serverCode,
      ExceptionResponse? response,
      ) = UnProcessableEntity;

  const factory NetworkException.badRequest(
      int? serverCode,
      ExceptionResponse? response,
      ) = BadRequest;

  const factory NetworkException.unAuthorized(
      int? serverCode,
      ExceptionResponse? response,
      ) = UnAuthorized;

  const factory NetworkException.conflicted(
      int? serverCode,
      ExceptionResponse? response,
      ) = Conflicted;

  const factory NetworkException.serverError(
      int? serverCode,
      ExceptionResponse? response,
      ) = ServerError;

  const factory NetworkException.rateLimit(
      int? serverCode,
      ExceptionResponse? response,
      ) = RateLimit;

  const factory NetworkException.forbidden(
      int? serverCode,
      ExceptionResponse? response,
      ) = Forbidden;

  static NetworkException getDioException(error) {
    if (error is DioError) {
      final errorType = error.type;
      if (errorType == DioErrorType.cancel) {
        return const NetworkException.requestCancelled();
      } else if (errorType == DioErrorType.connectTimeout) {
        return const NetworkException.connectionTimeout();
      } else if (errorType == DioErrorType.sendTimeout) {
        return const NetworkException.sendTimeout();
      } else if (errorType == DioErrorType.receiveTimeout) {
        return const NetworkException.receiveTimeout();
      } else if (errorType == DioErrorType.response) {
        final serverCode = error.response?.statusCode ?? 0;
        final errorResponse = error.response?.data;
        if (serverCode == 400) {
          return NetworkException.badRequest(
            serverCode,
            ExceptionResponse.fromJson(errorResponse),
          );
        } else if (serverCode == 401) {
          return NetworkException.unAuthorized(
            serverCode,
            ExceptionResponse.fromJson(errorResponse),
          );
        } else if (serverCode == 403) {
          return NetworkException.forbidden(
            serverCode,
            ExceptionResponse.fromJson(errorResponse),
          );
        } else if (serverCode == 409) {
          return NetworkException.conflicted(
            serverCode,
            ExceptionResponse.fromJson(errorResponse),
          );
        } else if (serverCode == 500) {
          return NetworkException.serverError(
            serverCode,
            ExceptionResponse.fromJson(errorResponse),
          );
        } else if (serverCode == 503) {
          return NetworkException.serverError(
            serverCode,
            ExceptionResponse.fromJson(errorResponse),
          );
        } else {
          return NetworkException.unknownError(
            serverCode,
            errorResponse?.message,
          );
        }
      } else if (errorType == DioErrorType.other) {
        return const NetworkException.noInternetConnection();
      }
    } else if (error is SocketException || error is NetworkException) {
      return const NetworkException.noInternetConnection();
    } else if (error is Error) {
      // TODO: Please map this to error
      return const NetworkException.unknownError(
        null,
        null,
      );
    } else {
      // TODO: Please map this to exception
      return const NetworkException.unknownError(
        null,
        null,
      );
    }
    // TODO: Please map this to exception
    return const NetworkException.unknownError(
      null,
      null,
    );
  }

  static String getErrorMessage(NetworkException networkExceptions) {
    var errorMessage = "Something wrong happens";
    networkExceptions.when(
      requestCancelled: () {
        errorMessage = "request cancelled";
      },
      unknownError: (
          int? serverCode,
          String? message,
          ) {
        errorMessage = message ?? "unknown error";
      },
      connectionTimeout: () {
        errorMessage = "connection timeout";
      },
      sendTimeout: () {
        errorMessage = "send timeout";
      },
      receiveTimeout: () {
        errorMessage = "receive timeout";
      },
      noInternetConnection: () {
        errorMessage = "no internet connection";
      },
      badRequest: (
          int? serverCode,
          ExceptionResponse? response,
          ) {
        errorMessage = response?.exception?.description ?? "bad request";
      },
      unProcessableEntity: (
          int? serverCode,
          ExceptionResponse? response,
          ) {
        errorMessage =
            response?.exception?.description ?? "unprocessable entity";
      },
      unAuthorized: (
          int? serverCode,
          ExceptionResponse? response,
          ) {
        errorMessage = response?.exception?.description ?? "unauthorized";
      },
      conflicted: (
          int? serverCode,
          ExceptionResponse? response,
          ) {
        errorMessage = response?.exception?.description ?? "conflicted";
      },
      serverError: (
          int? serverCode,
          ExceptionResponse? response,
          ) {
        errorMessage = response?.exception?.description ?? "server error";
      },
      rateLimit: (
          int? serverCode,
          ExceptionResponse? response,
          ) {
        errorMessage = response?.exception?.description ?? "rate limit";
      },
      forbidden: (
          int? serverCode,
          ExceptionResponse? response,
          ) {
        errorMessage = response?.exception?.description ?? "forbidden";
      },
    );
    return errorMessage;
  }
}
