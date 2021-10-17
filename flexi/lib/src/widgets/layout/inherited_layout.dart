import 'package:flutter/widgets.dart';

import '../../index.dart';

class InheritedLayout extends InheritedWidget {
  const InheritedLayout({
    Key? key,
    required Widget child,
    required this.layout,
  }) : super(key: key, child: child);

  final Layout layout;

  static Layout of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<InheritedLayout>()
            ?.layout ??
        const MaterialLayout();
  }

  @override
  bool updateShouldNotify(covariant InheritedLayout oldWidget) {
    return layout != oldWidget.layout;
  }
}
