import 'package:dexquiz/app/splash/screens/bloc/image_ticker_bloc.dart';
import 'package:dexquiz/app/splash/screens/utils/image_time_ticker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockImageTimeTicker extends Mock implements ImageTimeTicker {}

void main() {
  group(ImageTickerBloc, () {
    late ImageTickerBloc imageTickerBloc;

    late MockImageTimeTicker mockImageTimeTicker;

    setUp(() {
      mockImageTimeTicker = MockImageTimeTicker();

      imageTickerBloc = ImageTickerBloc(mockImageTimeTicker);
    });

    test('should emit $ImageTickerState with initial state on start', () async {
      expect(imageTickerBloc.state, ImageTickerState.initial());
    });

    blocTest(
      'should emit $ImageTickerState when $StartTickerEvent event received',
      build: () => imageTickerBloc,
      setUp: () {
        when(
          () => mockImageTimeTicker.tick(),
        ).thenAnswer(
          (_) => Stream.fromIterable(['1', '2', '3']),
        );
      },
      act: (bloc) => bloc.add(const StartTickerEvent()),
      expect: () => <ImageTickerState>[
        const ImageTickerState('1'),
        const ImageTickerState('2'),
        const ImageTickerState('3'),
      ],
    );
  });
}
