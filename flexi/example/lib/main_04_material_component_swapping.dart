import 'package:flexi/flexi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  FlexWidget<MaterialBreakpointId> _buildRailOrMenu() => FlexWidget(
        startWidget: (_) => const AppRail(),
        flexWidgets: {
          MaterialBreakpointId.lg: (_) => const SizedBox(
                width: 256,
                child: AppMenu(),
              ),
        },
      );

  FlexWidget<MaterialBreakpointId> _buildSidebar() => FlexWidget(
        flexWidgets: {
          MaterialBreakpointId.md: (_) => Row(
                children: const [
                  VerticalDivider(thickness: 1, width: 1),
                  SizedBox(
                    width: 256,
                    child: Expanded(child: AppSidebar()),
                  ),
                ],
              )
        },
      );

  @override
  Widget build(BuildContext context) {
    // xs: modal drawer + body + bottom app bar
    // sm: rail + body
    // md: rail + body + sidebar
    // lg: visible drawer + body + sidebar
    return FlexConfig(
      showOverlay: true,
      child: MaterialApp(
        title: 'Flexi Example - Material - Advanced',
        home: FlexWidget(
          startWidget: (_) => Scaffold(
            drawer: const Drawer(child: AppMenu()),
            appBar: AppBar(
              title: const Text('AppBar'),
            ),
            body: const AppBody(),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                )
              ],
            ),
          ),
          flexWidgets: {
            MaterialBreakpointId.sm: (_) => Scaffold(
                  body: Row(
                    children: [
                      _buildRailOrMenu(),
                      const VerticalDivider(thickness: 1, width: 1),
                      const Expanded(child: AppBody()),
                      _buildSidebar(),
                    ],
                  ),
                ),
          },
        ),
      ),
    );
  }
}

class AppMenu extends StatelessWidget {
  const AppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        children: const [
          Text('Menu 1'),
          Text('Menu 2'),
          Text('Menu 3'),
        ],
      );
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
          icon: Icon(Icons.favorite),
          label: Text('Favorite'),
        ),
      ],
    );
  }
}

class AppSidebar extends StatelessWidget {
  const AppSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Sidebar'));
  }
}

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexContainer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Full screen: ${context.flexi.breakpoint.id}'),
            Builder(
              builder: (context) =>
                  Text('Body: ${context.flexi.breakpoint.id}'),
            ),
          ],
        ),
      ),
    );
  }
}
