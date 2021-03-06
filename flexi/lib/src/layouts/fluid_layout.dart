import 'dart:collection';

import '../index.dart';

enum FluidBreakpointId { fluid }

class FluidBreakpoint extends Breakpoint<FluidBreakpointId> {
  const FluidBreakpoint({required FluidBreakpointId id})
      : super(id: id, minWidth: 0);
}

class FluidLayout extends Layout<FluidBreakpointId, FluidBreakpoint> {
  const FluidLayout();

  @override
  SplayTreeSet<FluidBreakpoint> get breakpoints =>
      SplayTreeSet.from(<FluidBreakpoint>{
        const FluidBreakpoint(id: FluidBreakpointId.fluid),
      });

  @override
  LayoutFormat format(
    double containerWidth, [
    double containerHeight = double.maxFinite,
  ]) =>
      const LayoutFormat(
        columns: 1,
        gutter: 0,
        leftMargin: 0,
        topMargin: 0,
        rightMargin: 0,
        bottomMargin: 0,
      );
}
