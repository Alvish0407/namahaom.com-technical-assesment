import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/cart/presentation/providers/shopping_cart_provider.dart';
import '../routing/app_router.dart';
import '../utils/app_assets.dart';
import '../utils/extensions.dart';

class CartButton extends ConsumerWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(shoppingCartProvider);

    final totalProducts = cart.valueOrNull?.totalProducts;
    final isLabelVisible = totalProducts != null && totalProducts > 0;

    return CircleAvatar(
      backgroundColor: const Color(0xffF1F1F1).hardcodedColor,
      child: IconButton(
        onPressed: () => context.pushNamed(AppRoute.cart.name),
        icon: Badge.count(
          offset: const Offset(8, -8),
          count: totalProducts ?? 0,
          isLabelVisible: isLabelVisible,
          child: SvgPicture.asset(AppIcons.bagFilled),
        ),
      ),
    );
  }
}
