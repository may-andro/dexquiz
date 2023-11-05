import 'package:flutter_test/flutter_test.dart';

void main() {
  group({{name.pascalCase()}}, () {

    late {{name.pascalCase()}} {{name.camelCase()}};

    late {{repository.pascalCase()}} {{repository.camelCase()}};

    setUp(() {
      {{repository.camelCase()}} = Mock{{repository.pascalCase()}}();

      {{name.camelCase()}} = {{name.pascalCase()}}({{repository.camelCase()}});
    });

    tearDown(() {});

    group('call', () {
      test('TEST NAME', () {
        expect(true, isFalse, reason: 'You forgot to add the tests!');
      });
    });
  });
}