import 'package:flutter/widgets.dart';

import '../index.dart';

class FlexWidget<BreakpointId extends Enum> extends StatelessWidget {
  FlexWidget({
    Key? key,
    WidgetBuilder? startWidget,
    Map<BreakpointId, WidgetBuilder>? flexWidgets,
    Flexi? flexiContext,
  }) : this._value(
          key: key,
          flexValue: FlexValue(
            startWidget ?? (_) => const SizedBox.shrink(),
            flexWidgets,
          ),
          flexiContext: flexiContext,
        );

  const FlexWidget._value({
    Key? key,
    required FlexValue<BreakpointId, WidgetBuilder> flexValue,
    this.flexiContext,
  })  : _flexValue = flexValue,
        super(key: key);

  final FlexValue<BreakpointId, WidgetBuilder> _flexValue;
  final Flexi? flexiContext;

  @override
  Widget build(BuildContext context) {
    final widgetBuilder = _flexValue.get(flexiContext?.context ?? context);
    return widgetBuilder(context);
  }
}
