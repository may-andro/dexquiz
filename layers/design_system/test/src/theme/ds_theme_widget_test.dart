import 'package:design_system/src/design_systems/design_systems.dart';
import 'package:design_system/src/extensions/build_context_extension.dart';
import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_wrapper_widget.dart';

class _TestWidget extends StatelessWidget {
  const _TestWidget();

  @override
  Widget build(BuildContext context) {
    final color = context.theme.colorPalette.brand.primary.color;
    return Text('Find me', style: TextStyle(color: color));
  }
}

void main() {
  group(DSThemeBuilderWidget, () {
    testWidgets('should able to access $DSTheme via $DSThemeBuilderWidget',
        (WidgetTester tester) async {
      const testWidget = TestWidgetWrapper(
        brightness: Brightness.light,
        designSystem: DesignSystem.fire,
        child: _TestWidget(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pump();

      final finder = find.textContaining('Find me');
      final Text widget = tester.widget(finder);
      expect(widget.style?.color, isNotNull);
      expect(widget.style?.color?.value, 0xFF805600);
    });
  });
}
