import 'dart:math';

import 'package:flutter/widgets.dart';

class LayoutFormat {
  const LayoutFormat({
    required this.columns,
    required this.gutter,
    required this.leftMargin,
    required this.topMargin,
    required this.rightMargin,
    required this.bottomMargin,
    this.module = const LayoutModule(baseline: 0, rows: 1, gutter: 0),
  })  : assert(columns > 0),
        assert(columns < double.infinity),
        assert(gutter >= 0),
        assert(gutter < double.infinity),
        assert(leftMargin >= 0),
        assert(leftMargin < double.infinity),
        assert(topMargin >= 0),
        assert(topMargin < double.infinity),
        assert(rightMargin >= 0),
        assert(rightMargin < double.infinity),
        assert(bottomMargin >= 0),
        assert(bottomMargin < double.infinity);

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

    return containerWidth > 0
        ? max(0, containerWidth - leftMargin - rightMargin)
        : 0;
  }

  /// Returns the height of body region, which doesn't contain margins.
  double bodyHeight(double containerHeight) {
    _assertContainerHeight(containerHeight);

    return containerHeight > 0
        ? max(0, containerHeight - topMargin - bottomMargin)
        : 0;
  }

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
    // Assume [b] is current body height, [m] is module height and [g] is module gutter.
    // This statement should be true: mx + g(x - 1) < b < my + g(y - 1).
    // Assume [a] is a number that make the statement truthy: [b = ma + g(a -1)] => [a = (b + g) / (m + g)].
    // Then this statement should be true [x < a < y].
    // It means, [x = a.toInt()].
    return (bodyHeight + module.gutter) ~/ (module.height + module.gutter);
  }

  double columnWidth(double containerWidth) {
    _assertContainerWidth(containerWidth);

    final bodyWidth = this.bodyWidth(containerWidth);
    if (bodyWidth > 0) {
      final double totalGutterWidth = (columns - 1) * gutter;
      return (bodyWidth - totalGutterWidth) / columns;
    }

    return 0;
  }

  double regionWidth(int columns, double containerWidth) {
    assert(columns >= 0, 'Columns ($columns) should not be a negative number.');
    assert(columns < double.infinity,
        'Columns ($columns) should be a finite number.');
    _assertContainerWidth(containerWidth);

    return columns > 0
        ? columns * columnWidth(containerWidth) + (columns - 1) * gutter
        : 0;
  }

  double regionHeight([int modules = 1]) {
    assert(modules >= 0, 'Modules ($modules) should not be a negative number.');
    assert(modules < double.infinity,
        'Modules ($modules) should be a finite number.');

    return modules > 0
        ? modules * module.height + (modules - 1) * module.gutter
        : 0;
  }

  void _assertContainerWidth(double containerWidth) {
    assert(containerWidth >= 0,
        'Container width ($containerWidth) should not be a negative number.');
    assert(containerWidth < double.infinity,
        'Container width ($containerWidth) should be a finite number.');
  }

  void _assertContainerHeight(double containerHeight) {
    assert(containerHeight >= 0,
        'Container height ($containerHeight) should not be a negative number.');
    assert(containerHeight < double.infinity,
        'Container height ($containerHeight) should be a finite number.');
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutFormat &&
          runtimeType == other.runtimeType &&
          columns == other.columns &&
          gutter == other.gutter &&
          leftMargin == other.leftMargin &&
          rightMargin == other.rightMargin &&
          topMargin == other.topMargin &&
          bottomMargin == other.bottomMargin &&
          module == other.module;

  @override
  int get hashCode =>
      columns.hashCode ^
      gutter.hashCode ^
      leftMargin.hashCode ^
      rightMargin.hashCode ^
      topMargin.hashCode ^
      bottomMargin.hashCode ^
      module.hashCode;

  @override
  String toString() {
    return 'LayoutFormat{columns: $columns, gutter: $gutter, leftMargin: $leftMargin, rightMargin: $rightMargin, topMargin: $topMargin, bottomMargin: $bottomMargin, module: $module}';
  }
}

class LayoutModule {
  const LayoutModule({
    required this.baseline,
    required this.rows,
    required this.gutter,
  })  : assert(baseline >= 0),
        assert(baseline < double.infinity),
        assert(rows > 0),
        assert(rows < double.infinity),
        assert(gutter >= 0),
        assert(gutter < double.infinity);

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
  String toString() {
    return 'LayoutModule{baseline: $baseline, rows: $rows, gutter: $gutter}';
  }
}
