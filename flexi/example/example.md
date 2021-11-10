```yaml
dependencies:
  flexi: <latest-version>
```

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