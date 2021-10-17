import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

import '../index.dart';

typedef FlexValueBuilder<V> = V Function(BuildContext context);
typedef FlexWidgetBuilder<V> = Widget Function(BuildContext context, V value);

abstract class FlexValue<BreakpointId extends Enum, V> {
  factory FlexValue(V startValue, [Map<BreakpointId, V>? flexValues]) =
      BreakpointFlexValue;

  factory FlexValue.builder(FlexValueBuilder<V> builder) = BuilderFlexValue;

  V get(BuildContext context);

  Widget build(FlexWidgetBuilder<V> builder);
}

abstract class BaseFlexValue<BreakpointId extends Enum, V>
    implements FlexValue<BreakpointId, V> {
  const BaseFlexValue();

  /// Build widget from flex value.
  @override
  Widget build(FlexWidgetBuilder<V> builder) {
    return Builder(builder: (context) => builder(context, get(context)));
  }
}

class BreakpointFlexValue<BreakpointId extends Enum, V>
    extends BaseFlexValue<BreakpointId, V>
    implements FlexValue<BreakpointId, V> {
  const BreakpointFlexValue(this.startValue, [this.flexValues]);

  final V startValue;
  final Map<BreakpointId, V>? flexValues;

  /// 1. If [flexValues] is null or empty, returns [startValue].
  /// 2. If current breakpoint is smaller than the smallest breakpoint of the layout, returns [startValue].
  /// 3. If current breakpoint is smaller than the smallest breakpoint in [flexValues], returns [startValue].
  /// 4. Otherwise, returns the value of the nearest breakpoint in [flexValues], which is smaller than current breakpoint.
  @override
  V get(BuildContext context) {
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

    final flexBreakpoint = breakpoints.reversed.firstWhereOrNull((bp) {
      return bp <= breakpoint;
    });

    return flexBreakpoint == null
        ? startValue
        : flexValues![flexBreakpoint.id]!;
  }
}

class BuilderFlexValue<BreakpointId extends Enum, V>
    extends BaseFlexValue<BreakpointId, V>
    implements FlexValue<BreakpointId, V> {
  const BuilderFlexValue(this.builder);

  final FlexValueBuilder<V> builder;

  @override
  V get(BuildContext context) => builder(context);
}
