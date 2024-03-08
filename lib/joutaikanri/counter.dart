import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab/joutaikanri/inherited_counter.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, required this.child});

  final Widget child;

  static CounterState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedCounter>()!
        .counter;
  }

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
      counter: this,
      child: widget.child,
    );
  }
}
