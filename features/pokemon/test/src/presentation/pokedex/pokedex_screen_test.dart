import 'package:dependency_injector/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/module_configurator.dart';
import 'package:pokemon/src/presentation/base/base.dart';
import 'package:pokemon/src/presentation/screens/pokedex/pokedex_screen.dart';
import 'package:pokemon/src/presentation/screens/pokedex/pokedex_view_model.dart';

import '../../../mock/domain/model/test_pokemon.dart';
import '../../../mock/presentation/pokedex/mock_pokedex_view_model.dart';
import '../../../utils/test_widget_wrapper.dart';

class MockServiceLocator extends Mock implements ServiceLocator {
  void mockGet<T extends Object>(T expected) {
    when(() => get<T>()).thenReturn(expected);
  }
}

void main() {
  group(PokedexScreen, () {
    late Widget widget;

    late MockPokedexViewModel mockPokedexViewModel;

    setUp(() {
      mockPokedexViewModel = MockPokedexViewModel();
      pokemonServiceLocator = MockServiceLocator();
      when(() => pokemonServiceLocator.get<PokedexViewModel>()).thenReturn(
        mockPokedexViewModel,
      );

      widget = const TestWidgetWrapper(child: PokedexScreen());
    });

    group('loading state', () {
      testWidgets('', (tester) async {
        mockPokedexViewModel.mockOnInit();
        mockPokedexViewModel.mockViewState(ViewState.loading);

        await tester.pumpWidget(widget);
        await tester.pump(const Duration(milliseconds: 1));

        expect(find.byKey(Key('pokedex_title_widget')), findsOneWidget);
        expect(find.byKey(Key('loading_state_widget')), findsOneWidget);
      });
    });

    group('error state', () {
      testWidgets('', (tester) async {
        mockPokedexViewModel.mockOnInit();
        mockPokedexViewModel.mockViewState(ViewState.error);
        mockPokedexViewModel.mockErrorMessage('Failed: Error');

        await tester.pumpWidget(widget);
        await tester.pump(const Duration(milliseconds: 1));

        expect(find.byKey(Key('pokedex_title_widget')), findsOneWidget);
        expect(find.byKey(Key('error_state_widget')), findsOneWidget);
      });
    });

    group('success state', () {
      setUp(() {
        mockPokedexViewModel.mockOnInit();
        mockPokedexViewModel.mockViewState(ViewState.success);
      });

      testWidgets('', (tester) async {
        mockPokedexViewModel.mockPokemons([testPokemon]);

        await tester.pumpWidget(widget);
        await tester.pump(const Duration(milliseconds: 1));

        expect(find.byKey(Key('pokedex_title_widget')), findsOneWidget);
        expect(find.byKey(Key('success_state_widget')), findsOneWidget);
      });

      testWidgets('', (tester) async {
        mockPokedexViewModel.mockPokemons([]);

        await tester.pumpWidget(widget);
        await tester.pump(const Duration(milliseconds: 1));

        expect(find.byKey(Key('pokedex_title_widget')), findsOneWidget);
        expect(find.byKey(Key('empty_success_state_widget')), findsOneWidget);
      });
    });
  });
}
