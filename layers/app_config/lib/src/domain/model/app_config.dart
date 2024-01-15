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

  @JsonKey(name: 'theme_code')
  final String themeCode;
  @JsonKey(name: 'minimum_required_app_version')
  final String minimumRequiredAppVersion;
  @JsonKey(name: 'pokedex_start_entry')
  final int pokedexStartEntry;
  @JsonKey(name: 'pokedex_end_entry')
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
