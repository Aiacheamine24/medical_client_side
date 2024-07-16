import 'package:dio/dio.dart';
import 'package:medical_client_side/core/network/internet_checker.dart';

abstract interface class Networking {
  /// This method is used to send a GET request.
  ///
  /// The [path] parameter is the URL path.
  /// The [queryParameters] parameter is the query parameters.
  /// The [options] parameter is the request options.
  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// This method is used to send a POST request.
  ///
  /// The [path] parameter is the URL path.
  /// The [data] parameter is the request data.
  /// The [queryParameters] parameter is the query parameters.
  /// The [options] parameter is the request options.
  Future<Response> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// This method is used to send a PUT request.
  ///
  /// The [path] parameter is the URL path.
  /// The [data] parameter is the request data.
  /// The [queryParameters] parameter is the query parameters.
  /// The [options] parameter is the request options.
  Future<Response> put({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// This method is used to send a DELETE request.
  ///
  /// The [path] parameter is the URL path.
  /// The [data] parameter is the request data.
  /// The [queryParameters] parameter is the query parameters.
  /// The [options] parameter is the request options.
  Future<Response> delete({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

class NetworkingImpl implements Networking {
  final Dio dio;

  /// The constructor of the class.
  ///
  /// The [dio] parameter is the Dio instance.
  NetworkingImpl({required this.dio});

  @override
  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.get(
      path,
      queryParameters: queryParameters ?? {},
      options: options ?? Options(),
    );
  }

  @override
  Future<Response> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (await checkInternetConnection()) {
      return await dio.post(
        path,
        data: data,
        queryParameters: queryParameters ?? {},
        options: options ?? Options(),
      );
    } else {
      throw Exception('No internet connection');
    }
  }

  @override
  Future<Response> put({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.put(
      path,
      data: data,
      queryParameters: queryParameters ?? {},
      options: options ?? Options(),
    );
  }

  @override
  Future<Response> delete({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (await checkInternetConnection()) {
      return await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters ?? {},
        options: options ?? Options(),
      );
    } else {
      throw Exception('No internet connection');
    }
  }
}
