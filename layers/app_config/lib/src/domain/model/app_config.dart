import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig extends Equatable {
  AppConfig(
    this.themeCode,
    this.minimumRequiredAppVersion,
    this.pokedexStartEntry,
    this.pokedexEndEntry,
  );

  final String themeCode;
  final String minimumRequiredAppVersion;
  final int pokedexStartEntry;
  final int pokedexEndEntry;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);

  @override
  List<Object?> get props => [
        themeCode,
        minimumRequiredAppVersion,
        pokedexStartEntry,
        pokedexEndEntry,
      ];
}
