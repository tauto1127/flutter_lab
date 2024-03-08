import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccessParentFromChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Expanded(child: Container(color: Colors.blue), flex: 1),
          Spacer(),
          Expanded(
            child: Container(color: Colors.red),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
