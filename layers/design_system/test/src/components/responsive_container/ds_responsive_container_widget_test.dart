import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/test_wrapper_widget.dart';

class _TestWidget extends StatelessWidget {
  const _TestWidget();

  @override
  Widget build(BuildContext context) {
    return DSResponsiveContainerWidget(
      mobileBuilder: (BuildContext context) {
        return DSTextWidget(
          key: const Key('mobile'),
          'Mobile Version',
          color: context.colorPalette.brand.primary,
          style: context.typography.titleMedium,
        );
      },
      tabletBuilder: (BuildContext context) {
        return DSTextWidget(
          key: const Key('tablet'),
          'Tablet Version',
          color: context.colorPalette.brand.secondary,
          style: context.typography.titleMedium,
        );
      },
      desktopBuilder: (BuildContext context) {
        return DSTextWidget(
          key: const Key('desktop'),
          'Desktop Version',
          color: context.colorPalette.brand.tertiary,
          style: context.typography.titleMedium,
        );
      },
    );
  }
}

void main() {
  group(DSResponsiveContainerWidget, () {
    testWidgets('should show mobile version', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(320, 480);

      const testWidget = TestWidgetWrapper(
        brightness: Brightness.light,
        designSystem: DesignSystem.fire,
        child: _TestWidget(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('mobile')),
        findsOneWidget,
      );
    });

    testWidgets('should show tablet version', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;

      const testWidget = TestWidgetWrapper(
        brightness: Brightness.light,
        designSystem: DesignSystem.fire,
        child: _TestWidget(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('tablet')),
        findsOneWidget,
      );
    });

    testWidgets('should show desktop version', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;

      const testWidget = TestWidgetWrapper(
        brightness: Brightness.light,
        designSystem: DesignSystem.fire,
        child: _TestWidget(),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('desktop')),
        findsOneWidget,
      );
    });
  });
}
