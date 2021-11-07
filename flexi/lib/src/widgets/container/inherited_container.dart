import 'package:flutter/widgets.dart';

import '../../index.dart';

class InheritedContainer extends InheritedWidget {
  const InheritedContainer({
    Key? key,
    required Widget child,
    required this.containerContext,
  }) : super(key: key, child: child);

  final ContainerContext containerContext;

  static ContainerContext of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<InheritedContainer>()
          ?.containerContext ??
      InheritedRootContainer.of(context);

  static ContainerContext? maybeOf(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<InheritedContainer>()
          ?.containerContext ??
      InheritedRootContainer.maybeOf(context);

  @override
  bool updateShouldNotify(covariant InheritedContainer oldWidget) {
    return containerContext != oldWidget.containerContext;
  }
}
