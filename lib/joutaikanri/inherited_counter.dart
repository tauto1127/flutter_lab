import 'package:flutter/widgets.dart';
import 'package:flutter_lab/joutaikanri/counter.dart';

class InheritedCounter extends InheritedWidget {
  final CounterState counter;

  const InheritedCounter({
    Key? key,
    required this.counter,
    required Widget child,
  }) : super(key: key, child: child);

  //stateが変わったら，子供のwidgetに再描画を促すか？
  @override
  bool updateShouldNotify(covariant InheritedCounter oldWidget) => true;
}
