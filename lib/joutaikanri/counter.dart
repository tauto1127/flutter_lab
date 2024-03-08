import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab/joutaikanri/inherited_counter.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Text(
            style: TextStyle(color: Colors.blue),
            //もちろんofを使ってもいい
            context
                .dependOnInheritedWidgetOfExactType<InheritedCounter>()!
                .counter
                .toString(),
          ),
        ],
      ),
    );
  }
}
