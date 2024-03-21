import 'package:flutter/material.dart';
import 'package:flutter_lab/CreateGapWidget/gap.dart';
import 'package:flutter_lab/access_parent_from_child.dart';
import 'package:flutter_lab/expand.dart';
import 'package:flutter_lab/grid_view_test.dart';
import 'package:flutter_lab/jisaku_column.dart';
import 'package:flutter_lab/joutaikanri/counter.dart';
import 'package:flutter_lab/joutaikanri/inherited_counter.dart';

void main() {
  runApp(
      Directionality(textDirection: TextDirection.ltr, child: GapTest()));
}
