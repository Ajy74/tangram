
import 'package:flutter/material.dart';
import 'package:tangram_demo/data/levels.dart';
import 'package:tangram_demo/model/level_model.dart';
import 'package:tangram_demo/model/shape_model.dart';
import 'package:tangram_demo/widget/shape_widget.dart';
import 'package:tangram_demo/widget/target_widget.dart';

class LevelPage extends StatefulWidget {
  static const routeName = '/level_page';
  static int shapeCount = 0;
  final bool isGameStart;

  final List<ShapeModel> level =
      Levels().levels[LevelModel.currentLevel].shapes;

  static int? shapeOfCount;

  LevelPage({required this.isGameStart}) {
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
      child: GestureDetector(
        onTap: () {
          _showSnackBar();
        },
        onHorizontalDragStart: (details) {
          _showSnackBar();
        },
        onVerticalDragStart: (details) {
          _showSnackBar();
        },
        child: Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
          child: Stack(children: [
            ...widget.level.map((e) => TargetWidget(shapeModel: e)),
            ...widget.level.map((e) => ShapeWidget(shapeModel: e)),
            
            if (!widget.isGameStart)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: Text(
                    'Please start the game first!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void _showSnackBar() {
    if(!widget.isGameStart){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please start the game first!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
