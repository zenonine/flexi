import 'package:flutter/widgets.dart';

import '../../index.dart';

class InheritedOptions extends InheritedWidget {
  const InheritedOptions({
    Key? key,
    required Widget child,
    required this.options,
  }) : super(key: key, child: child);

  final FlexOptions options;

  static FlexOptions of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedOptions>()?.options ??
      const FlexOptions();

  @override
  bool updateShouldNotify(covariant InheritedOptions oldWidget) =>
      options != oldWidget.options;
}
