import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/app_button.dart';
import '../../../../common_widgets/bottombar_button_container.dart';
import '../../../../constants/app_animation.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/extensions.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text('Payment'.hardcoded),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.tickCircle,
              width: 150,
              colorFilter: ColorFilter.mode(context.colorScheme.primary, BlendMode.srcIn),
            ),
            gapH16,
            Text('Payment Successful!'.hardcoded, style: const TextStyle(fontSize: 24).bold),
            gapH12,
            Text(
              'Thank you for your purchase.'.hardcoded,
              style: TextStyle(fontSize: 14, color: context.appColors.onSurface2),
            ),
          ].animateList(),
        ),
      ),
      bottomNavigationBar: BottombarButtonContainer(
        child: AppButton(
          width: double.infinity,
          label: 'View E-Receipt'.hardcoded,
          onPressed: () => context.pushNamed(AppRoute.orderSummary.name),
        ),
      ),
    );
  }
}
