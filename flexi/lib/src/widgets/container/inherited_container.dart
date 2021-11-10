import 'package:flutter/widgets.dart';

import '../../index.dart';

class InheritedContainer extends InheritedWidget {
  const InheritedContainer({
    Key? key,
    required Widget child,
    required this.context,
  }) : super(key: key, child: child);

  final ContainerContext context;

  static ContainerContext? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedContainer>()?.context;

  @override
  bool updateShouldNotify(covariant InheritedContainer oldWidget) {
    return context != oldWidget.context;
  }
}

class InheritedInnerContainer extends InheritedWidget {
  const InheritedInnerContainer({
    Key? key,
    required Widget child,
    required this.context,
  }) : super(key: key, child: child);

  final InnerContainerContext context;

  static InnerContainerContext? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<InheritedInnerContainer>()
      ?.context;

  @override
  bool updateShouldNotify(covariant InheritedInnerContainer oldWidget) {
    return context != oldWidget.context;
  }
}

class InheritedRootContainerMarker extends InheritedWidget {
  const InheritedRootContainerMarker({
    Key? key,
    required Widget child,
    required this.context,
  }) : super(key: key, child: child);

  final BuildContext context;

  static BuildContext? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<InheritedRootContainerMarker>()
      ?.context;

  @override
  bool updateShouldNotify(covariant InheritedRootContainerMarker oldWidget) {
    return context != oldWidget.context;
  }
}
