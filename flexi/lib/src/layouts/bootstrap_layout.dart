import 'dart:collection';

import '../index.dart';

enum BootstrapBreakpointId { xs, sm, md, lg, xl, xxl }

class BootstrapBreakpoint extends Breakpoint<BootstrapBreakpointId> {
  const BootstrapBreakpoint(
      {required BootstrapBreakpointId id, required double minWidth})
      : super(id: id, minWidth: minWidth);
}

class BootstrapLayout
    extends Layout<BootstrapBreakpointId, BootstrapBreakpoint> {
  const BootstrapLayout();

  @override
  SplayTreeSet<BootstrapBreakpoint> get breakpoints =>
      SplayTreeSet.from(<BootstrapBreakpoint>{
        const BootstrapBreakpoint(id: BootstrapBreakpointId.xs, minWidth: 0),
        const BootstrapBreakpoint(id: BootstrapBreakpointId.sm, minWidth: 576),
        const BootstrapBreakpoint(id: BootstrapBreakpointId.md, minWidth: 768),
        const BootstrapBreakpoint(id: BootstrapBreakpointId.lg, minWidth: 992),
        const BootstrapBreakpoint(id: BootstrapBreakpointId.xl, minWidth: 1200),
        const BootstrapBreakpoint(
            id: BootstrapBreakpointId.xxl, minWidth: 1400),
      });

  @override
  LayoutFormat format(double containerWidth,
      [double containerHeight = double.maxFinite]) {
    // Apply the same margin for both sides.
    final horizontalMargin = leftMargin(containerWidth);
    return LayoutFormat(
      columns: 12,
      gutter: 24,
      leftMargin: horizontalMargin,
      topMargin: 0,
      rightMargin: horizontalMargin,
      bottomMargin: 0,
    );
  }

  double leftMargin(double containerWidth) {
    switch (breakpoint(containerWidth)?.id) {
      case null:
      case BootstrapBreakpointId.xs:
        return 0;
      case BootstrapBreakpointId.sm:
        return scalingLeftMargin(containerWidth, 540);
      case BootstrapBreakpointId.md:
        return scalingLeftMargin(containerWidth, 720);
      case BootstrapBreakpointId.lg:
        return scalingLeftMargin(containerWidth, 960);
      case BootstrapBreakpointId.xl:
        return scalingLeftMargin(containerWidth, 1140);
      case BootstrapBreakpointId.xxl:
        return scalingLeftMargin(containerWidth, 1320);
    }
  }

  double scalingLeftMargin(double containerWidth, double maxBodyWidth) =>
      containerWidth <= maxBodyWidth ? 0 : (containerWidth - maxBodyWidth) / 2;
}
