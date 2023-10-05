import 'package:json_annotation/json_annotation.dart';

part 'remote_official_artwork.g.dart';

@JsonSerializable()
class RemoteOfficialArtwork {
  RemoteOfficialArtwork({this.frontDefault});

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  factory RemoteOfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$RemoteOfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOfficialArtworkToJson(this);
}
