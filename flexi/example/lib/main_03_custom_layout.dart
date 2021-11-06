import 'dart:collection';

import 'package:flexi/flexi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const FlexLayout(
        layout: CustomLayout(),
        child: MaterialApp(
          title: 'Flexi Example - Custom Layout',
          home: Scaffold(body: HomePage()),
        ),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Center(child: Text(context.flexi.breakpoint.toString()));
}

enum CustomBreakpointId { sm, md }

class CustomBreakpoint extends Breakpoint<CustomBreakpointId> {
  const CustomBreakpoint({
    required CustomBreakpointId id,
    required double minWidth,
  }) : super(id: id, minWidth: minWidth);
}

class CustomLayout extends Layout<CustomBreakpointId, CustomBreakpoint> {
  const CustomLayout();

  @override
  SplayTreeSet<CustomBreakpoint> get breakpoints =>
      SplayTreeSet.from(<CustomBreakpoint>{
        const CustomBreakpoint(id: CustomBreakpointId.sm, minWidth: 0),
        const CustomBreakpoint(id: CustomBreakpointId.md, minWidth: 600),
      });

  @override
  LayoutFormat format(
    double containerWidth, [
    double containerHeight = double.maxFinite,
  ]) =>
      const LayoutFormat(
        columns: 4,
        gutter: 0,
        leftMargin: 0,
        topMargin: 0,
        rightMargin: 0,
        bottomMargin: 0,
      );
}
