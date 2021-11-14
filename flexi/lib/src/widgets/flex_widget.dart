import 'package:flutter/widgets.dart';

import '../index.dart';

class FlexWidget<BreakpointId extends Enum> extends StatelessWidget {
  FlexWidget({
    Key? key,
    FlexValueBuilder<Widget>? startWidget,
    Map<BreakpointId, FlexValueBuilder<Widget>>? flexWidgets,
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
    required FlexValue<BreakpointId, Widget> flexValue,
    this.flexiContext,
  })  : _flexValue = flexValue,
        super(key: key);

  final FlexValue<BreakpointId, Widget> _flexValue;
  final Flexi? flexiContext;

  @override
  Widget build(BuildContext context) {
    final widgetBuilder =
        _flexValue.getBuilder(flexiContext?.context ?? context);
    return widgetBuilder(context);
  }
}
