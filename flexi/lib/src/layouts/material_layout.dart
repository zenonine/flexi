import 'dart:collection';

import '../index.dart';

enum MaterialBreakpointId { xs, sm, md, lg }

class MaterialBreakpoint extends Breakpoint<MaterialBreakpointId> {
  const MaterialBreakpoint(
      {required MaterialBreakpointId id, required double minWidth})
      : super(id: id, minWidth: minWidth);
}

class MaterialLayout extends Layout<MaterialBreakpointId, MaterialBreakpoint> {
  const MaterialLayout();

  @override
  SplayTreeSet<MaterialBreakpoint> get breakpoints =>
      SplayTreeSet.from(<MaterialBreakpoint>{
        const MaterialBreakpoint(id: MaterialBreakpointId.xs, minWidth: 0),
        const MaterialBreakpoint(id: MaterialBreakpointId.sm, minWidth: 600),
        const MaterialBreakpoint(id: MaterialBreakpointId.md, minWidth: 1240),
        const MaterialBreakpoint(id: MaterialBreakpointId.lg, minWidth: 1440),
      });

  @override
  LayoutFormat format(double containerWidth,
      [double containerHeight = double.infinity]) {
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
      case MaterialBreakpointId.sm:
        const maxBodySize = 840.0;
        const fixedMargin = 32.0;
        const maxFixedMarginSize = maxBodySize + 2 * fixedMargin;
        return containerWidth <= maxFixedMarginSize ? 8 : 12;
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
      case MaterialBreakpointId.sm:
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
      case MaterialBreakpointId.sm:
        const maxBodyWidth = 840.0;
        const fixedMargin = 32.0;
        const maxFixedMarginWidth = maxBodyWidth + 2 * fixedMargin;
        return containerWidth <= maxFixedMarginWidth
            ? fixedMargin
            : scalingLeftMargin(containerWidth, maxBodyWidth);
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
