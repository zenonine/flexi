import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../index.dart';

void main() {
  group('Given there are no InheritedContainer', () {
    testWidgets('ContainerContext should be null', (tester) async {
      BuildContext? context;
      await tester.pumpWidget(_TestApp(
        child: Builder(builder: (ctx) {
          context = ctx;
          return Container();
        }),
      ));

      expect(InheritedContainer.of(context!), null);
    });
  });

  group('Given InheritedLayout exists', () {
    testWidgets('ContainerContext should not be null', (tester) async {
      BuildContext? context;
      ContainerContext? expectedContainerContext;
      await tester.pumpWidget(_TestApp(
        child: LayoutBuilder(builder: (ctx, constraints) {
          expectedContainerContext = ContainerContext(
            context: ctx,
            constraints: constraints,
          );

          return InheritedContainer(
            containerContext: expectedContainerContext!,
            child: Builder(builder: (ctx) {
              context = ctx;
              return Container();
            }),
          );
        }),
      ));

      expect(InheritedContainer.of(context!), expectedContainerContext);
    });
  });

  group('updateShouldNotify', () {
    // TODO: implementation
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
