import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../index.dart';

void main() {
  group(
      'Given a squared full size FlexContainer with size 200'
      ' and a nested squared full size FlexContainer with size 100', () {
    testWidgets(
      'The most outer ContainerContext should be null',
      (tester) async {
        ContainerContext? containerContext;

        await tester.pumpWidget(
          _TestContainerContext(
            onBuild: ({
              required topContext,
              required middleContext,
              required bottomContext,
            }) {
              containerContext = topContext.internalFlexi.containerContext;
            },
          ),
        );

        expect(containerContext, null);
      },
    );

    testWidgets(
      'Biggest size of the middle ContainerContext should be a square 200',
      (tester) async {
        Size? biggestSize;
        const expectedSize = Size.square(200);

        await tester.pumpWidget(
          _TestContainerContext(
            onBuild: ({
              required topContext,
              required middleContext,
              required bottomContext,
            }) {
              biggestSize = middleContext
                  .internalFlexi.containerContext?.constraints.biggest;
            },
          ),
        );

        expect(biggestSize, expectedSize);
      },
    );

    testWidgets(
      'Biggest size of the most inner ContainerContext should be a square 100',
      (tester) async {
        Size? biggestSize;
        const expectedSize = Size.square(100);

        await tester.pumpWidget(
          _TestContainerContext(
            onBuild: ({
              required topContext,
              required middleContext,
              required bottomContext,
            }) {
              biggestSize = bottomContext
                  .internalFlexi.containerContext?.constraints.biggest;
            },
          ),
        );

        expect(biggestSize, expectedSize);
      },
    );
  });

  group('Given a squared FlexContainer with size 100 in full size', () {
    group('Given layout margins is not zero', () {
      group('Given fullSize is false', () {
        testWidgets('Margins should be zero', (tester) async {
          const expectedSize = Size.square(80);
          BuildContext? context;

          await tester.pumpWidget(
            _TestMargins(
              child: UnconstrainedBox(
                child: SizedBox.square(
                  dimension: 100,
                  child: _MockFlexContainer(
                    layout: const MaterialLayout(),
                    fullSize: false,
                    child: Builder(
                      builder: (ctx) {
                        context = ctx;
                        return Container();
                      },
                    ),
                  ),
                ),
              ),
            ),
          );

          expect(context!.size, expectedSize);
        });
      });

      group('Given fullSize is true and layout margins is not zero', () {
        testWidgets('Margins should not be zero', (tester) async {
          const expectedSize = Size.square(100);
          BuildContext? context;

          await tester.pumpWidget(
            _TestMargins(
              child: UnconstrainedBox(
                child: SizedBox.square(
                  dimension: 100,
                  child: _MockFlexContainer(
                    layout: const MaterialLayout(),
                    child: Builder(
                      builder: (ctx) {
                        context = ctx;
                        return Container();
                      },
                    ),
                  ),
                ),
              ),
            ),
          );

          expect(context!.size, expectedSize);
        });
      });
    });
  });
}

typedef _OnBuild = void Function({
  required BuildContext topContext,
  required BuildContext middleContext,
  required BuildContext bottomContext,
});

class _TestContainerContext extends StatelessWidget {
  const _TestContainerContext({Key? key, required this.onBuild})
      : super(key: key);

  final _OnBuild onBuild;

  @override
  Widget build(BuildContext topContext) => MaterialApp(
        home: UnconstrainedBox(
          child: SizedBox.square(
            dimension: 200,
            child: FlexContainer(
              layout: const TestLayout(),
              child: Builder(
                builder: (middleContext) => UnconstrainedBox(
                  child: SizedBox.square(
                    dimension: 100,
                    child: FlexContainer(
                      layout: const TestLayout(),
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
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class _TestMargins extends StatelessWidget {
  const _TestMargins({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(home: child);
}

class _MockFlexContainer extends FlexContainer {
  const _MockFlexContainer({
    Key? key,
    required Layout layout,
    required Widget child,
    bool fullSize = true,
  }) : super(key: key, layout: layout, child: child, fullSize: fullSize);

  @override
  State<FlexContainer> createState() => _MockFlexContainerState();
}

class _MockFlexContainerState extends FlexContainerState {
  @override
  EdgeInsets getFormatMargins(BuildContext context) => const EdgeInsets.all(10);
}
