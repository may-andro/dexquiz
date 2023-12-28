import 'package:dexquiz/demo/clear_grocery_cache.dart';
import 'package:dexquiz/demo/groceries_widget.dart';
import 'package:dexquiz/demo/grocery.dart';
import 'package:dexquiz/demo/grocery_cache.dart';
import 'package:dexquiz/demo/grocery_form_widget.dart';
import 'package:flutter/material.dart';

class GroceriesScreen extends StatefulWidget {
  const GroceriesScreen(
    this.groceryCache,
    this.clearGroceryCache, {
    super.key,
  });

  final GroceryCache groceryCache;
  final ClearGroceryCache clearGroceryCache;

  @override
  State<GroceriesScreen> createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  final _formGlobalKey = GlobalKey<FormState>();
  late final TextEditingController _itemController;
  late final TextEditingController _qtyController;

  @override
  void initState() {
    _itemController = TextEditingController();
    _qtyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _itemController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groceries Memo"),
        actions: [
          FutureBuilder(
            future: widget.clearGroceryCache.get(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return IconButton(
                  onPressed: () {
                    widget.groceryCache.deleteAll();
                  },
                  icon: const Icon(Icons.delete),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Grocery>>(
        future: widget.groceryCache.all,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isEmpty
                ? buildEmptyState
                : buildSuccessState(snapshot.data!);
          }
          if (snapshot.hasError) {
            return buildErrorState;
          }
          return buildLoadingState;
        },
      ),
      floatingActionButton: buildFAB,
    );
  }

  Widget get buildLoadingState {
    return const CircularProgressIndicator();
  }

  Widget get buildEmptyState {
    return const Center(child: Text("No Data"));
  }

  Widget get buildErrorState {
    return const Center(child: Text("Oops something went wrong!"));
  }

  Widget buildSuccessState(List<Grocery> groceries) {
    return GroceriesWidget(
      groceries,
      onEditPressed: (grocery) => _showForm(grocery),
      onDeletePressed: (grocery) {
        widget.groceryCache.delete(grocery.key);
        setState(() {});
      },
    );
  }

  Widget get buildFAB {
    return FloatingActionButton(
      onPressed: () => _showForm(null),
      child: const Icon(Icons.add),
    );
  }

  void _showForm(Grocery? grocery) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: GroceryFormWidget(
            formKey: _formGlobalKey,
            itemController: _itemController,
            qtyController: _qtyController,
            grocery: grocery,
            onSavePressed: (grocery) {
              Navigator.of(context).pop();
              widget.groceryCache.put(grocery);
              setState(() {
                _itemController.clear();
                _qtyController.clear();
              });
            },
            onExitPressed: Navigator.of(context).pop,
          ),
        );
      },
    );
  }
}
