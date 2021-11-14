import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../index.dart';

// Cannot mock context.flexi method (constructor and extension method)
// => testing is integrated in the context of real widgets.
void main() {
  final flexValue1 = FlexValue<TestBreakpointId, String>(
    (_) => 'xs',
    {
      TestBreakpointId.sm: (_) => 'sm',
      TestBreakpointId.md: (_) => 'md',
      TestBreakpointId.lg: (_) => 'lg',
    },
  );

  final flexValue2 = FlexValue<TestBreakpointId, String>(
    (_) => 'xs/sm',
    {
      TestBreakpointId.md: (_) => 'md/lg',
    },
  );

  final expectedFlexValues = [
    // flexValue1
    _ExpectedFlexValue(
      flexValue: flexValue1,
      containerWidth: 0,
      expectedText: 'xs',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue1,
      containerWidth: 99,
      expectedText: 'xs',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue1,
      containerWidth: 100,
      expectedText: 'sm',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue1,
      containerWidth: 199,
      expectedText: 'sm',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue1,
      containerWidth: 200,
      expectedText: 'md',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue1,
      containerWidth: 299,
      expectedText: 'md',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue1,
      containerWidth: 300,
      expectedText: 'lg',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue1,
      containerWidth: 400,
      expectedText: 'lg',
    ),

    // flexValue2
    _ExpectedFlexValue(
      flexValue: flexValue2,
      containerWidth: 0,
      expectedText: 'xs/sm',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue2,
      containerWidth: 99,
      expectedText: 'xs/sm',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue2,
      containerWidth: 100,
      expectedText: 'xs/sm',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue2,
      containerWidth: 199,
      expectedText: 'xs/sm',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue2,
      containerWidth: 200,
      expectedText: 'md/lg',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue2,
      containerWidth: 299,
      expectedText: 'md/lg',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue2,
      containerWidth: 300,
      expectedText: 'md/lg',
    ),
    _ExpectedFlexValue(
      flexValue: flexValue2,
      containerWidth: 400,
      expectedText: 'md/lg',
    ),
  ];

  for (final expectedFlexValue in expectedFlexValues) {
    final flexValue = expectedFlexValue.flexValue;
    final containerWidth = expectedFlexValue.containerWidth;
    final expectedText = expectedFlexValue.expectedText;

    group('Given container width $containerWidth', () {
      testWidgets('Flex value should be $expectedText',
          (WidgetTester tester) async {
        setPhysicalSize(tester, Size.square(containerWidth));
        await tester.pumpWidget(_TestApp(flexTitle: flexValue));
        expect(find.text(expectedText), findsOneWidget);
      });
    });
  }
}

class _ExpectedFlexValue {
  _ExpectedFlexValue({
    required this.flexValue,
    required this.containerWidth,
    required this.expectedText,
  });

  final FlexValue<TestBreakpointId, String> flexValue;
  final double containerWidth;
  final String expectedText;
}

class _TestApp extends StatelessWidget {
  const _TestApp({Key? key, required this.flexTitle}) : super(key: key);

  final FlexValue<TestBreakpointId, String> flexTitle;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: FlexContainer(
          layout: const TestLayout(),
          child: Builder(
            builder: (ctx) => Text(flexTitle.get(ctx)),
          ),
        ),
      );
}
