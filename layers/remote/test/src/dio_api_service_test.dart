import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:remote/src/dio_api_service.dart';
import 'package:remote/src/remote_exception.dart';

const _baseUrl = 'https://example.com';

void main() {
  group(DioApiService, () {
    late DioApiService dioApiService;
    late DioAdapter dioAdapter;
    late Dio dio;

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: _baseUrl));
      dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;

      dioApiService = DioApiService(dio);
    });

    group('get', () {
      test(
        'should return response when the dio status code is 20x',
        () async {
          const path = '/pokemon';
          const response = {'message': 'Success'};
          dioAdapter.onGet(
            path,
            (request) => request.reply(200, response),
          );

          final result = await dioApiService.get<Map<String, dynamic>>(path);

          expect(result, isNotNull);
          expect(result, response);
        },
      );

      test(
        'should return $ApiAuthenticationException'
        ' when the dio status code 401',
        () async {
          const path = '/pokemon';
          const response = {'message': 'error'};
          dioAdapter.onGet(
            path,
            (request) => request.reply(401, response),
          );

          expect(
            dioApiService.get(path),
            throwsA(isA<ApiAuthenticationException>()),
          );
        },
      );

      test(
        'should return $ApiClientException'
        ' when the dio status code is not 404',
        () async {
          const path = '/pokemon';
          const response = {'message': 'error'};
          dioAdapter.onGet(
            path,
            (request) => request.reply(404, response),
          );

          expect(
            dioApiService.get(path),
            throwsA(isA<ApiClientException>()),
          );
        },
      );

      test(
        'should return $ApiClientException'
        ' when the dio status code is not 500',
        () async {
          const path = '/pokemon';
          const response = {'message': 'error'};
          dioAdapter.onGet(
            path,
            (request) => request.reply(500, response),
          );

          expect(
            dioApiService.get(path),
            throwsA(isA<ApiServerException>()),
          );
        },
      );

      test(
        'should return $ApiConnectionTimeoutException'
        ' when the dio error is ${DioExceptionType.sendTimeout}',
        () async {
          const path = '/pokemon';
          const type = DioExceptionType.sendTimeout;
          dioAdapter.onGet(
            path,
            (request) => request.throws(
              200,
              DioException(requestOptions: RequestOptions(), type: type),
            ),
          );

          expect(
            () async => await dioApiService.get(path),
            throwsA(isA<ApiConnectionTimeoutException>()),
          );
        },
      );

      test(
        'should return $ApiUnknownException'
        ' when the dio error is unknown',
        () async {
          const path = '/pokemon';
          dioAdapter.onGet(
            path,
            (request) => request.throws(
              200,
              DioException(requestOptions: RequestOptions()),
            ),
          );

          expect(
            () async => await dioApiService.get(path),
            throwsA(isA<ApiUnknownException>()),
          );
        },
      );
    });

    group('post', () {
      test(
        'should return response when the dio status code is 20x',
        () async {
          const path = '/pokemon';
          const response = {'message': 'Success Post'};
          dioAdapter.onPost(
            path,
            (request) => request.reply(201, response),
          );

          final result = await dioApiService.post(path);

          expect(result, response);
        },
      );

      test(
        'should return $ApiAuthenticationException'
        ' when the dio status code 401',
        () async {
          const path = '/pokemon';
          const response = {'message': 'error'};
          dioAdapter.onPost(
            path,
            (request) => request.reply(401, response),
          );

          expect(
            dioApiService.post(path),
            throwsA(isA<ApiAuthenticationException>()),
          );
        },
      );

      test(
        'should return $ApiClientException'
        ' when the dio status code is not 404',
        () async {
          const path = '/pokemon';
          const response = {'message': 'error'};
          dioAdapter.onPost(
            path,
            (request) => request.reply(404, response),
          );

          expect(
            dioApiService.post(path),
            throwsA(isA<ApiClientException>()),
          );
        },
      );

      test(
        'should return $ApiServerException'
        ' when the dio status code is not 500',
        () async {
          const path = '/pokemon';
          const response = {'message': 'error'};
          dioAdapter.onPost(
            path,
            (request) => request.reply(500, response),
          );

          expect(
            dioApiService.post(path),
            throwsA(isA<ApiServerException>()),
          );
        },
      );

      test(
        'should return $ApiConnectionTimeoutException'
        ' when the dio error is ${DioExceptionType.sendTimeout}',
        () async {
          const path = '/pokemon';
          const type = DioExceptionType.sendTimeout;

          dioAdapter.onPost(
            path,
            (request) => request.throws(
              200,
              DioException(requestOptions: RequestOptions(), type: type),
            ),
          );

          expect(
            () async => await dioApiService.post(path),
            throwsA(isA<ApiConnectionTimeoutException>()),
          );
        },
      );

      test(
        'should return $ApiUnknownException'
        ' when the dio error is unknown',
        () async {
          const path = '/pokemon';

          dioAdapter.onPost(
            path,
            (request) => request.throws(
              200,
              DioException(requestOptions: RequestOptions()),
            ),
          );

          expect(
            () async => await dioApiService.post(path),
            throwsA(isA<ApiUnknownException>()),
          );
        },
      );
    });
  });
}
