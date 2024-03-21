import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class _RenderGap extends RenderBox {
  _RenderGap({
    double? mainAxisExtent,
  }) : _mainAxisExtent = mainAxisExtent!;

  double get mainAxisExtent => _mainAxisExtent;
  double _mainAxisExtent;

  set mainAxisExtent(double value) {
    if (_mainAxisExtent != value) {
      _mainAxisExtent = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    if (parent is RenderFlex) {
      final RenderFlex flex = parent! as RenderFlex;
      if (flex.direction == Axis.horizontal) {
        size = constraints.constrain(Size(mainAxisExtent, 0));
      } else {
        size = constraints.constrain(Size(0, mainAxisExtent));
      }
    } else {
      throw FlutterError('Gap widget is not inside a Flex Parent');
    }
  }
}

class Gap extends LeafRenderObjectWidget {
  const Gap(
    this.mainAxisExtent, {
    Key? key,
  })  : assert(mainAxisExtent >= 0 && mainAxisExtent < double.infinity),
        super(key: key);
  final double mainAxisExtent;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderGap(mainAxisExtent: mainAxisExtent);
  }

  @override
  void updateRenderObject(BuildContext context, _RenderGap renderObject) {
    renderObject.mainAxisExtent = mainAxisExtent;
  }
}

class GapTest extends StatelessWidget {
  const GapTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('This is testing the Gap widget'),
              Gap(30),
              Text('Notice the gap between me and the text above me, its vertical'),
              Gap(30),
              Text('Now lets look at it working horizontally'),
              Gap(16),
              Row(
                children: [
                  Text('First Text inside the Row'),
                  Gap(16),
                  Text(
                    'Second Text inside Row',
                    maxLines: 3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
