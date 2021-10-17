import 'package:flutter/widgets.dart';

import '../index.dart';

class FlexWidget<BreakpointId extends Enum> extends StatelessWidget {
  FlexWidget({
    Key? key,
    required WidgetBuilder startWidget,
    Map<BreakpointId, WidgetBuilder>? flexWidgets,
  }) : this._value(
          key: key,
          flexValue: FlexValue(startWidget, flexWidgets),
        );

  const FlexWidget._value({
    Key? key,
    required FlexValue<BreakpointId, WidgetBuilder> flexValue,
  })  : _flexValue = flexValue,
        super(key: key);

  final FlexValue<BreakpointId, WidgetBuilder> _flexValue;

  @override
  Widget build(BuildContext context) {
    final widgetBuilder = _flexValue.get(context);
    return widgetBuilder(context);
  }
}
