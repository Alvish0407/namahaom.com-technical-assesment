import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _HomeAppBar(),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  final bottomHeight = 55.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 200,
      leading: Padding(
        padding: const EdgeInsets.only(left: Sizes.p16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location".hardcoded,
              style: TextStyle(color: context.appColors.onSurface2),
            ),
            gapH4,
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.locationFilled,
                  width: 22,
                  colorFilter: ColorFilter.mode(
                    context.colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                gapW4,
                Text(
                  "Earth, Solar System".hardcoded,
                  style: const TextStyle(fontSize: 15).medium,
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: const Color(0xffF1F1F1).hardcodedColor,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.bagFilled,
            ),
          ),
        ),
        gapW16,
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(bottomHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search ".hardcoded,
              prefixIcon: UnconstrainedBox(
                child: SvgPicture.asset(
                  AppIcons.search,
                  colorFilter: ColorFilter.mode(
                    context.colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + bottomHeight);
}
