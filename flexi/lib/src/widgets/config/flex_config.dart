import 'package:flutter/widgets.dart';

import '../../index.dart';

class FlexConfig extends StatelessWidget {
  const FlexConfig({
    Key? key,
    required this.child,
    this.showOverlay,
    this.showMargins,
    this.showColumns,
    this.showModules,
    this.showBaselines,
    this.style,
  }) : super(key: key);

  final Widget child;
  final bool? showOverlay;
  final bool? showMargins;
  final bool? showColumns;
  final bool? showModules;
  final bool? showBaselines;
  final FlexOverlayStyle? style;

  @override
  Widget build(BuildContext context) => FlexResetConfig(
        options: context.flexi.options.copy(
          showOverlay: showOverlay,
          showMargins: showMargins,
          showColumns: showColumns,
          showModules: showModules,
          showBaselines: showBaselines,
          style: style,
        ),
        child: child,
      );
}

class FlexResetConfig extends StatelessWidget {
  const FlexResetConfig({
    Key? key,
    required this.options,
    required this.child,
  }) : super(key: key);

  final FlexOptions options;
  final Widget child;

  @override
  Widget build(BuildContext context) => InheritedOptions(
        options: options,
        child: child,
      );
}
