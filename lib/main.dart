import 'package:flutter/material.dart';
import 'package:flutter_lab/access_parent_from_child.dart';
import 'package:flutter_lab/expand.dart';
import 'package:flutter_lab/joutaikanri/counter.dart';
import 'package:flutter_lab/joutaikanri/inherited_counter.dart';

void main() {
  runApp(InheritedCounter(
    child: MyApp(),
    counter: 100,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Counter();
  }
}
