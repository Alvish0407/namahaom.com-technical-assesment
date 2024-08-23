import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_assets.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: IconButton(
        onPressed: () {
          Navigator.maybePop(context);
        },
        icon: SvgPicture.asset(AppIcons.arrowLeft, matchTextDirection: true),
      ),
    );
  }
}
