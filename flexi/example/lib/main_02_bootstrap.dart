import 'package:flexi/flexi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const FlexLayout(
        layout: BootstrapLayout(),
        child: MaterialApp(
          title: 'Flexi Example - Bootstrap',
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
