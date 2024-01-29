import 'package:cache/src/cache_system/cache_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mocktail/mocktail.dart';

@HiveType(typeId: 1)
class TestEntity extends BoxEntity {
  @HiveField(2)
  final String name;

  TestEntity({
    required this.name,
  }) : super(cachedTimestamp: 0, key: name);
}

class TestDBCache extends DBCache<TestEntity> {
  TestDBCache(super.box);

  @override
  Duration get timeToLive => const Duration(milliseconds: 300);
}

class MockedBox<T> extends Mock implements Box<T> {
  void mockValues(List<T> expected) {
    when(() => values).thenReturn(expected);
  }

  void mockGet({T? expected}) {
    when(() => get(any<dynamic>())).thenReturn(expected);
  }

  void mockPut({required T expected}) {
    when(() => put(any<dynamic>(), expected)).thenAnswer((_) async {});
  }

  void mockPutAll(Map<dynamic, T> expected) {
    when(() => putAll(expected)).thenAnswer((_) async {});
  }

  void mockDelete() {
    when(() => delete(any<dynamic>())).thenAnswer((_) async {});
  }

  void mockDeleteAll() {
    when(clear).thenAnswer((_) async {
      return 0;
    });
  }
}

void main() {
  group(DBCache, () {
    late TestDBCache testDBCache;

    late MockedBox<TestEntity> mockedBox;

    setUp(() async {
      mockedBox = MockedBox();

      testDBCache = TestDBCache(mockedBox);
    });

    group('all', () {
      test('should filtered un expired entries', () async {
        final entities = [
          TestEntity(name: 'John'),
          TestEntity(name: 'Doe'),
          TestEntity(name: 'Jane'),
        ];

        mockedBox.mockPut(expected: entities[0]);
        mockedBox.mockPut(expected: entities[1]);
        mockedBox.mockPut(expected: entities[2]);
        mockedBox.mockDelete();
        mockedBox.mockValues(entities);

        await testDBCache.put(entities[0]);
        await Future.delayed(const Duration(milliseconds: 200));
        await testDBCache.put(entities[1]);
        await Future.delayed(const Duration(milliseconds: 200));
        await testDBCache.put(entities[2]);
        final result = await testDBCache.all;

        verify(() => mockedBox.delete(any())).called(1);
        expect(result.length, 2);
      });
    });

    group('get', () {
      test('should return null when there is no cache data', () async {
        mockedBox.mockGet(expected: null);
        mockedBox.mockDelete();

        final result = await testDBCache.get('John');

        verify(() => mockedBox.get(any())).called(1);
        expect(result, isNull);
      });

      test('should return null and delete when cache is expired', () async {
        final testEntity = TestEntity(name: 'John');
        mockedBox.mockPut(expected: testEntity);
        mockedBox.mockGet(expected: testEntity);
        mockedBox.mockDelete();

        await testDBCache.put(testEntity);
        await Future.delayed(const Duration(milliseconds: 301));
        final result = await testDBCache.get('John');

        verify(() => mockedBox.delete(any())).called(1);
        expect(result, isNull);
      });

      test('should not delete when cache is not expired', () async {
        final testEntity = TestEntity(name: 'John');
        mockedBox.mockPut(expected: testEntity);
        mockedBox.mockGet(expected: testEntity);
        mockedBox.mockDelete();

        await testDBCache.put(testEntity);
        final result = await testDBCache.get('John');

        verifyNever(() => mockedBox.delete(any()));
        expect(result, testEntity);
      });
    });

    group('put', () {
      test('should insert the entities correctly', () async {
        final testEntity = TestEntity(name: 'John');
        mockedBox.mockPut(expected: testEntity);
        mockedBox.mockDelete();

        await testDBCache.put(testEntity);

        verify(() => mockedBox.put(any(), testEntity)).called(1);
      });
    });

    group('putAll', () {
      test('should insert the all entities correctly', () async {
        final entities = [
          TestEntity(name: 'John'),
          TestEntity(name: 'Doe'),
          TestEntity(name: 'Jane'),
        ];
        final map = {
          'John': entities[0],
          'Doe': entities[1],
          'Jane': entities[2],
        };
        mockedBox.mockPutAll(map);

        await testDBCache.putAll(entities);

        verify(() => mockedBox.putAll(map)).called(1);
      });
    });

    group('delete', () {
      test('should delete the entities', () async {
        final testEntity = TestEntity(name: 'John');
        mockedBox.mockDelete();

        await testDBCache.delete(testEntity.key);

        verify(() => mockedBox.delete(any())).called(1);
      });
    });

    group('delete all', () {
      test('should delete all entities', () async {
        mockedBox.mockDeleteAll();

        await testDBCache.deleteAll();

        verify(() => mockedBox.clear()).called(1);
      });
    });
  });
}
