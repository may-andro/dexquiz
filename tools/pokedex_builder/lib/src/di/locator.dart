import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_builder/src/command/build_command.dart';
import 'package:pokedex_builder/src/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_builder/src/data/mapper/pokemon_model_entity_mapper.dart';
import 'package:pokedex_builder/src/data/repository/pokedex_repository_impl.dart';
import 'package:pokedex_builder/src/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex_builder/src/data/service/remote_client_service.dart';
import 'package:pokedex_builder/src/domain/repository/pokedex_repository.dart';
import 'package:pokedex_builder/src/domain/repository/pokemon_repository.dart';
import 'package:pokedex_builder/src/domain/use_case/use_case.dart';

GetIt locator = GetIt.instance;

void setUpDI() {
  _addDioToDI();
  _addServicesToDI();
  _addDataSourceToDI();
  _addMapperToDI();
  _addRepositoriesToDI();
  _addUseCasesToDI();
  _addCommandsToDI();
}

void _addDioToDI() {
  final dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));
  locator.registerSingleton<Dio>(dio);
}

void _addServicesToDI() {
  locator.registerSingleton<RemoteClientService>(
    RemoteClientService(
      locator<Dio>(),
    ),
  );
}

void _addDataSourceToDI() {
  locator.registerSingleton<PokemonDataSource>(
    PokemonDataSourceImpl(
      locator<RemoteClientService>(),
    ),
  );
}

void _addMapperToDI() {
  locator.registerSingleton<PokemonModelEntityMapper>(
    PokemonModelEntityMapper(),
  );
}

void _addRepositoriesToDI() {
  locator.registerSingleton<PokemonRepository>(
    PokemonRepositoryImpl(
      locator<PokemonDataSource>(),
      locator<PokemonModelEntityMapper>(),
    ),
  );

  locator.registerSingleton<PokedexRepository>(
    PokedexRepositoryImpl(),
  );
}

void _addUseCasesToDI() {
  locator.registerFactory<FetchPokedexUseCase>(
    () => FetchPokedexUseCase(
      locator<PokedexRepository>(),
      locator<PokemonRepository>(),
    ),
  );

  locator.registerFactory<CreateFirestoreCollectionUseCase>(
    () => CreateFirestoreCollectionUseCase(),
  );

  locator.registerFactory<CreateFirestoreCollectionFileUseCase>(
    () => CreateFirestoreCollectionFileUseCase(),
  );
}

void _addCommandsToDI() {
  locator.registerFactory<CreateCommand>(
    () => CreateCommand(
      locator<FetchPokedexUseCase>(),
      locator<CreateFirestoreCollectionUseCase>(),
      locator<CreateFirestoreCollectionFileUseCase>(),
    ),
  );
}
