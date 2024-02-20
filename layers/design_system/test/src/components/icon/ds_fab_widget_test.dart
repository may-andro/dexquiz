import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../utils/alchemist_utils.dart';

void main() {
  groupGoldenForBrightnessAndDS(
    'fab Widget',
    _getConfigs,
  );
}

List<TestCase> _getConfigs(DSTheme dsTheme) {
  final imageType = DSFabImage('assets/images/pokeball.png');
  final iconType = DSFabIcon(Icons.add);

  final list = <TestCase>[];
  for (final contentType in [imageType, iconType]) {
    for (final fabSize in DSFabSize.values) {
      list.add(
        TestCase(
          'contentType:${contentType.runtimeType} fabSize:$fabSize',
          DSFabWidget(
            fabType: contentType,
            fabSize: fabSize,
          ),
        ),
      );
    }
  }
  return list;
}
