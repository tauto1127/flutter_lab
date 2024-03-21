import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class VerticalList extends MultiChildRenderObjectWidget {
  VerticalList({
    super.key,
    required List<Widget> children,
    Padding padding = const Padding(padding: EdgeInsets.all(8)),
  }) : super(children: children);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderVerticalList();
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderVerticalList renderObject) {
    renderObject.markNeedsLayout();
  }
}

class RenderVerticalList extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, VerticalListParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, VerticalListParentData> {
  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! VerticalListParentData) {
      child.parentData = VerticalListParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;
    RenderBox? child = firstChild;
    double verticalOffset = 0;
    double horizontalOffset = 30;
    while (child != null) {
      final childParentData = child.parentData as VerticalListParentData;
      child.layout(BoxConstraints(maxWidth: size.width), parentUsesSize: true);
      childParentData.offset = Offset(horizontalOffset, verticalOffset);
      verticalOffset += child.size.height;
      print("描画します：" + child.toString());
      child = childParentData.nextSibling;
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}

class VerticalListParentData extends ContainerBoxParentData<RenderBox> {}

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
