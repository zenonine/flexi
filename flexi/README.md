<div align="center">
  <a href="https://pub.dev/packages/flexi">
    <img src="https://raw.githubusercontent.com/zenonine/flexi/master/assets/flexi-logo-shadow.png" alt="Flexi" height="150" />
  </a>

  <p>
    Beside predefined breakpoint systems, such as Material,
    you can create your fixed and responsive layout for different grid types:
    Manuscript, Columns, Modular and Baseline.
  </p>

  <div>
    <a href="https://pub.dev/packages/flexi">
      <img src="https://img.shields.io/pub/v/flexi.svg" alt="pub package">
    </a>
    <a href="https://opensource.org/licenses/BSD-3-Clause">
      <img src="https://img.shields.io/badge/License-BSD_3--Clause-blue.svg" alt="license">
    </a>
    <a href="https://github.com/zenonine/flexi/actions/workflows/verify-flexi.yml">
      <img src="https://github.com/zenonine/flexi/actions/workflows/verify-flexi.yml/badge.svg?branch=master" alt="verify flexi">
    </a>
    <a href="https://codecov.io/gh/zenonine/flexi" target="_blank">
      <img src="https://codecov.io/gh/zenonine/flexi/branch/master/graph/badge.svg?token=9BC8HAHKKL" alt="code coverage"/>
    </a>
  </div>
</div>

---

* [Flutter/Dart compatibility](#flutterdart-compatibility)
* [Installing - pubspec.yaml](#installing---pubspecyaml)
* [Examples](#examples)
  * [Example 1 - Predefined Layouts](#example-1---predefined-layouts)
  * [Example 2 - Custom Layout](#example-2---custom-layout)
  * [Example 3 - Component Swapping](#example-3---component-swapping)
* [Usage](#usage)
* [FAQs](#faqs)

# Flutter/Dart compatibility

| Flexi               | Flutter               | Dart                |
| :------------------ | :-------------------- | :------------------ |
| Flexi 0.1.0 - newer | Flutter 2.0.0 - newer | Dart 2.12.0 - newer |

# Installing - pubspec.yaml

```yaml
dependencies:
  flexi: <latest-version>
```

# Examples

[Source code][e0]

## Example 1 - Predefined Layouts

[Source code][e1]

```dart
import 'package:flexi/flexi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const MaterialApp(
        title: 'Flexi Example - Predefined Layouts',
        home: FlexContainer(
          // See also other predefined layouts:
          // BootstrapLayout, CarbonLayout, RuleOfThirdsLayout and FluidLayout
          layout: MaterialLayout(),
          child: Scaffold(body: HomePage()),
        ),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Center(child: Text(context.flexi.breakpoint.toString()));
}
```

## Example 2 - Custom Layout

[Source code][e2]

To create your custom layout, you only need to
extend [Layout](https://github.com/zenonine/flexi/blob/master/flexi/lib/src/layouts/layout.dart) class. Using your
custom layout is similar to previous example. You can learn more from
[MaterialLayout](https://github.com/zenonine/flexi/blob/master/flexi/lib/src/layouts/material_layout.dart)
, [BootstrapLayout](https://github.com/zenonine/flexi/blob/master/flexi/lib/src/layouts/bootstrap_layout.dart) and
other [predefined layouts](https://github.com/zenonine/flexi/tree/master/flexi/lib/src/layouts).

```dart
import 'dart:collection';

import 'package:flexi/flexi.dart';

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
  LayoutFormat format(double containerWidth, [
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
```

## Example 3 - Component Swapping

[Source code][e3]

In this example, each breakpoint uses a recommended layout from material guideline.

* xs: modal drawer (app bar) + body + bottom app bar
* sm: rail + body
* md: rail + body + sidebar
* lg: visible drawer + body + sidebar

# Usage

# FAQs

[e0]: https://github.com/zenonine/flexi/tree/master/flexi/example/lib

[e1]: https://github.com/zenonine/flexi/blob/master/flexi/example/lib/main_01_predefined_layout.dart

[e2]: https://github.com/zenonine/flexi/blob/master/flexi/example/lib/main_02_custom_layout.dart

[e3]: https://github.com/zenonine/flexi/blob/master/flexi/example/lib/main_03_material_component_swapping.dart