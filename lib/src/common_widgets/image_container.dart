import 'package:flutter/material.dart';

import '../utils/extensions.dart';

class ImageContainer extends StatelessWidget {
  final Widget child;
  const ImageContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: const Color(0xffECDEDB).hardcodedColor,
        child: child,
      ),
    );
  }
}
