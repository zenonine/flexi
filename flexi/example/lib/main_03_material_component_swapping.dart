import 'package:flexi/flexi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Widget _buildRailOrMenu() => MatFlexWidget(
        xs: (_) => const AppRail(),
        lg: (_) => const SizedBox(
          width: 256,
          child: AppMenu(),
        ),
      );

  Widget _buildSidebar() => MatFlexWidget(
        md: (_) => Row(
          children: const [
            VerticalDivider(thickness: 1, width: 1),
            SizedBox(
              width: 256,
              child: AppSidebar(),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    // xs: modal drawer + body + bottom app bar
    // sm: rail + body
    // md: rail + body + sidebar
    // lg: visible drawer + body + sidebar
    return MaterialApp(
      title: 'Flexi Example - Component Swapping',
      home: FlexContainer(
        layout: const MaterialLayout(),
        child: MatFlexWidget(
          xs: (_) => Scaffold(
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
          sm8: (_) => Scaffold(
            body: Row(
              children: [
                _buildRailOrMenu(),
                const VerticalDivider(thickness: 1, width: 1),
                const Expanded(child: AppBody()),
                _buildSidebar(),
              ],
            ),
          ),
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
  Widget build(BuildContext context) => NavigationRail(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        labelType: NavigationRailLabelType.all,
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.favorite),
            label: Text('Favorite'),
          ),
        ],
      );
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
    return FlexConfig(
      showOverlay: kDebugMode,
      child: FlexContainerBuilder(
        fullSize: false,
        layout: const MaterialLayout(),
        builder: (context) {
          return SingleChildScrollView(
            child: Wrap(
              spacing: context.flexi.regionSpaceWidth(
                columns: MatFlexValue(
                  xs: (_) => 0,
                  sm8: (_) => 2,
                ).get(context),
              ),
              runSpacing: context.flexi.gutter,
              children: List.generate(
                4,
                (index) => SizedBox(
                  width: context.flexi.regionWidth(
                    columns: MatFlexValue(
                      xs: (_) => 4,
                      sm8: (_) => 3,
                      sm12: (_) => 5,
                    ).get(context),
                  ),
                  height: 200,
                  child: Container(
                    color: Colors.blue,
                    child: Text('$index'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
