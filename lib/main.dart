import 'package:flutter/material.dart';
import 'package:flutter_lab/access_parent_from_child.dart';
import 'package:flutter_lab/expand.dart';
import 'package:flutter_lab/jisaku_column.dart';
import 'package:flutter_lab/joutaikanri/counter.dart';
import 'package:flutter_lab/joutaikanri/inherited_counter.dart';

void main() {
  runApp(Directionality(
      textDirection: TextDirection.ltr, child: Counter(child: ShowMyColumn())));
}

class ShowMyColumn extends StatelessWidget {
  const ShowMyColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalList(children: [
      Text("aiueo"),
      Text("kakikukeko"),
    ]);
  }
}
