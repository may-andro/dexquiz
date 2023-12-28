import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:dexquiz/demo/grocery.dart';
import 'package:flutter/material.dart';

class GroceryFormWidget extends StatelessWidget {
  GroceryFormWidget({
    required this.formKey,
    required this.itemController,
    required this.qtyController,
    required this.onSavePressed,
    required this.onExitPressed,
    this.grocery,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController itemController;
  final TextEditingController qtyController;
  final Grocery? grocery;
  final Function(Grocery) onSavePressed;
  final VoidCallback onExitPressed;

  final List<String> metrics = ["kg", "ltr", "gram", "dozen", "nos"];
  final StreamController<String?> metricStreamController = StreamController();
  String? selectedMetric;

  @override
  Widget build(BuildContext context) {
    if (grocery != null) {
      itemController.text = grocery!.item;
      qtyController.text = grocery!.quantity.toString();
      metricStreamController.sink.add(grocery!.metrics);
    }

    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(context.space(factor: 2)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: itemController,
              validator: (value) {
                if (value!.isEmpty) return "Required Field";
                return null;
              },
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: qtyController,
              validator: (value) {
                if (value!.isEmpty) return "Required Field";
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Quantity'),
            ),
            const SizedBox(height: 20),
            StreamBuilder<String?>(
                stream: metricStreamController.stream,
                builder: (context, snapshot) {
                  return DropdownButtonFormField(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0.0),
                        ),
                      ),
                    ),
                    hint: const Text("Select Metrics"),
                    value: snapshot.hasData ? snapshot.data : null,
                    onChanged: (metric) {
                      metricStreamController.sink.add(metric);
                      selectedMetric = metric;
                    },
                    validator: (value) {
                      if (value == null) return "Field is empty";
                      return null;
                    },
                    items: metrics.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  );
                }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onExitPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Exit"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {

                      final grocery = Grocery(
                        item: itemController.text,
                        quantity: int.parse(qtyController.text),
                        metrics: selectedMetric ?? metrics[0],
                      );
                      onSavePressed(grocery);
                    }
                  },
                  child: Text(grocery == null ? 'Create New' : 'Update'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
