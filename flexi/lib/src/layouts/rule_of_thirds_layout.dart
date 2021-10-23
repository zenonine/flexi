import 'dart:collection';

import '../index.dart';

enum RuleOfThirdsBreakpointId { fluid }

class RuleOfThirdsBreakpoint extends Breakpoint<RuleOfThirdsBreakpointId> {
  const RuleOfThirdsBreakpoint({required RuleOfThirdsBreakpointId id})
      : super(id: id, minWidth: 0);
}

class RuleOfThirdsLayout
    extends Layout<RuleOfThirdsBreakpointId, RuleOfThirdsBreakpoint> {
  const RuleOfThirdsLayout();

  @override
  SplayTreeSet<RuleOfThirdsBreakpoint> get breakpoints =>
      SplayTreeSet.from(<RuleOfThirdsBreakpoint>{
        const RuleOfThirdsBreakpoint(id: RuleOfThirdsBreakpointId.fluid),
      });

  @override
  LayoutFormat format(
    double containerWidth, [
    double containerHeight = double.maxFinite,
  ]) =>
      LayoutFormat(
        columns: 3,
        gutter: 0,
        leftMargin: 0,
        topMargin: 0,
        rightMargin: 0,
        bottomMargin: 0,
        module: LayoutModule(baseline: containerHeight / 3, rows: 1, gutter: 0),
      );
}
