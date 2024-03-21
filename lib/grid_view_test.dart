import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

const double containerSize = 100;

// class GridViewTestOmosiro extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       return GridView.count(
//         crossAxisCount:
//             max(constraints.minHeight.toInt(), constraints.minWidth.toInt()) ~/
//                 containerSize.toInt(),
//         children: List.generate(1000000, (index) {
//           return Container(
//             width: containerSize,
//             height: containerSize,
//             color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255),
//                 Random().nextInt(255), 255),
//             child: Text(
//               'Item $index',
//             ),
//           );
//         }),
//       );
//     });
//   }
// }

//なんでGridViewの子Widgetには縦方向の制約があるのか？
class GridViewTest extends StatelessWidget {
  const GridViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      children: [
        Container(color: Colors.orange, height: 100),
        Container(
          color: Colors.green,
          height: 200,
        )
      ],
    );
  }

  Widget columnSample() {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Row(
            children: [
              Container(
                width: constraints.maxWidth / 2,
                height: 700,
                color: Colors.red,
              ),
              Container(
                width: constraints.maxWidth / 2,
                height: 700,
                color: Colors.blue,
              ),
            ],
          ),
          Text(constraints.maxHeight.toString()),
        ],
      );
    });
  }
}

class LearningItemCard extends StatelessWidget {
  final LeaningItem leaningItem;
  const LearningItemCard({super.key, required this.leaningItem});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(constraints.maxWidth / 18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          LayoutBuilder(builder: (context, constraintsssssss) {
            //tip AspectiRatioはheightがinfiniteの場合、widthを基準にしてくれる
            return AspectRatio(
                aspectRatio: 16 / 9,
                child: LayoutBuilder(builder: (context, constraintsss) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  constraintsss.maxWidth / 18),
                              child: leaningItem.imageWidget)),
                    ],
                  );
                }));
          }),
          LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: SelectableText(
                      leaningItem.title,
                      style: TextStyle(fontSize: constraints.maxWidth / 20),
                    ),
                  ),
                  SizedBox(height: constraints.maxWidth / 30),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SelectableText(
                      textAlign: TextAlign.center,
                      leaningItem.description,
                      style: TextStyle(fontSize: constraints.maxWidth / 30),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: constraints.maxWidth / 35,
                        right: constraints.maxWidth / 35,
                        bottom: constraints.maxWidth / 35),
                    child: Row(
                      children: [
                        Expanded(
                            child: SelectableText(
                                textAlign: TextAlign.start,
                                leaningItem.progress.toString().split('.').last,
                                style: TextStyle(
                                    fontSize: constraints.maxWidth / 30))),
                        Expanded(
                          child: SelectableText(
                              textAlign: TextAlign.end,
                              '${leaningItem.date.year}/${leaningItem.date.month}',
                              style: TextStyle(
                                  fontSize: constraints.maxWidth / 30)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ]),
      );
    });
  }
}

class LeaningItem {
  final String title;
  final String description;
  final Image imageWidget;
  final List<Tag> tags;
  final Progress progress;
  final LeaningItemDate date;

  LeaningItem(
      {required this.imageWidget,
      required this.tags,
      required this.progress,
      required this.date,
      required this.title,
      required this.description});
}

class Tag {
  final String name;
  final Color color;
  Tag(this.name, this.color);
}

class LeaningItemDate {
  late final int year;
  late final int month;

  LeaningItemDate(this.year, this.month) {
    if (2000 > year || year > 2200) {
      throw Exception('Year must be between 2000 and 2100');
    }
    if (1 > month || month > 12) {
      throw Exception('Month must be between 1 and 12');
    }
  }
}

enum Progress {
  notStarted,
  inProgress,
  completed,
}
