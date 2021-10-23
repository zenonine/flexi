import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../index.dart';

void main() {
  group(
      'Given outer FlexLayout uses BootstrapLayout'
      ' and inner FlexLayout uses FluidLayout', () {
    testWidgets(
      'Default MaterialLayout should be used above the outer FlexLayout',
      (WidgetTester tester) async {
        Layout? layout;
        const expectedLayout = MaterialLayout();

        await tester.pumpWidget(
          _TestFlexLayout(
            onBuild: ({
              required topContext,
              required middleContext,
              required bottomContext,
            }) {
              layout = topContext.flexi.layout;
            },
          ),
        );

        expect(layout, expectedLayout);
      },
    );

    testWidgets(
      'BootstrapLayout should be used between the outer and inner FlexLayouts',
      (WidgetTester tester) async {
        Layout? layout;
        const expectedLayout = BootstrapLayout();

        await tester.pumpWidget(
          _TestFlexLayout(
            onBuild: ({
              required topContext,
              required middleContext,
              required bottomContext,
            }) {
              layout = middleContext.flexi.layout;
            },
          ),
        );

        expect(layout, expectedLayout);
      },
    );

    testWidgets(
      'FluidLayout should be used below the inner FlexLayout',
      (WidgetTester tester) async {
        Layout? layout;
        const expectedLayout = FluidLayout();

        await tester.pumpWidget(
          _TestFlexLayout(
            onBuild: ({
              required topContext,
              required middleContext,
              required bottomContext,
            }) {
              layout = bottomContext.flexi.layout;
            },
          ),
        );

        expect(layout, expectedLayout);
      },
    );
  });
}

typedef _OnBuild = void Function({
  required BuildContext topContext,
  required BuildContext middleContext,
  required BuildContext bottomContext,
});

class _TestFlexLayout extends StatelessWidget {
  const _TestFlexLayout({Key? key, required this.onBuild}) : super(key: key);

  final _OnBuild onBuild;

  @override
  Widget build(BuildContext topContext) {
    return FlexLayout(
      layout: const BootstrapLayout(),
      child: Builder(
        builder: (middleContext) {
          return FlexLayout(
            layout: const FluidLayout(),
            child: Builder(
              builder: (bottomContext) {
                onBuild(
                  topContext: topContext,
                  middleContext: middleContext,
                  bottomContext: bottomContext,
                );
                return Container();
              },
            ),
          );
        },
      ),
    );
  }
}
