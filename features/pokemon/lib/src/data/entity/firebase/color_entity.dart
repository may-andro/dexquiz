import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'color_entity.g.dart';

@JsonSerializable()
class ColorEntity extends Equatable {
  const ColorEntity(
    this.primary,
    this.secondary,
  );

  factory ColorEntity.fromJson(Map<String, dynamic> json) =>
      _$ColorEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ColorEntityToJson(this);

  @JsonKey(name: 'primary')
  final String primary;

  @JsonKey(name: 'secondary')
  final String secondary;

  @override
  List<Object?> get props => [primary, secondary];
}
