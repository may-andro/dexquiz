import 'dart:convert';

import 'package:design_system/src/components/atoms/images/ds_asset_image_widget.dart';
import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/alchemist_utils.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  groupGoldenForBrightnessAndDS(
    'Asset Image Widget',
    _getConfigs,
  );
}

List<TestCase> _getConfigs(DSTheme dsTheme) {
  final list = <TestCase>[];
  for (final width in [null, 200.0, 300.0]) {
    for (final height in [null, 200.0, 300.0]) {
      list.add(
        TestCase(
          'width:$width height:$height',
          DSAssetImageWidget(
            'assets/images/type_bug.png',
            width: width,
            height: height,
          ),
        ),
      );
    }
  }
  return list;
}

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    if (key == 'resources/test') {
      return ByteData.sublistView(utf8.encode('Hello World!'));
    }
    return ByteData(0);
  }
}
