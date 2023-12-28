import 'package:dexquiz/demo/grocery.dart';
import 'package:flutter/material.dart';

class GroceriesWidget extends StatelessWidget {
  const GroceriesWidget(
    this.groceries, {
    required this.onEditPressed,
    required this.onDeletePressed,
    super.key,
  });

  final List<Grocery> groceries;
  final Function(Grocery) onEditPressed;
  final Function(Grocery) onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: groceries.length,
        itemBuilder: (_, index) {
          return _ItemWidget(
            groceries[index],
            onDeletePressed: onDeletePressed,
            onEditPressed: onEditPressed,
          );
        });
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget(
    this.grocery, {
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  final Grocery grocery;
  final Function(Grocery) onEditPressed;
  final Function(Grocery) onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(grocery.item),
        subtitle: Row(
          children: [
            Text(grocery.quantity.toString()),
            const SizedBox(width: 5),
            Text(grocery.metrics.toString())
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => onEditPressed(grocery),
            ),
            // Delete button
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => onDeletePressed(grocery),
            )
          ],
        ),
      ),
    );
  }
}
