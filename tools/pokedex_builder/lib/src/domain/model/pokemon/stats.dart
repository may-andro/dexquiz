import 'package:json_annotation/json_annotation.dart';

part 'stats.g.dart';

@JsonSerializable()
class Stats {
  Stats(
    this.baseStat,
    this.effort,
    this.name,
    this.url,
  );

  @JsonKey(name: 'base_stat')
  final int baseStat;

  @JsonKey(name: 'effort')
  final int effort;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);

  Map<String, dynamic> toFirestoreCollectionJson() {
    return {
      'mapValue': {
        'fields': {
          'base_stat': {'integerValue': baseStat.toString()},
          'effort': {'integerValue': effort.toString()},
          'name': {'stringValue': name},
          'url': {'stringValue': url},
        },
      },
    };
  }
}
