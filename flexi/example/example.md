```yaml
dependencies:
  flexi: <latest-version>
```

Without any configuration, material layout by default is applied to your whole screen and ready to be used.

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