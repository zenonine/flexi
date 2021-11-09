import 'package:flexi/src/index.dart';
import 'package:flutter/widgets.dart';

class Flexi {
  const Flexi(this.context);

  final BuildContext context;

  FlexOptions get options => InheritedOptions.of(context);

  Breakpoint? get maybeBreakpoint => layout.breakpoint(containerSize.width);

  /// Throws exception if container width is smaller than smallest breakpoint.
  Breakpoint get breakpoint => maybeBreakpoint!;

  Breakpoint get smallestBreakpoint => layout.smallestBreakpoint;

  Breakpoint get biggestBreakpoint => layout.biggestBreakpoint;

  /// Returns `null` if current breakpoint is the biggest breakpoint.
  Breakpoint? get nextBreakpoint => layout.nextBreakpoint(maybeBreakpoint?.id);

  /// Returns `null` in one of these cases:
  /// * current breakpoint is the smallest breakpoint.
  /// * current container width is smaller than smallest breakpoint.
  Breakpoint? get previousBreakpoint =>
      layout.previousBreakpoint(maybeBreakpoint?.id);

  LayoutFormat get format =>
      layout.format(containerSize.width, containerSize.height);

  int get columns => format.columns;

  double get gutter => format.gutter;

  EdgeInsets get margins => format.margins;

  double get bodyWidth => format.bodyWidth(containerSize.width);

  double get bodyHeight => format.bodyHeight(containerSize.height);

  Size get bodySize => format.bodySize(containerSize);

  double get columnWidth => format.columnWidth(containerSize.width);

//region LayoutModule

  int get modules => format.modules(containerSize.height);

  double get baseline => format.module.baseline;

  int get moduleRows => format.module.rows;

  double get moduleGutter => format.module.gutter;

  double get moduleHeight => format.module.height;

//endregion

//region Region size

  double regionWidth([int columns = 1]) =>
      format.regionWidth(columns, containerSize.width);

  double regionHeight([int modules = 1]) => format.regionHeight(modules);

  Size regionSize({int columns = 1, int modules = 1}) =>
      Size(regionWidth(columns), regionHeight(modules));

//endregion

//region FlexValue

  V value<BreakpointId extends Enum, V>(
    V startValue, [
    Map<BreakpointId, V>? flexValues,
  ]) =>
      FlexValue(startValue, flexValues).get(context);

  V valueBuilder<V>(FlexValueBuilder<V> builder) =>
      FlexValue.builder(builder).get(context);

//endregion

//region Container context
  Size get containerSize =>
      context.internalFlexi.containerContext!.constraints.biggest;

  Layout get layout => context.internalFlexi.containerContext!.layout;

  String? get name => context.internalFlexi.containerContext!.name;

  bool get isRoot => context.internalFlexi.containerContext!.isRoot;

  Flexi? get parent {
    final outerContext = context.internalFlexi.containerContext!.context;
    final parentInnerContainerContext =
        outerContext.internalFlexi.innerContainerContext;
    return parentInnerContainerContext?.context.flexi;
  }

  Flexi get root => context.internalFlexi.rootContainerMarkerContext!.flexi;
//endregion
}

/// Add context shortcut methods to use internally here.
class InternalFlexi extends Flexi {
  const InternalFlexi(BuildContext context) : super(context);

  ContainerContext? get containerContext => InheritedContainer.of(context);

  InnerContainerContext? get innerContainerContext =>
      InheritedInnerContainer.of(context);

  BuildContext? get rootContainerMarkerContext =>
      InheritedRootContainerMarker.of(context);
}

extension FlexiContext on BuildContext {
  Flexi get flexi => Flexi(this);
}

extension InternalFlexiContext on BuildContext {
  InternalFlexi get internalFlexi => InternalFlexi(this);
}
