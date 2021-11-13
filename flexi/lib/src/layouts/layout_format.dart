import 'dart:math';

import 'package:flutter/widgets.dart';

@immutable
class LayoutFormat {
  const LayoutFormat({
    required this.columns,
    required this.gutter,
    required this.leftMargin,
    required this.topMargin,
    required this.rightMargin,
    required this.bottomMargin,
    this.module = const LayoutModule(baseline: 0, rows: 1, gutter: 0),
  })  : assert(columns > 0, 'Columns should be positive.'),
        assert(columns < double.infinity, 'Columns should be finite.'),
        assert(gutter >= 0, 'Gutter should not be negative.'),
        assert(gutter < double.infinity, 'Gutter should be finite.'),
        assert(leftMargin >= 0, 'Margin should not be negative.'),
        assert(leftMargin < double.infinity, 'Margin should be finite.'),
        assert(topMargin >= 0, 'Margin should not be negative.'),
        assert(topMargin < double.infinity, 'Margin should be finite.'),
        assert(rightMargin >= 0, 'Margin should not be negative.'),
        assert(rightMargin < double.infinity, 'Margin should be finite.'),
        assert(bottomMargin >= 0, 'Margin should not be negative.'),
        assert(bottomMargin < double.infinity, 'Margin should be finite.');

  final int columns;
  final double gutter;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;
  final LayoutModule module;

  EdgeInsets get margins => EdgeInsets.fromLTRB(
        leftMargin,
        topMargin,
        rightMargin,
        bottomMargin,
      );

  LayoutFormat copy({
    int? columns,
    double? gutter,
    double? leftMargin,
    double? rightMargin,
    double? topMargin,
    double? bottomMargin,
    LayoutModule? module,
  }) =>
      LayoutFormat(
        columns: columns ?? this.columns,
        gutter: gutter ?? this.gutter,
        leftMargin: leftMargin ?? this.leftMargin,
        topMargin: topMargin ?? this.topMargin,
        rightMargin: rightMargin ?? this.rightMargin,
        bottomMargin: bottomMargin ?? this.bottomMargin,
        module: module ?? this.module,
      );

  /// Returns the width of body region, which doesn't contain margins.
  double bodyWidth(double containerWidth) {
    _assertContainerWidth(containerWidth);

    return containerWidth > 0 ? max(0, containerWidth - margins.horizontal) : 0;
  }

  /// Returns the height of body region, which doesn't contain margins.
  double bodyHeight(double containerHeight) {
    _assertContainerHeight(containerHeight);

    return containerHeight > 0 ? max(0, containerHeight - margins.vertical) : 0;
  }

  Size bodySize(Size containerSize) =>
      Size(bodyWidth(containerSize.width), bodyHeight(containerSize.height));

  int modules(double containerHeight) {
    if (module.height + module.gutter == 0) {
      return -1;
    }

    final bodyHeight = this.bodyHeight(containerHeight);

    if (bodyHeight < module.height) {
      return 0;
    }

    if (bodyHeight <= module.height + module.gutter) {
      return 1;
    }

    // Assume [x] is number of modules current body height can fully contain.
    // Then [y = x + 1] is the minimum number of modules will produce overflow.
    // Assume [b] is current body height, [m] is module height and [g]
    // is module gutter.
    // This statement should be true: mx + g(x - 1) < b < my + g(y - 1).
    // Assume [a] is a number that make the statement truthy:
    // [b = ma + g(a -1)] => [a = (b + g) / (m + g)].
    // Then this statement should be true [x < a < y].
    // It means, [x = a.toInt()].
    return (bodyHeight + module.gutter) ~/ (module.height + module.gutter);
  }

  double columnWidth(double containerWidth) {
    _assertContainerWidth(containerWidth);

    final bodyWidth = this.bodyWidth(containerWidth);
    if (bodyWidth > 0) {
      final totalGutterWidth = (columns - 1) * gutter;
      return bodyWidth > totalGutterWidth
          ? (bodyWidth - totalGutterWidth) / columns
          : 0;
    }

    return 0;
  }

  double regionWidth(int columns, double containerWidth) {
    _assertColumns(columns);
    _assertContainerWidth(containerWidth);

    return columns > 0
        ? columns * columnWidth(containerWidth) + (columns - 1) * gutter
        : 0;
  }

  double regionHeight([int modules = 1]) {
    _assertModules(modules);

    return modules > 0
        ? modules * module.height + (modules - 1) * module.gutter
        : 0;
  }

  double regionSpaceWidth(
    int columns,
    double containerWidth, {
    bool isEdge = false,
  }) {
    _assertColumns(columns);
    _assertContainerWidth(containerWidth);

    final extraGutterCount = isEdge ? 0 : 1;
    return columns * columnWidth(containerWidth) +
        (columns + extraGutterCount) * gutter;
  }

  double regionSpaceHeight(
    int modules, {
    bool isTop = false,
  }) {
    _assertModules(modules);

    final extraGutterCount = isTop ? 0 : 1;
    return modules * module.height +
        (modules + extraGutterCount) * module.gutter;
  }

  void _assertColumns(int columns) {
    assert(columns >= 0, 'Columns ($columns) should not be a negative number.');
    assert(
      columns < double.infinity,
      'Columns ($columns) should be a finite number.',
    );
  }

  void _assertModules(int modules) {
    assert(modules >= 0, 'Modules ($modules) should not be a negative number.');
    assert(
      modules < double.infinity,
      'Modules ($modules) should be a finite number.',
    );
  }

  void _assertContainerWidth(double containerWidth) {
    assert(
      containerWidth >= 0,
      'Container width ($containerWidth) should not be a negative number.',
    );
    assert(
      containerWidth < double.infinity,
      'Container width ($containerWidth) should be a finite number.',
    );
  }

  void _assertContainerHeight(double containerHeight) {
    assert(
      containerHeight >= 0,
      'Container height ($containerHeight) should not be a negative number.',
    );
    assert(
      containerHeight < double.infinity,
      'Container height ($containerHeight) should be a finite number.',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutFormat &&
          runtimeType == other.runtimeType &&
          columns == other.columns &&
          gutter == other.gutter &&
          margins == other.margins &&
          module == other.module;

  @override
  int get hashCode =>
      columns.hashCode ^ gutter.hashCode ^ margins.hashCode ^ module.hashCode;

  @override
  String toString() => 'LayoutFormat{'
      'columns: $columns,'
      ' gutter: $gutter,'
      ' margins: $margins,'
      ' module: $module'
      '}';
}

@immutable
class LayoutModule {
  const LayoutModule({
    required this.baseline,
    required this.rows,
    required this.gutter,
  })  : assert(baseline >= 0, 'Baseline should not be negative.'),
        assert(baseline < double.infinity, 'Baseline should be finite.'),
        assert(rows > 0, 'Rows should be positive.'),
        assert(rows < double.infinity, 'Rows should be finite.'),
        assert(gutter >= 0, 'Gutter should not be negative.'),
        assert(gutter < double.infinity, 'Gutter should be finite.');

  final double baseline;
  final int rows;
  final double gutter;

  double get height => baseline * rows;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutModule &&
          runtimeType == other.runtimeType &&
          baseline == other.baseline &&
          rows == other.rows &&
          gutter == other.gutter;

  @override
  int get hashCode => baseline.hashCode ^ rows.hashCode ^ gutter.hashCode;

  @override
  String toString() =>
      'LayoutModule{baseline: $baseline, rows: $rows, gutter: $gutter}';
}
