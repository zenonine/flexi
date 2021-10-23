import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../index.dart';

void main() {
  group('Given there are no InheritedLayout', () {
    testWidgets('MaterialLayout should be used', (tester) async {
      BuildContext? context;
      await tester.pumpWidget(
        _TestApp(
          child: Builder(
            builder: (ctx) {
              context = ctx;
              return Container();
            },
          ),
        ),
      );

      expect(InheritedLayout.of(context!), const MaterialLayout());
    });
  });

  group('Given InheritedLayout use BootstrapLayout', () {
    testWidgets('BootstrapLayout should be used', (tester) async {
      BuildContext? context;
      await tester.pumpWidget(
        _TestApp(
          child: InheritedLayout(
            layout: const BootstrapLayout(),
            child: Builder(
              builder: (ctx) {
                context = ctx;
                return Container();
              },
            ),
          ),
        ),
      );

      expect(InheritedLayout.of(context!), const BootstrapLayout());
    });
  });

  group('updateShouldNotify', () {
    // TODO(xuan): implementation
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
