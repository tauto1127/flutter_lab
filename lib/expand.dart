import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class aboutExpand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Expanded(
              child: ColoredBox(
                color: Colors.blue,
                child: Text("あいうえお"),
              ),
              flex: 2),
          Spacer(),
          TextButton(
            child: Text("再描画"),
            onPressed: () {
              StatelessElement element = context as StatelessElement;
              element.markNeedsBuild();
              print("pressed");
            },
          ),
          ColorfulIconButton()
        ],
      ),
    );
  }
}

class ColorfulIconButton extends StatefulWidget {
  @override
  _ColorfulIconButtonState createState() => _ColorfulIconButtonState();
}

class _ColorfulIconButtonState extends State<ColorfulIconButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: Text("再描画"),
          onPressed: () {
            (context as StatefulElement).markNeedsBuild();

            print(Directionality.of(context).toString());
          },
        ),
        IconButton(
          icon: Icon(Icons.favorite),
          color: isPressed ? Colors.red : Colors.grey,
          onPressed: () {
            var ai = (context as StatefulElement)
                .dependOnInheritedWidgetOfExactType<InheritedWidget>();
            print(ai.toString());
            isPressed = !isPressed;
          },
        ),
      ],
    );
  }
}
