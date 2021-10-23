import 'dart:collection';

import '../index.dart';

enum TestBreakpointId { sm, md, lg }

class TestBreakpoint extends Breakpoint<TestBreakpointId> {
  const TestBreakpoint({required TestBreakpointId id, required double minWidth})
      : super(id: id, minWidth: minWidth);
}

class TestLayout extends Layout<TestBreakpointId, TestBreakpoint> {
  const TestLayout();

  @override
  SplayTreeSet<TestBreakpoint> get breakpoints =>
      SplayTreeSet.from(<TestBreakpoint>{
        const TestBreakpoint(id: TestBreakpointId.sm, minWidth: 100),
        const TestBreakpoint(id: TestBreakpointId.md, minWidth: 200),
        const TestBreakpoint(id: TestBreakpointId.lg, minWidth: 300),
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
