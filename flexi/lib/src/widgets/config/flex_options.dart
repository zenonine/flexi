import 'package:flutter/widgets.dart';

@immutable
class FlexOptions {
  const FlexOptions({
    this.showOverlay = false,
    this.showMargins = false,
    this.showColumns = true,
    this.showModules = false,
    this.showBaselines = false,
    this.style = const FlexOverlayStyle(),
  });

  final bool showOverlay;
  final bool showMargins;
  final bool showColumns;
  final bool showModules;
  final bool showBaselines;

  final FlexOverlayStyle style;

  FlexOptions copy({
    bool? showOverlay,
    bool? showMargins,
    bool? showColumns,
    bool? showModules,
    bool? showBaselines,
    FlexOverlayStyle? style,
  }) =>
      FlexOptions(
        showOverlay: showOverlay ?? this.showOverlay,
        showMargins: showMargins ?? this.showMargins,
        showColumns: showColumns ?? this.showColumns,
        showModules: showModules ?? this.showModules,
        showBaselines: showBaselines ?? this.showBaselines,
        style: style ?? this.style,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FlexOptions &&
              runtimeType == other.runtimeType &&
              showOverlay == other.showOverlay &&
              showMargins == other.showMargins &&
              showColumns == other.showColumns &&
              showModules == other.showModules &&
              showBaselines == other.showBaselines &&
              style == other.style;

  @override
  int get hashCode =>
      showOverlay.hashCode ^
      showMargins.hashCode ^
      showColumns.hashCode ^
      showModules.hashCode ^
      showBaselines.hashCode ^
      style.hashCode;

  @override
  String toString() {
    return 'FlexOptions{'
        'showOverlay: $showOverlay,'
        ' showMargins: $showMargins,'
        ' showColumns: $showColumns,'
        ' showModules: $showModules,'
        ' showBaselines: $showBaselines,'
        ' style: $style'
        '}';
  }
}

@immutable
class FlexOverlayStyle {
  const FlexOverlayStyle({
    this.marginColor = const Color(0x262196F3),
    this.columnColor = const Color(0x26F44336),
    this.columnBorderColor = const Color(0x4DF44336),
    this.gutterColor = const Color(0x264CAF50),
    this.moduleColor = const Color(0x4DF44336),
    this.moduleGutterColor = const Color(0x269C27B0),
    this.baselineColor = const Color(0x26F44336),
  });

  final Color marginColor;
  final Color columnColor;
  final Color columnBorderColor;
  final Color gutterColor;
  final Color moduleColor;
  final Color moduleGutterColor;
  final Color baselineColor;

  FlexOverlayStyle copy({
    Color? marginColor,
    Color? columnColor,
    Color? columnBorderColor,
    Color? gutterColor,
    Color? moduleColor,
    Color? moduleGutterColor,
    Color? baselineColor,
  }) =>
      FlexOverlayStyle(
        marginColor: marginColor ?? this.marginColor,
        columnColor: columnColor ?? this.columnColor,
        columnBorderColor: columnBorderColor ?? this.columnBorderColor,
        gutterColor: gutterColor ?? this.gutterColor,
        moduleColor: moduleColor ?? this.moduleColor,
        moduleGutterColor: moduleGutterColor ?? this.moduleGutterColor,
        baselineColor: baselineColor ?? this.baselineColor,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FlexOverlayStyle &&
              runtimeType == other.runtimeType &&
              marginColor == other.marginColor &&
              columnColor == other.columnColor &&
              columnBorderColor == other.columnBorderColor &&
              gutterColor == other.gutterColor &&
              moduleColor == other.moduleColor &&
              moduleGutterColor == other.moduleGutterColor &&
              baselineColor == other.baselineColor;

  @override
  int get hashCode =>
      marginColor.hashCode ^
      columnColor.hashCode ^
      columnBorderColor.hashCode ^
      gutterColor.hashCode ^
      moduleColor.hashCode ^
      moduleGutterColor.hashCode ^
      baselineColor.hashCode;

  @override
  String toString() {
    return 'FlexOverlayStyle{'
        'marginColor: $marginColor,'
        ' columnColor: $columnColor,'
        ' columnBorderColor: $columnBorderColor,'
        ' gutterColor: $gutterColor,'
        ' moduleColor: $moduleColor,'
        ' moduleGutterColor: $moduleGutterColor,'
        ' baselineColor: $baselineColor'
        '}';
  }
}
