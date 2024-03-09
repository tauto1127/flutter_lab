import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class VerticalList extends MultiChildRenderObjectWidget {
  VerticalList({
    super.key,
    required List<Widget> children,
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
    while (child != null) {
      final childParentData = child.parentData as VerticalListParentData;
      child.layout(BoxConstraints(maxWidth: size.width), parentUsesSize: true);
      childParentData.offset = Offset(0, verticalOffset);
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
