import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../utils/app_theme.dart';
import '../utils/extensions.dart';

class BottombarButtonContainer extends StatelessWidget {
  final Widget child;
  const BottombarButtonContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16, vertical: Sizes.p16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(Sizes.p16)),
        border: Border(top: BorderSide(color: const Color(0xffE6E6E6).hardcodedColor)),
      ),
      child: child,
    );
  }
}
