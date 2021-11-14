import 'package:flutter/widgets.dart';

import '../index.dart';

// TODO(xuan): code generation

Map<MaterialBreakpointId, FlexValueBuilder<V>> _getFlexValues<V>(
  FlexValueBuilder<V>? sm8,
  FlexValueBuilder<V>? sm12,
  FlexValueBuilder<V>? md,
  FlexValueBuilder<V>? lg,
) {
  final flexValues = <MaterialBreakpointId, FlexValueBuilder<V>>{};

  if (sm8 != null) {
    flexValues[MaterialBreakpointId.sm8] = sm8;
  }
  if (sm12 != null) {
    flexValues[MaterialBreakpointId.sm12] = sm12;
  }
  if (md != null) {
    flexValues[MaterialBreakpointId.md] = md;
  }
  if (lg != null) {
    flexValues[MaterialBreakpointId.lg] = lg;
  }
  return Map.unmodifiable(flexValues);
}

class MatFlexWidget extends StatelessWidget {
  const MatFlexWidget({
    Key? key,
    this.xs,
    this.sm8,
    this.sm12,
    this.md,
    this.lg,
    this.flexiContext,
  }) : super(key: key);

  final FlexValueBuilder<Widget>? xs;
  final FlexValueBuilder<Widget>? sm8;
  final FlexValueBuilder<Widget>? sm12;
  final FlexValueBuilder<Widget>? md;
  final FlexValueBuilder<Widget>? lg;
  final Flexi? flexiContext;

  @override
  Widget build(BuildContext context) => FlexWidget(
        key: key,
        flexiContext: flexiContext,
        startWidget: xs,
        flexWidgets: _getFlexValues(
          sm8,
          sm12,
          md,
          lg,
        ),
      );
}

class MatFlexValue<V> implements FlexValue<MaterialBreakpointId, V> {
  const MatFlexValue({
    required this.xs,
    this.sm8,
    this.sm12,
    this.md,
    this.lg,
  });

  final FlexValueBuilder<V> xs;
  final FlexValueBuilder<V>? sm8;
  final FlexValueBuilder<V>? sm12;
  final FlexValueBuilder<V>? md;
  final FlexValueBuilder<V>? lg;

  FlexValue<MaterialBreakpointId, V> get _flexValue => FlexValue(
        xs,
        _getFlexValues(
          sm8,
          sm12,
          md,
          lg,
        ),
      );

  @override
  V get(BuildContext context) => _flexValue.get(context);

  @override
  FlexValueBuilder<V> getBuilder(BuildContext context) =>
      _flexValue.getBuilder(context);
}
