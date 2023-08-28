import 'package:flutter/material.dart';
import 'package:portfolio/ui/components/image_cached.dart';
import 'package:portfolio/ui/components/panel.dart';

extension ContainerExtension on Container {
  Widget straightEdge(AxisDirection direction, double height) {
    return ClipPath(
      clipper: StraightEdgeClipper(direction: direction, height: height),
      child: this,
    );
  }
}

extension AnimatedContainerExtension on AnimatedContainer {
  Widget straightEdge(AxisDirection direction, double height) {
    return ClipPath(
      clipper: StraightEdgeClipper(direction: direction, height: height),
      child: this,
    );
  }
}

extension PanelExtension on Panel {
  Widget straightEdge(AxisDirection direction, double height) {
    return ClipPath(
      clipper: StraightEdgeClipper(direction: direction, height: height),
      child: this,
    );
  }
}

extension ImageCachedStraightExtension on ImageCached {
  Widget straightEdge(AxisDirection direction, double height) {
    return ClipPath(
      clipper: StraightEdgeClipper(direction: direction, height: height),
      child: this,
    );
  }
}

extension AnimatedPhysicalModelExtension on AnimatedPhysicalModel {
  Widget straightEdge(AxisDirection direction, double height) {
    return ClipPath(
      clipper: StraightEdgeClipper(direction: direction, height: height),
      child: this,
    );
  }
}

class StraightEdgeClipper extends CustomClipper<Path> {
  StraightEdgeClipper({this.direction = AxisDirection.right, this.height = 20});
  final AxisDirection direction;
  final double height;

  @override
  Path getClip(Size size) {
    final path = Path();
    switch (direction) {
      case AxisDirection.right:
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, height);
        path.lineTo(size.width - height, 0);
        break;
      case AxisDirection.up:
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(height, 0);
        path.lineTo(0, height);
        break;
      case AxisDirection.down:
        path.lineTo(0, size.height);
        path.lineTo(size.width - height, size.height);
        path.lineTo(size.width, size.height - height);
        path.lineTo(size.width, 0);
        break;
      case AxisDirection.left:
        path.lineTo(0, size.height - height);
        path.lineTo(height, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
        break;
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(StraightEdgeClipper oldClipper) => true;
}
