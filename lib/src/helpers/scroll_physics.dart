import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PageViewScrollPhysics extends ScrollPhysics {
  const PageViewScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  PageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return PageViewScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 50,
        stiffness: 50,
        damping: 0.85,
      );
}
