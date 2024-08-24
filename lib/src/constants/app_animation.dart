import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppAnimation {
  AppAnimation._();
  factory AppAnimation() => _instance;
  static final AppAnimation _instance = AppAnimation._();

  static const Curve curve = Curves.easeInOut;
  static const Duration delay = Duration(milliseconds: 50);
  static const Duration duration = Duration(milliseconds: 750);

  static const List<Effect> transitionIn = [
    FadeEffect(duration: duration, curve: curve),
  ];
}

extension ListWidgetX on List<Widget> {
  List<Widget> animateList() {
    return asMap()
        .map((index, value) {
          return MapEntry(
            index,
            value.animate(
              delay: AppAnimation.delay * index,
              effects: AppAnimation.transitionIn,
            ),
          );
        })
        .values
        .toList();
  }
}
