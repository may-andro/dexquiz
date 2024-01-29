import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_builder/src/data/service/remote_client_service.dart';

class MockRemoteClientService extends Mock implements RemoteClientService {
  void mockGetApiCall(Response expected) {
    when(() => getApiCall(
          any(),
          queryParameters: any(named: 'queryParameters'),
        )).thenAnswer((_) async => expected);
  }

  void mockGetApiCallException(Exception expected) {
    when(() => getApiCall(
          any(),
          queryParameters: any(named: 'queryParameters'),
        )).thenThrow(expected);
  }
}
