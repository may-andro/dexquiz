import 'package:cache/cache.dart';

part 'grocery.g.dart';

@HiveType(typeId: 1)
class Grocery extends BoxEntity {
  @HiveField(2)
  final String item;
  @HiveField(3)
  final int quantity;
  @HiveField(4)
  final String metrics;

  Grocery({
    required this.item,
    required this.quantity,
    required this.metrics,
  }) : super(cachedTimestamp: 0, key: item);
}
