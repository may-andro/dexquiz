import 'package:dio/dio.dart';
import 'package:pokedex_builder/src/exception/exceptions.dart';

class RemoteClientService {
  RemoteClientService(this._dio);

  final Dio _dio;

  Future<Response> getApiCall(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw ServerFailureException(
        e.message,
        responseStatusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw UnknownServerFailureException();
    }
  }
}
