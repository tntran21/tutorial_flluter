import 'package:dio/dio.dart';

class ApiUtils {
  late Dio _dio;

  ApiUtils._internal() {
    // Base options for the Dio instance
    _dio = Dio(
      BaseOptions(
        baseUrl:
            'https://jsonplaceholder.typicode.com', // Replace with your API base URL
        connectTimeout: const Duration(seconds: 10), // Connection timeout
        receiveTimeout: const Duration(seconds: 10), // Response timeout
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Add interceptors for logging, token handling, etc.
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add any headers or logic before the request is sent
        return handler.next(options); // Continue
      },
      onResponse: (response, handler) {
        // Log response or modify data if needed
        return handler.next(response); // Continue
      },
      onError: (DioException e, handler) {
        // Handle errors globally
        return handler.next(e); // Continue
      },
    ));
  }

  // Singleton pattern
  static final ApiUtils instance = ApiUtils._internal();

  // Get Dio instance
  Dio get dio => _dio;

  // Generic GET request
  // Generic GET request
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get(
        endpoint,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Generic POST request
  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post(
        endpoint,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Other methods like PUT, DELETE, etc.
  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
