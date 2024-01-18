import 'package:core/core.dart';

extension BuildFlavorMapper on BuildFlavor {
  List<String> get images {
    switch (this) {
      case BuildFlavor.kanto:
        return [
          'assets/images/eevee_1.png',
          'assets/images/eevee_2.png',
          'assets/images/eevee_3.png',
          'assets/images/eevee_4.png',
        ];
      case BuildFlavor.johto:
        return [
          'assets/images/eevee_1.png',
          'assets/images/eevee_5.png',
          'assets/images/eevee_6.png',
        ];
    }
  }
}
