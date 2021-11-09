import 'package:flutter/widgets.dart';

import '../../index.dart';

class FlexContainer extends StatefulWidget {
  const FlexContainer({
    Key? key,
    this.name,
    required this.layout,
    required this.child,
    this.fullSize = true,
  }) : super(key: key);

  final String? name;
  final Layout layout;
  final Widget child;
  final bool fullSize;

  @override
  State<FlexContainer> createState() => FlexContainerState();
}

@visibleForTesting
class FlexContainerState extends State<FlexContainer> {
  late FlexOptions options;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    options = context.flexi.options;
  }

  @visibleForTesting
  EdgeInsets getFormatMargins(BuildContext context) =>
      context.flexi.format.margins;

  @visibleForTesting
  EdgeInsets getMargins(BuildContext context) =>
      widget.fullSize ? EdgeInsets.zero : getFormatMargins(context);

  @override
  Widget build(BuildContext context) {
    final isRoot = context.internalFlexi.rootContainerMarkerContext == null;
    return LayoutBuilder(
      builder: (context, constraints) {
        final child = Stack(
          children: [
            Padding(
              padding: getMargins(context),
              child: widget.child,
            ),
            if (options.showOverlay) _FlexOverlay(options: options),
          ],
        );

        return InheritedContainer(
          context: ContainerContext(
            name: widget.name,
            isRoot: isRoot,
            layout: widget.layout,
            context: context,
            constraints: constraints,
          ),
          child: Builder(
            builder: (context) {
              return InheritedInnerContainer(
                context: InnerContainerContext(
                  name: widget.name,
                  isRoot: isRoot,
                  context: context,
                ),
                child: isRoot
                    ? Builder(
                        builder: (context) => InheritedRootContainerMarker(
                          context: context,
                          child: child,
                        ),
                      )
                    : child,
              );
            },
          ),
        );
      },
    );
  }
}

class _FlexOverlay extends StatelessWidget {
  const _FlexOverlay({Key? key, required this.options}) : super(key: key);

  final FlexOptions options;

  @override
  Widget build(BuildContext context) {
    final modules = context.flexi.modules;
    final margins = context.flexi.margins;

    return IgnorePointer(
      child: Stack(
        children: [
          if (options.showColumns)
            Padding(
              padding: margins.copyWith(top: 0, bottom: 0),
              child: _FlexColumnsOverlay(options: options),
            ),
          if (options.showModules && modules >= 0)
            Padding(
              padding: margins.copyWith(left: 0, right: 0),
              child: _FlexModulesOverlay(options: options),
            ),
          if (options.showMargins) _FlexMarginsOverlay(options: options),
        ],
      ),
    );
  }
}

class _FlexMarginsOverlay extends StatelessWidget {
  const _FlexMarginsOverlay({Key? key, required this.options})
      : super(key: key);

  final FlexOptions options;

  BorderSide _createBorderSide(double width) {
    final marginColor = options.style.marginColor;

    return width > 0
        ? BorderSide(color: marginColor, width: width)
        : BorderSide.none;
  }

  @override
  Widget build(BuildContext context) {
    final margins = context.flexi.margins;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: _createBorderSide(margins.top),
          right: _createBorderSide(margins.right),
          bottom: _createBorderSide(margins.bottom),
          left: _createBorderSide(margins.left),
        ),
      ),
    );
  }
}

class _FlexColumnsOverlay extends StatelessWidget {
  const _FlexColumnsOverlay({Key? key, required this.options})
      : super(key: key);

  final FlexOptions options;

  @override
  Widget build(BuildContext context) {
    final columnColor = options.style.columnColor;
    final gutterColor = options.style.gutterColor;
    final columnBorderColor = options.style.columnBorderColor;
    final lastColumnIndex = context.flexi.columns - 1;

    return Row(
      children: List.generate(
        context.flexi.columns,
        (index) {
          Widget? gutterBox;
          if (context.flexi.gutter > 0 && index < lastColumnIndex) {
            gutterBox = SizedBox(
              width: context.flexi.gutter,
              child: Container(color: gutterColor),
            );
          }

          Border? columnBorder;
          if (context.flexi.gutter <= 0) {
            final columnBorderSide =
                BorderSide(color: columnBorderColor, width: 0.5);
            columnBorder = Border.symmetric(vertical: columnBorderSide);
          }

          final Widget columnBox = SizedBox(
            width: context.flexi.columnWidth,
            child: Container(
              decoration: BoxDecoration(
                color: columnColor,
                border: columnBorder,
              ),
            ),
          );

          return Row(
            children: [
              columnBox,
              if (gutterBox != null) gutterBox,
            ],
          );
        },
      ),
    );
  }
}

class _FlexModulesOverlay extends StatelessWidget {
  const _FlexModulesOverlay({Key? key, required this.options})
      : super(key: key);

  final FlexOptions options;

  @override
  Widget build(BuildContext context) {
    final modules = context.flexi.modules;
    final moduleGutterColor = options.style.moduleGutterColor;

    final bodyHeight = context.flexi.bodyHeight;
    final moduleGutter = context.flexi.moduleGutter;
    final extraHeight = bodyHeight - context.flexi.regionHeight(modules);

    return Column(
      children: [
        if (modules == 0)
          Expanded(
            child: _FlexModuleOverlay(options: options, index: 0),
          ),
        if (modules > 0) ...[
          ...List.generate(
            modules,
            (index) {
              return Column(
                children: [
                  SizedBox(
                    height: context.flexi.format.module.height,
                    child: _FlexModuleOverlay(options: options, index: index),
                  ),
                  if (index < modules - 1)
                    SizedBox(
                      height: context.flexi.format.module.gutter,
                      child: Container(color: moduleGutterColor),
                    ),
                ],
              );
            },
          ),

          // Overlay for vertical extra region
          if (extraHeight <= moduleGutter)
            Expanded(child: Container(color: moduleGutterColor)),
          if (extraHeight > moduleGutter) ...[
            SizedBox(
              height: context.flexi.format.module.gutter,
              child: Container(color: moduleGutterColor),
            ),
            Expanded(
              child: _FlexModuleOverlay(options: options, index: modules),
            ),
          ],
        ],
      ],
    );
  }
}

class _FlexModuleOverlay extends StatelessWidget {
  const _FlexModuleOverlay({
    Key? key,
    required this.options,
    required this.index,
  }) : super(key: key);

  final FlexOptions options;
  final int index;

  Widget _buildBaselines(int rows) {
    final baselineColor = options.style.baselineColor;
    return Column(
      children: List.generate(
        rows,
        (index) {
          final isFirst = index == 0;
          final isLast = index >= rows - 1;

          var topBorder = BorderSide(color: baselineColor, width: 0.5);
          var bottomBorder = BorderSide(color: baselineColor, width: 0.5);
          if (isFirst) {
            topBorder = BorderSide.none;
          }
          if (isLast) {
            bottomBorder = BorderSide.none;
          }

          return Expanded(
            child: SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: topBorder,
                    bottom: bottomBorder,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final modules = context.flexi.modules;
    final isExtraModule = modules == 0 || index >= modules;
    final moduleColor = options.style.moduleColor;
    final rows = context.flexi.format.module.rows;
    final moduleHeight = context.flexi.moduleHeight;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: isExtraModule
                ? Border(top: BorderSide(color: moduleColor))
                : Border.symmetric(
                    horizontal: BorderSide(color: moduleColor),
                  ),
          ),
        ),
        if (options.showBaselines)
          isExtraModule
              ? Container(
                  decoration: const BoxDecoration(),
                  clipBehavior: Clip.hardEdge,
                  child: OverflowBox(
                    maxHeight: moduleHeight,
                    alignment: Alignment.topLeft,
                    child: _buildBaselines(rows),
                  ),
                )
              : _buildBaselines(rows),
      ],
    );
  }
}
