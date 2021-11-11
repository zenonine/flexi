import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../index.dart';

void main() {
  group('Given container width 0', () {
    testWidgets('Flex value should be "xs/sm"', (WidgetTester tester) async {
      setPhysicalSize(tester, Size.zero);
      await tester.pumpWidget(const _TestApp());
      expect(find.text('xs/sm'), findsOneWidget);
    });
  });

  group('Given container width 100', () {
    testWidgets('Flex value should be "xs/sm"', (WidgetTester tester) async {
      setPhysicalSize(tester, const Size.square(100));
      await tester.pumpWidget(const _TestApp());
      expect(find.text('xs/sm'), findsOneWidget);
    });
  });

  group('Given container width 200', () {
    testWidgets('Flex value should be "md/lg"', (WidgetTester tester) async {
      setPhysicalSize(tester, const Size.square(200));
      await tester.pumpWidget(const _TestApp());
      expect(find.text('md/lg'), findsOneWidget);
    });
  });

  group('Given container width 300', () {
    testWidgets('Flex value should be "md/lg"', (WidgetTester tester) async {
      setPhysicalSize(tester, const Size.square(300));
      await tester.pumpWidget(const _TestApp());
      expect(find.text('md/lg'), findsOneWidget);
    });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: FlexContainer(
          layout: const TestLayout(),
          child: FlexWidget(
            startWidget: (_) => const Text('xs/sm'),
            flexWidgets: {
              TestBreakpointId.md: (_) => const Text('md/lg'),
            },
          ),
        ),
      );
}
