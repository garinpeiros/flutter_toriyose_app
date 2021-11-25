import 'dart:async';

import 'package:dio/dio.dart';
import 'package:toriyose_app/config/constant.dart';
import 'package:toriyose_app/model/request_model.dart';

class RequestUtil {
  static final RequestUtil _instance = RequestUtil._internal();

  factory RequestUtil() => _instance;

  late Dio dio;

  RequestUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: serverApiUrl,
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options); //continue
      },
      onResponse: (Response response, handler) {
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        return handler.next(e);
      },
    ));

    /*
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    */
  }

  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    try {
      Options requestOptions = options ?? Options();

      BaseRequestModel base = BaseRequestModel(
        format: 'json',
        applicationId: appId,
        affiliateId: affiliateId,
      );

      if (params != null) {
        params.addAll(base.toMap());
      } else {
        params = base.toMap();
      }

      var response = await dio.get(
        path,
        queryParameters: params,
        options: requestOptions,
      );

      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return ErrorEntity(code: -1, message: 'NETWORK_CANCEL');
        }
      case DioErrorType.connectTimeout:
        {
          return ErrorEntity(code: -1, message: "CONNECT_TIMEOUT");
        }

      case DioErrorType.sendTimeout:
        {
          return ErrorEntity(code: -1, message: "SEND_TIMEOUT");
        }

      case DioErrorType.receiveTimeout:
        {
          return ErrorEntity(code: -1, message: "RECEIVE_TIMEOUT");
        }
      case DioErrorType.response:
        {
          try {
            int? errCode = error.response?.statusCode;
            if (errCode == null) {
              return ErrorEntity(code: -2, message: error.message);
            }
            switch (errCode) {
              case 400:
                {
                  return ErrorEntity(code: errCode, message: "400");
                }
              case 401:
                {
                  return ErrorEntity(code: errCode, message: "401");
                }

              case 403:
                {
                  return ErrorEntity(code: errCode, message: "403");
                }

              case 404:
                {
                  return ErrorEntity(code: errCode, message: "404");
                }

              case 405:
                {
                  return ErrorEntity(code: errCode, message: "405");
                }

              case 500:
                {
                  return ErrorEntity(code: errCode, message: "500");
                }

              case 502:
                {
                  return ErrorEntity(code: errCode, message: "502");
                }

              case 503:
                {
                  return ErrorEntity(code: errCode, message: "503");
                }

              case 505:
                {
                  return ErrorEntity(code: errCode, message: "505");
                }

              default:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response?.statusMessage ?? '');
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "OTHER_ERROR");
          }
        }

      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }
}

class ErrorEntity implements Exception {
  int code;
  String? message;
  ErrorEntity({required this.code, this.message});

  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}
