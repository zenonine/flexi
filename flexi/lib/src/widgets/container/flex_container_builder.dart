import 'package:flexi/flexi.dart';
import 'package:flutter/widgets.dart';

class FlexContainerBuilder extends StatelessWidget {
  const FlexContainerBuilder({
    Key? key,
    this.name,
    required this.layout,
    required this.builder,
    this.fullSize = true,
  }) : super(key: key);

  final String? name;
  final Layout layout;
  final WidgetBuilder builder;
  final bool fullSize;

  @override
  Widget build(BuildContext context) => FlexContainer(
        name: name,
        layout: layout,
        fullSize: fullSize,
        child: Builder(builder: builder),
      );
}
