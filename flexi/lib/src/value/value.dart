import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

import '../index.dart';

typedef FlexValueBuilder<V> = V Function(BuildContext context);

abstract class FlexValue<BreakpointId extends Enum, V> {
  factory FlexValue(
    FlexValueBuilder<V> startValue, [
    Map<BreakpointId, FlexValueBuilder<V>>? flexValues,
  ]) = BreakpointFlexValue;

  /// 1. If `flexValues` is null or empty, returns `startValue`.
  ///
  /// 2. If current breakpoint is smaller than the smallest breakpoint
  /// of the layout, returns `startValue`.
  ///
  /// 3. If current breakpoint is smaller than the smallest breakpoint
  /// in `flexValues`, returns `startValue`.
  ///
  /// 4. Otherwise, returns the value of the nearest breakpoint in `flexValues`,
  /// which is smaller than current breakpoint.
  FlexValueBuilder<V> getBuilder(BuildContext context);

  /// This method use the given [context] to select the builder,
  /// then use the same [context] to get value from the selected builder.
  ///
  /// In case different [context]s are needed,
  /// consider to use [getBuilder] instead.
  ///
  /// In the example below, `contextA` is used to select the builder,
  /// then `contextB` is used to get value from the selected builder.
  /// ```
  /// final FlexValue<MaterialBreakpointId, Widget> flexHome;
  ///
  /// @override
  /// Widget build(BuildContext contextA) => MaterialApp(
  ///       home: FlexContainer(
  ///         layout: const MaterialLayout(),
  ///         child: Builder(
  ///           builder: (contextB) =>
  ///               flexHome.getBuilder(contextA)(contextB),
  ///         ),
  ///       ),
  ///     );
  /// ```
  V get(BuildContext context);
}

class BreakpointFlexValue<BreakpointId extends Enum, V>
    implements FlexValue<BreakpointId, V> {
  const BreakpointFlexValue(this.startValue, [this.flexValues]);

  final FlexValueBuilder<V> startValue;
  final Map<BreakpointId, FlexValueBuilder<V>>? flexValues;

  @override
  FlexValueBuilder<V> getBuilder(BuildContext context) {
    if (flexValues == null) {
      return startValue;
    }

    final breakpoint = context.flexi.maybeBreakpoint;
    if (breakpoint == null) {
      return startValue;
    }

    final breakpoints = context.flexi.layout.breakpoints
        .where((bp) => flexValues!.keys.contains(bp.id))
        .toList(growable: false);

    final flexBreakpoint =
        breakpoints.reversed.firstWhereOrNull((bp) => bp <= breakpoint);

    return flexBreakpoint == null
        ? startValue
        : flexValues![flexBreakpoint.id]!;
  }

  @override
  V get(BuildContext context) => getBuilder(context)(context);
}
