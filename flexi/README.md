<div align="center">
  <a href="https://pub.dev/packages/flexi">
    <img src="https://raw.githubusercontent.com/zenonine/flexi/master/assets/flexi-logo-shadow.png" alt="Flexi" height="150" />
  </a>

  <p>
    Beside Material and Bootstrap breakpoint systems, Flexi allows to create your own layout easily.
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

# Flutter/Dart compatibility

| Flexi               | Flutter               | Dart                |
| :------------------ | :-------------------- | :------------------ |
| Flexi 0.1.0 - newer | Flutter 2.0.0 - newer | Dart 2.12.0 - newer |

# Installing - pubspec.yaml

```yaml
dependencies:
  flexi: <latest-version>
```

# [Example 1 - Material - Zero Configuration](https://github.com/zenonine/flexi/blob/master/flexi/example/lib/main_01_material_zero_configuration.dart)

Without any configuration, material layout by default is applied to your whole screen.

```dart
import 'package:flexi/flexi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.flexi.breakpoint.id.toString()));
  }
}
```

# [Example 2 - Material - Standard Layout](https://github.com/zenonine/flexi/blob/master/flexi/example/lib/main_02_material_advanced.dart)

For each breakpoint, use recommended layout from material guideline.

* xs: modal drawer + body + bottom app bar
* sm: rail + body
* md: rail + body + sidebar
* lg: visible drawer + body + sidebar