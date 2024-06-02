
import 'package:flutter/material.dart';
import 'package:tangram_demo/model/shape_model.dart';

class ShapeWidget extends StatefulWidget {
  final ShapeModel shapeModel;
  const ShapeWidget({
    super.key,
    required this.shapeModel,
  });

  @override
  _ShapeWidgetState createState() => _ShapeWidgetState();
}

class _ShapeWidgetState extends State<ShapeWidget> {
  @override
  Widget build(BuildContext context) {
    return (widget.shapeModel.isPlaced)
        ? Container()
        : Positioned(
            top: widget.shapeModel.position.y,
            left: widget.shapeModel.position.x,
            // top: widget.shapeModel.isPlaced ? widget.shapeModel.targetPosition.y : widget.shapeModel.position.y,
            // left: widget.shapeModel.isPlaced ? widget.shapeModel.targetPosition.x : widget.shapeModel.position.x,
            child: Draggable(
              feedback: RotationTransition(
                turns: AlwaysStoppedAnimation(widget.shapeModel.rotationAngle),
                child: ClipPath(
                  clipper: widget.shapeModel.shape,
                  child: Container(
                    color: widget.shapeModel.color,
                    width: widget.shapeModel.width,
                    height: widget.shapeModel.height,
                  ),
                ),
              ),
              data: widget.shapeModel,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(widget.shapeModel.rotationAngle),
                child: ClipPath(
                  child: Container(
                    color: widget.shapeModel.color,
                    width: widget.shapeModel.width,
                    height: widget.shapeModel.height,
                  ),
                  clipper: widget.shapeModel.shape,
                ),
              ),
              childWhenDragging: Container(),
              onDragEnd: (DraggableDetails d) {
                 if (!widget.shapeModel.isPlaced) {
                  setState(() {
                    widget.shapeModel.position
                        .setPosition(widget.shapeModel.initialPosition.x, widget.shapeModel.initialPosition.y);
                  });
                }
                else{
                  setState(() {
                    widget.shapeModel.position
                        .setPosition(d.offset.dx, d.offset.dy);
                  });
                }
              },
            ),
          );
  }
}
