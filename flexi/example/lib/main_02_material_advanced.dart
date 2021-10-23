import 'package:flexi/flexi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // xs: bottom app bar + hidden drawer
    // sm: left rail
    // md: left rail + right column
    // lg: full drawer + right column
    return FlexConfig(
      showOverlay: true,
      child: MaterialApp(
        title: 'Flexi Example 02 - Material - Advanced',
        home: Builder(builder: (context) {
          // final breakpointId = context.flexi.breakpoint.id;
          return FlexWidget(
            startWidget: (_) => FlexContainer(
              child: Scaffold(
                drawer: const Drawer(child: Text('Drawer')),
                appBar: AppBar(
                  title: const Text('AppBar'),
                ),
                body: const HomePage(),
              ),
            ),
            flexWidgets: {
              MaterialBreakpointId.sm: (_) => Scaffold(
                    body: Row(
                      children: const [
                        AppRail(),
                        VerticalDivider(thickness: 1, width: 1),
                        Expanded(child: FlexContainer(child: HomePage())),
                      ],
                    ),
                  ),
            },
          );
        }),
      ),
    );
  }
}

class AppRail extends StatefulWidget {
  const AppRail({Key? key}) : super(key: key);

  @override
  State<AppRail> createState() => _AppRailState();
}

class _AppRailState extends State<AppRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) => setState(() {
        _selectedIndex = index;
      }),
      labelType: NavigationRailLabelType.all,
      destinations: const [
        NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
        NavigationRailDestination(
            icon: Icon(Icons.favorite), label: Text('Favorite')),
      ],
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
