import 'package:flutter/material.dart';
import 'package:flutter_lab/access_parent_from_child.dart';
import 'package:flutter_lab/expand.dart';
import 'package:flutter_lab/joutaikanri/counter.dart';
import 'package:flutter_lab/joutaikanri/inherited_counter.dart';

void main() {
  runApp(Directionality(
      textDirection: TextDirection.ltr, child: Counter(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
