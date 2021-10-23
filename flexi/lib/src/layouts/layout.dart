import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../index.dart';

@immutable
abstract class Breakpoint<BreakpointId extends Enum>
    implements Comparable<Breakpoint<BreakpointId>> {
  const Breakpoint({required this.id, required this.minWidth});

  final BreakpointId id;
  final double minWidth;

  @override
  int get hashCode => id.hashCode ^ minWidth.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Breakpoint &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          minWidth == other.minWidth;

  bool operator <(Breakpoint<BreakpointId>? other) =>
      other != null && minWidth < other.minWidth;

  bool operator >(Breakpoint<BreakpointId>? other) =>
      other == null || minWidth > other.minWidth;

  bool operator <=(Breakpoint<BreakpointId>? other) =>
      other != null && minWidth <= other.minWidth;

  bool operator >=(Breakpoint<BreakpointId>? other) =>
      other == null || minWidth >= other.minWidth;

  bool eq(Breakpoint<BreakpointId>? other) =>
      other != null && minWidth == other.minWidth;

  @override
  int compareTo(Breakpoint<BreakpointId>? other) {
    return eq(other) ? 0 : (this > other ? 1 : -1);
  }

  @override
  String toString() {
    return 'Breakpoint{id: $id, minWidth: $minWidth}';
  }
}

@immutable
abstract class Layout<BreakpointId extends Enum,
    B extends Breakpoint<BreakpointId>> {
  const Layout();

  /// At least one breakpoint must exist.
  /// Make sure all breakpoint enums are defined,
  /// otherwise [breakpointById] may throw exception.
  abstract final SplayTreeSet<B> breakpoints;

  @nonVirtual
  Map<BreakpointId, B> get breakpointsMap =>
      {for (var breakpoint in breakpoints) breakpoint.id: breakpoint};

  /// Returns `null` if container width is smaller than the smallest breakpoint.
  @nonVirtual
  B? breakpoint(double containerWidth) {
    if (containerWidth < breakpoints.first.minWidth) {
      // Ex. containerWidth is 50dp but smallest breakpoint is 100dp,
      return null;
    }

    return breakpoints.firstWhere((breakpoint) {
      final nextBreakpoint =
          breakpoints.firstWhereOrNull((bp) => bp > breakpoint);

      if (nextBreakpoint == null) {
        // Returns the biggest breakpoint.
        return true;
      }

      return containerWidth >= breakpoint.minWidth &&
          containerWidth < nextBreakpoint.minWidth;
    });
  }

  B get smallestBreakpoint => breakpoints.first;

  B get biggestBreakpoint => breakpoints.last;

  @nonVirtual
  B breakpointById(BreakpointId id) => breakpointsMap[id]!;

  /// Returns 'null' if the given breakpoint is the biggest breakpoint.
  @nonVirtual
  B? nextBreakpoint(BreakpointId? id) {
    final breakpoint = id == null ? null : breakpointById(id);
    return breakpoints.firstWhereOrNull((bp) => bp > breakpoint);
  }

  /// Returns `null` in one of these cases:
  /// * the given breakpoint is `null`.
  /// * the given breakpoint is the smallest breakpoint.
  @nonVirtual
  B? previousBreakpoint(BreakpointId? id) {
    final breakpoint = id == null ? null : breakpointById(id);
    return breakpoints
        .toList(growable: false)
        .reversed
        .firstWhereOrNull((bp) => bp < breakpoint);
  }

  LayoutFormat format(
    double containerWidth, [
    double containerHeight = double.maxFinite,
  ]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Layout &&
          runtimeType == other.runtimeType &&
          breakpoints.runtimeType == other.breakpoints.runtimeType &&
          const SetEquality<dynamic>().equals(breakpoints, other.breakpoints);

  @override
  int get hashCode => breakpoints.hashCode;
}
