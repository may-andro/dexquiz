import 'package:dependency_injector/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/module_configurator.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_screen.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';

import '../../../mock/domain/model/test_pokemon.dart';
import '../../../mock/presentation/pokemon/mock_pokemon_view_model.dart';
import '../../../utils/test_widget_wrapper.dart';

class MockServiceLocator extends Mock implements ServiceLocator {}

void main() {
  group(PokemonScreen, () {
    late Widget widget;

    late MockPokemonViewModel mockPokemonViewModel;

    setUp(() {
      mockPokemonViewModel = MockPokemonViewModel();
      pokemonServiceLocator = MockServiceLocator();
      when(() => pokemonServiceLocator.get<PokemonViewModel>()).thenReturn(
        mockPokemonViewModel,
      );

      mockPokemonViewModel.mockOnInit();
      mockPokemonViewModel.mockPokemons(testPokemon);
      mockPokemonViewModel.mockErrorMessage(null);
      mockPokemonViewModel.mockDescription(null);

      widget = TestWidgetWrapper(
          child: PokemonScreen(
        pokemon: testPokemon,
      ));
    });

    group('mobile view', () {
      testWidgets('should show mobile view', (tester) async {
        tester.view.physicalSize = const Size(480, 720);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(widget);
        await tester.pump();

        expect(find.byKey(Key('mobile_widget')), findsOneWidget);
        expect(find.byKey(Key('tablet_widget')), findsNothing);
        expect(find.byKey(Key('desktop_widget')), findsNothing);
      });

      testWidgets('should display pokemon info, image, and index',
          (tester) async {
        tester.view.physicalSize = const Size(480, 720);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(widget);
        await tester.pump();

        expect(find.byKey(Key('pokemon_index_widget')), findsOneWidget);
        expect(find.byKey(Key('pokemon_image_widget')), findsOneWidget);
        expect(find.byKey(Key('pokemon_info_card')), findsOneWidget);
        expect(find.text(testPokemon.name), findsOneWidget);
      });

      testWidgets('should display shimmer effect if description is null',
          (tester) async {
        tester.view.physicalSize = const Size(480, 720);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(widget);
        await tester.pump();

        expect(find.byKey(Key('shimmer_widget')), findsOneWidget);
        expect(find.byKey(Key('description_widget')), findsNothing);
      });

      testWidgets('should display description is not null', (tester) async {
        tester.view.physicalSize = const Size(480, 720);
        tester.view.devicePixelRatio = 1.0;

        mockPokemonViewModel.mockDescription('expected');

        await tester.pumpWidget(widget);
        await tester.pump();

        expect(find.byKey(Key('shimmer_widget')), findsNothing);
        expect(find.byKey(Key('description_widget')), findsOneWidget);
      });
    });

    group('tablet and desktop view', () {
      testWidgets('should show tablet view', (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(widget);
        await tester.pump();

        expect(find.byKey(Key('mobile_widget')), findsNothing);
        expect(find.byKey(Key('tablet_widget')), findsOneWidget);
        expect(find.byKey(Key('desktop_widget')), findsNothing);
      });

      testWidgets('should show desktop view', (tester) async {
        tester.view.physicalSize = const Size(1920, 1080);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(widget);
        await tester.pump();

        expect(find.byKey(Key('mobile_widget')), findsNothing);
        expect(find.byKey(Key('tablet_widget')), findsNothing);
        expect(find.byKey(Key('desktop_widget')), findsOneWidget);
      });

      testWidgets('should display pokemon info, image, and index',
          (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(widget);
        await tester.pump();

        expect(find.byKey(Key('pokemon_index_widget')), findsOneWidget);
        expect(find.byKey(Key('pokemon_image_widget')), findsOneWidget);
        expect(find.byKey(Key('pokemon_info_card')), findsOneWidget);
      });

      testWidgets('should display shimmer effect if description is null',
          (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(widget);
        await tester.pump();

        expect(find.byKey(Key('shimmer_widget')), findsOneWidget);
        expect(find.byKey(Key('description_widget')), findsNothing);
      });

      testWidgets('should display description is not null', (tester) async {
        tester.view.physicalSize = const Size(800, 1200);
        tester.view.devicePixelRatio = 1.0;

        mockPokemonViewModel.mockDescription('expected');

        await tester.pumpWidget(widget);
        await tester.pump();

        expect(find.byKey(Key('shimmer_widget')), findsNothing);
        expect(find.byKey(Key('description_widget')), findsOneWidget);
      });
    });

    group('error snack-bar', () {
      testWidgets('should display error message if not null', (tester) async {
        tester.view.physicalSize = const Size(480, 720);
        tester.view.devicePixelRatio = 1.0;

        mockPokemonViewModel.mockErrorMessage('expected');

        await tester.pumpWidget(widget);
        await tester.pump();

        expect(find.byKey(Key('snack_bar_widget')), findsOneWidget);
      });

      testWidgets('should display error message if not null', (tester) async {
        tester.view.physicalSize = const Size(480, 720);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(widget);
        await tester.pump();

        expect(find.byKey(Key('snack_bar_widget')), findsNothing);
      });
    });
  });
}
