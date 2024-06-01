
import 'package:flutter/material.dart';
import 'package:tangram_demo/data/levels.dart';
import 'package:tangram_demo/model/level_model.dart';
import 'package:tangram_demo/model/shape_model.dart';
import 'package:tangram_demo/widget/shape_widget.dart';
import 'package:tangram_demo/widget/target_widget.dart';

class LevelPage extends StatefulWidget {
  static const routeName = '/level_page';
  static int shapeCount = 0;

  final List<ShapeModel> level =
      Levels().levels[LevelModel.currentLevel].shapes;

  static int? shapeOfCount;

  LevelPage() {
    shapeOfCount = Levels().levels[LevelModel.currentLevel].shapeOfCount;
    shapeCount = 0;
  }

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        ...widget.level.map((e) => TargetWidget(shapeModel: e)),
        ...widget.level.map((e) => ShapeWidget(shapeModel: e)),
      ]),
    );
  }
}
