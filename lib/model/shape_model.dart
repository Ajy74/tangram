
import 'package:flutter/material.dart';
import 'package:tangram_demo/model/position_model.dart';

// class ShapeModel {
//   bool isPlaced = false;
//   final int id;
//   final double height;
//   final double width;
//   final PositionModel targetPosition;
//   final PositionModel position;
//   final Color color;
//   Color targetColor;
//   final CustomClipper<Path> shape;
//   final double rotationAngle;

//   ShapeModel({
//     required this.height,
//     required this.width,
//     required this.id,
//     required this.targetPosition,
//     required this.position,
//     required this.color,
//     required this.targetColor,
//     required this.shape,
//     required this.rotationAngle,
//   });
// }


class ShapeModel {
  bool isPlaced = false;
  final int id;
  final double height;
  final double width;
  final PositionModel targetPosition;
  final PositionModel position;
  final PositionModel initialPosition; 
  final Color color;
  Color targetColor;
  final CustomClipper<Path> shape;
  final double rotationAngle;

  ShapeModel({
    required this.height,
    required this.width,
    required this.id,
    required this.targetPosition,
    required this.position,
    required this.initialPosition, // Initialize this field
    required this.color,
    required this.targetColor,
    required this.shape,
    required this.rotationAngle,
  });
}

