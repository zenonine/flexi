import 'dart:collection';

import '../index.dart';

enum MaterialBreakpointId { xs, sm8, sm12, md, lg }

class MaterialBreakpoint extends Breakpoint<MaterialBreakpointId> {
  const MaterialBreakpoint({
    required MaterialBreakpointId id,
    required double minWidth,
  }) : super(id: id, minWidth: minWidth);
}

class MaterialLayout extends Layout<MaterialBreakpointId, MaterialBreakpoint> {
  const MaterialLayout();

  @override
  SplayTreeSet<MaterialBreakpoint> get breakpoints =>
      SplayTreeSet.from(<MaterialBreakpoint>{
        const MaterialBreakpoint(id: MaterialBreakpointId.xs, minWidth: 0),
        const MaterialBreakpoint(id: MaterialBreakpointId.sm8, minWidth: 600),
        const MaterialBreakpoint(id: MaterialBreakpointId.sm12, minWidth: 905),
        const MaterialBreakpoint(id: MaterialBreakpointId.md, minWidth: 1240),
        const MaterialBreakpoint(id: MaterialBreakpointId.lg, minWidth: 1440),
      });

  @override
  LayoutFormat format(
    double containerWidth, [
    double containerHeight = double.maxFinite,
  ]) {
    final horizontalMargin = leftMargin(containerWidth);
    return LayoutFormat(
      columns: columns(containerWidth),
      gutter: gutter(containerWidth),
      leftMargin: horizontalMargin,
      topMargin: 0,
      rightMargin: horizontalMargin,
      bottomMargin: 0,
    );
  }

  int columns(double containerWidth) {
    switch (breakpoint(containerWidth)?.id) {
      case null:
      case MaterialBreakpointId.xs:
        return 4;
      case MaterialBreakpointId.sm8:
        return 8;
      case MaterialBreakpointId.sm12:
      case MaterialBreakpointId.md:
      case MaterialBreakpointId.lg:
        return 12;
    }
  }

  double gutter(double containerWidth) {
    switch (breakpoint(containerWidth)?.id) {
      case null:
      case MaterialBreakpointId.xs:
        return 16;
      case MaterialBreakpointId.sm8:
      case MaterialBreakpointId.sm12:
      case MaterialBreakpointId.md:
      case MaterialBreakpointId.lg:
        return 24;
    }
  }

  double leftMargin(double containerWidth) {
    switch (breakpoint(containerWidth)?.id) {
      case null:
      case MaterialBreakpointId.xs:
        return 16;
      case MaterialBreakpointId.sm8:
        return 32;
      case MaterialBreakpointId.sm12:
        const maxBodyWidth = 840.0;
        return scalingLeftMargin(containerWidth, maxBodyWidth);
      case MaterialBreakpointId.md:
        return 200;
      case MaterialBreakpointId.lg:
        const maxBodyWidth = 1040.0;
        return scalingLeftMargin(containerWidth, maxBodyWidth);
    }
  }

  double scalingLeftMargin(double containerWidth, double maxBodyWidth) =>
      containerWidth <= maxBodyWidth ? 0 : (containerWidth - maxBodyWidth) / 2;
}
