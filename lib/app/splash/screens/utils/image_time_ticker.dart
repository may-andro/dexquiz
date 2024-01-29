import 'dart:async';

import 'package:core/core.dart';
import 'package:dexquiz/app/splash/screens/utils/build_flavor_extension.dart';

class ImageTimeTicker {
  ImageTimeTicker(BuildConfig buildConfig) {
    _imagePaths = buildConfig.buildFlavor.images;
  }

  late final List<String> _imagePaths;

  int _imagePathsIndex = 0;

  Stream<String> tick() {
    return Stream.periodic(
      const Duration(milliseconds: 300),
      (_) {
        if (_imagePathsIndex + 1 == _imagePaths.length) {
          _imagePathsIndex = 0;
        } else {
          _imagePathsIndex = _imagePathsIndex + 1;
        }
        return _imagePaths[_imagePathsIndex];
      },
    );
  }
}
