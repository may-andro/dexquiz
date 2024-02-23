import 'package:design_system/src/components/atoms/images/ds_asset_image_widget.dart';
import 'package:design_system/src/theme/theme.dart';
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
            'assets/images/pokeball.png',
            width: width,
            height: height,
          ),
        ),
      );
    }
  }
  return list;
}
