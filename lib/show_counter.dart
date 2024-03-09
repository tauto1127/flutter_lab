import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab/joutaikanri/counter.dart';
import 'package:flutter_lab/joutaikanri/inherited_counter.dart';

class ShowCounter extends StatelessWidget {
  const ShowCounter({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Builder(builder: (context) {
            return Text(Counter.of(context).counter.toString());
          }),
          //ofは中身はdependOnInheritedWidgetOfExactTypeなので，再描画される
          Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Counter.of(context).increment();
              },
              child: Text("increment"),
            );
          }),
          //getElementだと再描画されない
          Builder(builder: (context) {
            return Text(((context
                        .getElementForInheritedWidgetOfExactType<
                            InheritedCounter>()!
                        .widget as InheritedCounter)
                    .counter
                    .counter)
                .toString());
          }),
        ],
      ),
    );
  }
}
