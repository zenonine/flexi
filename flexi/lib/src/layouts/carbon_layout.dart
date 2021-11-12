import 'dart:collection';

import 'package:meta/meta.dart';

import '../index.dart';

enum CarbonBreakpointId { sm, md, lg, xl, max }

class CarbonBreakpoint extends Breakpoint<CarbonBreakpointId> {
  const CarbonBreakpoint({
    required CarbonBreakpointId id,
    required double minWidth,
  }) : super(id: id, minWidth: minWidth);
}

/// See https://www.carbondesignsystem.com/guidelines/2x-grid/implementation
@experimental
class CarbonLayout extends Layout<CarbonBreakpointId, CarbonBreakpoint> {
  const CarbonLayout();

  @override
  SplayTreeSet<CarbonBreakpoint> get breakpoints =>
      SplayTreeSet.from(<CarbonBreakpoint>{
        const CarbonBreakpoint(id: CarbonBreakpointId.sm, minWidth: 0),
        const CarbonBreakpoint(id: CarbonBreakpointId.md, minWidth: 672),
        const CarbonBreakpoint(id: CarbonBreakpointId.lg, minWidth: 1056),
        const CarbonBreakpoint(id: CarbonBreakpointId.xl, minWidth: 1312),
        const CarbonBreakpoint(id: CarbonBreakpointId.max, minWidth: 1584),
      });

  @override
  LayoutFormat format(double containerWidth, [
    double containerHeight = double.maxFinite,
  ]) {
    final horizontalMargin = leftMargin(containerWidth);
    return LayoutFormat(
      columns: columns(containerWidth),
      gutter: 32,
      leftMargin: horizontalMargin,
      topMargin: 0,
      rightMargin: horizontalMargin,
      bottomMargin: 0,
    );
  }

  int columns(double containerWidth) {
    switch (breakpoint(containerWidth)?.id) {
      case null:
      case CarbonBreakpointId.sm:
        return 4;
      case CarbonBreakpointId.md:
        return 8;
      case CarbonBreakpointId.lg:
      case CarbonBreakpointId.xl:
      case CarbonBreakpointId.max:
        return 16;
    }
  }

  double leftMargin(double containerWidth) {
    switch (breakpoint(containerWidth)?.id) {
      case null:
      case CarbonBreakpointId.sm:
        return 0;
      case CarbonBreakpointId.md:
      case CarbonBreakpointId.lg:
      case CarbonBreakpointId.xl:
        return 16;
      case CarbonBreakpointId.max:
        return 24;
    }
  }
}

@experimental
class NarrowCarbonLayout extends CarbonLayout {
  const NarrowCarbonLayout();

  @override
  LayoutFormat format(double containerWidth, [
    double containerHeight = double.maxFinite,
  ]) =>
      super.format(containerWidth, containerHeight).copy(gutter: 16);
}

@experimental
class CondensedCarbonLayout extends CarbonLayout {
  const CondensedCarbonLayout();

  @override
  LayoutFormat format(double containerWidth, [
    double containerHeight = double.maxFinite,
  ]) =>
      super.format(containerWidth, containerHeight).copy(gutter: 1);
}
