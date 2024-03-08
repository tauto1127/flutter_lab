import 'package:flutter/widgets.dart';

class InheritedCounter extends InheritedWidget {
  final int counter;

  const InheritedCounter({
    Key? key,
    required this.counter,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedCounter oldWidget) => true;
}
