import 'package:flutter/material.dart';

/// Conditional rendering class
class ConditionalWidget extends StatelessWidget {
  /// Condition to control what gets rendered.
  final bool? condition;

  /// Run if [condition] is true.
  final WidgetBuilder? builder;

  /// Run if [condition] is false and it is not null.
  final WidgetBuilder? fallback;

  const ConditionalWidget({
    Key? key,
    @required this.condition,
    @required this.builder,
    this.fallback,
  })  : assert(condition != null),
        assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return condition ?? true ? builder != null ? builder!(context) : Container() : fallback != null ? fallback!(context) : Container();
  }
}
