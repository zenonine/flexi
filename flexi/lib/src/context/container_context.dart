import 'package:flutter/widgets.dart';

import '../index.dart';

@immutable
class ContainerContext {
  const ContainerContext({
    this.name,
    this.isRoot = false,
    required this.layout,
    required this.context,
    required this.constraints,
  });

  final String? name;
  final bool isRoot;
  final Layout layout;
  final BuildContext context;
  final BoxConstraints constraints;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContainerContext &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          isRoot == other.isRoot &&
          layout == other.layout &&
          context == other.context &&
          constraints == other.constraints;

  @override
  int get hashCode =>
      name.hashCode ^
      isRoot.hashCode ^
      layout.hashCode ^
      context.hashCode ^
      constraints.hashCode;
}

@immutable
class InnerContainerContext {
  const InnerContainerContext({
    this.name,
    this.isRoot = false,
    required this.context,
  });

  final String? name;
  final bool isRoot;
  final BuildContext context;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InnerContainerContext &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          isRoot == other.isRoot &&
          context == other.context;

  @override
  int get hashCode => name.hashCode ^ isRoot.hashCode ^ context.hashCode;
}
