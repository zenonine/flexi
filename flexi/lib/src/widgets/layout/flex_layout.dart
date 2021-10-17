import 'package:flutter/widgets.dart';

import '../../index.dart';

/// If no [FlexLayout] is provided in the widget tree, [MaterialLayout] is used.
class FlexLayout extends StatelessWidget {
  const FlexLayout({
    Key? key,
    required this.layout,
    required this.child,
  }) : super(key: key);

  final Layout layout;
  final Widget child;

  @override
  Widget build(BuildContext context) => InheritedLayout(
        layout: layout,
        child: child,
      );
}
