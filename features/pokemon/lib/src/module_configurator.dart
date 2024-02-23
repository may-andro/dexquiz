import 'dart:async';

import 'package:app_config/app_config.dart';
import 'package:cache/cache.dart';
import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:firebase/firebase.dart';
import 'package:pokemon/src/data/data.dart';
import 'package:pokemon/src/data/entity/local/captured_cache_entity.dart';
import 'package:pokemon/src/data/entity/local/color_cache_entity.dart';
import 'package:pokemon/src/data/entity/local/description_cache_entity.dart';
import 'package:pokemon/src/data/entity/local/favorite_cache_entity.dart';
import 'package:pokemon/src/data/entity/local/pokemon_cache_entity.dart';
import 'package:pokemon/src/data/entity/local/stat_cache_entity.dart';
import 'package:pokemon/src/data/repository/pokemon/cached_pokemon_repository.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:pokemon/src/domain/repository/repository.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';
import 'package:remote/remote.dart';
import 'presentation/screens/pokedex/pokedex_view_model.dart';

late ServiceLocator pokemonServiceLocator;

class FeaturePokemonModuleConfigurator implements ModuleConfigurator {
  const FeaturePokemonModuleConfigurator();

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) async {}

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) async {}

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) async {
    pokemonServiceLocator = serviceLocator;

    /// Cache
    final hive = serviceLocator.get<HiveInterface>();

    hive.registerAdapter(CapturedCacheEntityAdapter());
    final capturedBox = await hive.openBox<CapturedCacheEntity>(
      'captured_box',
    );
    serviceLocator.registerSingleton(
      () => CapturedCache(capturedBox),
    );

    hive.registerAdapter(FavoriteCacheEntityAdapter());
    final favoriteBox = await hive.openBox<FavoriteCacheEntity>(
      'favorite_box',
    );
    serviceLocator.registerSingleton(
      () => FavoriteCache(favoriteBox),
    );

    hive.registerAdapter(DescriptionCacheEntityAdapter());
    final descriptionBox = await hive.openBox<DescriptionCacheEntity>(
      'description_box',
    );
    serviceLocator.registerSingleton(
      () => DescriptionCache(descriptionBox),
    );

    hive.registerAdapter(ColorCacheEntityAdapter());
    final colorBox = await hive.openBox<ColorCacheEntity>(
      'color_box',
    );
    serviceLocator.registerSingleton(
      () => ColorCache(colorBox),
    );

    hive.registerAdapter(StatCacheEntityAdapter());
    hive.registerAdapter(PokemonCacheEntityAdapter());
    final pokemonBox = await hive.openBox<PokemonCacheEntity>(
      'pokemon_box',
    );
    serviceLocator.registerSingleton(
      () => PokemonCache(pokemonBox),
    );

    /// Repository
    final remotePokemonRepository = RemotePokemonRepository(
      serviceLocator.get<RestApiService>(),
    );
    final firebasePokemonRepository = FirebasePokemonRepository(
      serviceLocator.get<GetDocumentUseCase>(),
    );
    final cachedPokemonRepository = CachedPokemonRepository(
      serviceLocator.get<PokemonCache>(),
      serviceLocator.get<DescriptionCache>(),
      serviceLocator.get<ColorCache>(),
    );
    final pokemonRepositoryImpl = PokemonRepositoryImpl(
      firebasePokemonRepository,
      remotePokemonRepository,
      cachedPokemonRepository,
    );

    serviceLocator.registerSingleton<PokemonRepository>(
      () => pokemonRepositoryImpl,
    );

    serviceLocator.registerSingleton<CapturedPokemonRepository>(
      () => CapturedPokemonRepositoryImpl(
        serviceLocator.get<CapturedCache>(),
      ),
    );

    serviceLocator.registerSingleton<FavoritePokemonRepository>(
      () => FavoritePokemonRepositoryImpl(
        serviceLocator.get<FavoriteCache>(),
      ),
    );

    /// Use Case
    serviceLocator.registerFactory<AddToCapturedUseCase>(
      () => AddToCapturedUseCase(
        serviceLocator.get<CapturedPokemonRepository>(),
      ),
    );

    serviceLocator.registerFactory<IsCapturedUseCase>(
      () => IsCapturedUseCase(
        serviceLocator.get<CapturedPokemonRepository>(),
      ),
    );

    serviceLocator.registerFactory<FetchCapturedPokemonsUseCase>(
      () => FetchCapturedPokemonsUseCase(
        serviceLocator.get<CapturedPokemonRepository>(),
      ),
    );

    serviceLocator.registerFactory<AddToFavoritesUseCase>(
      () => AddToFavoritesUseCase(
        serviceLocator.get<FavoritePokemonRepository>(),
      ),
    );

    serviceLocator.registerFactory<IsFavoriteUseCase>(
      () => IsFavoriteUseCase(
        serviceLocator.get<FavoritePokemonRepository>(),
      ),
    );

    serviceLocator.registerFactory<RemoveFavoritesUseCase>(
      () => RemoveFavoritesUseCase(
        serviceLocator.get<FavoritePokemonRepository>(),
      ),
    );

    serviceLocator.registerFactory<FetchFavoritePokemonsUseCase>(
      () => FetchFavoritePokemonsUseCase(
        serviceLocator.get<FavoritePokemonRepository>(),
      ),
    );

    serviceLocator.registerFactory<FetchPokedexUseCase>(
      () => FetchPokedexUseCase(
        serviceLocator.get<PokemonRepository>(),
        serviceLocator.get<FetchFavoritePokemonsUseCase>(),
        serviceLocator.get<FetchCapturedPokemonsUseCase>(),
      ),
    );

    serviceLocator.registerFactory<FetchPokemonUseCase>(
      () => FetchPokemonUseCase(
        serviceLocator.get<PokemonRepository>(),
      ),
    );

    serviceLocator.registerFactory<GenerateQuizOptionUseCase>(
      () => GenerateQuizOptionUseCase(),
    );

    serviceLocator.registerFactory<FetchRandomPokemonUseCase>(
      () => FetchRandomPokemonUseCase(
        serviceLocator.get<AppConfig>(),
        serviceLocator.get<FetchPokemonUseCase>(),
      ),
    );

    serviceLocator.registerFactory<FetchDescriptionUseCase>(
      () => FetchDescriptionUseCase(
        serviceLocator.get<PokemonRepository>(),
      ),
    );

    serviceLocator.registerFactory<FetchColorUseCase>(
      () => FetchColorUseCase(
        serviceLocator.get<PokemonRepository>(),
      ),
    );

    /// View Model
    serviceLocator.registerFactory<PokedexViewModel>(
      () => PokedexViewModel(
        serviceLocator.get<FetchPokedexUseCase>(),
        serviceLocator.get<BuildConfig>(),
      ),
    );

    serviceLocator.registerFactory<PokemonViewModel>(
      () => PokemonViewModel(
        serviceLocator.get<AddToFavoritesUseCase>(),
        serviceLocator.get<RemoveFavoritesUseCase>(),
        serviceLocator.get<IsFavoriteUseCase>(),
        serviceLocator.get<FetchDescriptionUseCase>(),
        serviceLocator.get<FetchColorUseCase>(),
      ),
    );

    serviceLocator.registerFactory<QuizViewModel>(
      () => QuizViewModel(
        serviceLocator.get<FetchRandomPokemonUseCase>(),
        serviceLocator.get<GenerateQuizOptionUseCase>(),
        serviceLocator.get<AddToCapturedUseCase>(),
      ),
    );
  }
}
