import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:pokedex_builder/src/data/service/remote_client_service.dart';
import 'package:pokedex_builder/src/exception/exceptions.dart';
import 'package:test/test.dart';

const _baseUrl = 'https://example.com';

void main() {
  group(RemoteClientService, () {
    late Dio dio;
    late DioAdapter dioAdapter;

    late RemoteClientService remoteClientService;

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: _baseUrl));
      dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;

      remoteClientService = RemoteClientService(dio);
    });

    group('getApiCall', () {
      test('should return response when the status code is 20x', () async {
        const path = '/pokemon';
        const response = {'message': 'Success'};
        dioAdapter.onGet(
          path,
          (request) => request.reply(200, response),
          queryParameters: {},
          headers: {},
        );

        final result = await remoteClientService.getApiCall(path);

        expect(result.data, response);
      });

      test(
          'should return $ServerFailureException'
          ' when the status code is not 40x', () async {
        const path = '/pokemon';
        const response = {'message': 'error'};
        dioAdapter.onGet(
          path,
          (request) => request.reply(400, response),
          queryParameters: {},
          headers: {},
        );

        expect(
          remoteClientService.getApiCall(path),
          throwsA(isA<ServerFailureException>()),
        );
      });

      test(
          'should return $ServerFailureException'
          ' when the status code is not 50x', () async {
        const path = '/pokemon';
        const response = {'message': 'error'};
        dioAdapter.onGet(
          path,
          (request) => request.reply(500, response),
          queryParameters: {},
          headers: {},
        );

        expect(
          remoteClientService.getApiCall(path),
          throwsA(isA<ServerFailureException>()),
        );
      });

      test('should throw $ServerFailureException when there is timeout', () {
        const path = '/pokemon';
        dioAdapter.onGet(
          path,
          (server) => server.throws(
            408,
            DioException.connectionTimeout(
                timeout: Duration(microseconds: 1),
                requestOptions: RequestOptions()),
          ),
          queryParameters: {},
          headers: {},
        );

        expect(
          remoteClientService.getApiCall(path),
          throwsA(isA<ServerFailureException>()),
        );
      });
    });
  });
}
