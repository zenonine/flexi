import 'package:flutter/widgets.dart';

class ContainerContext {
  const ContainerContext({
    required this.context,
    required this.constraints,
  });

  final BuildContext context;
  final BoxConstraints constraints;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContainerContext &&
          runtimeType == other.runtimeType &&
          context == other.context &&
          constraints == other.constraints;

  @override
  int get hashCode => context.hashCode ^ constraints.hashCode;
}
