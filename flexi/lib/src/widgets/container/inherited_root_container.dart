import 'package:flutter/widgets.dart';

import '../../index.dart';

class InheritedRootContainer extends InheritedWidget {
  const InheritedRootContainer({
    Key? key,
    required Widget child,
    required this.containerContext,
  }) : super(key: key, child: child);

  final ContainerContext containerContext;

  static ContainerContext of(BuildContext context) {
    final containerContext = maybeOf(context);
    assert(
      containerContext != null,
      'Make sure you are inside a FlexContainer.',
    );

    return containerContext!;
  }

  static ContainerContext? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<InheritedRootContainer>()
      ?.containerContext;

  @override
  bool updateShouldNotify(covariant InheritedRootContainer oldWidget) {
    return containerContext != oldWidget.containerContext;
  }
}
