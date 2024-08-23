import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_assets.dart';
import '../utils/app_theme.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.appColors.onSurface2!),
        ),
        child: CircleAvatar(
          backgroundColor: context.colorScheme.surface,
          child: IconButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            icon: SvgPicture.asset(AppIcons.arrowLeft, matchTextDirection: true),
          ),
        ),
      ),
    );
  }
}
