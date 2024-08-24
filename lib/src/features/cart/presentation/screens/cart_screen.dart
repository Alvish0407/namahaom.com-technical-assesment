import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/app_back_button.dart';
import '../../../../common_widgets/app_button.dart';
import '../../../../common_widgets/app_loader.dart';
import '../../../../common_widgets/bottombar_button_container.dart';
import '../../../../common_widgets/error_retry_button.dart';
import '../../../../common_widgets/image_container.dart';
import '../../../../constants/app_animation.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/extensions.dart';
import '../../../checkout/presentation/provider/order_summary_provider.dart';
import '../../domain/cart_model.dart';
import '../providers/shopping_cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartOrderSummaryProvider);
    final cartAsync = ref.watch(shoppingCartProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text('My Cart'.hardcoded),
      ),
      body: SafeArea(
        child: cartAsync.when(
          loading: () => const AppLoader(),
          error: (error, _) => Center(child: ErrorRetryButton(error.toString())),
          data: (cart) {
            return ListView.separated(
              itemCount: cart.products.length,
              padding: const EdgeInsetsDirectional.symmetric(vertical: Sizes.p16),
              itemBuilder: (context, index) {
                return _CartProductTile(cart.products[index]).animate(
                  delay: AppAnimation.delay * index,
                  effects: AppAnimation.transitionIn,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: const Color(0xffE6E6E6).hardcodedColor, height: 50);
              },
            );
          },
        ),
      ),
      bottomNavigationBar: cartAsync.mapOrNull(
        data: (cart) {
          return const SafeArea(
            child: _CartSummary(),
          ).animate(effects: AppAnimation.transitionIn);
        },
      ),
    );
  }
}

class _CartSummary extends ConsumerWidget {
  const _CartSummary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(shoppingCartProvider).valueOrNull;

    return BottombarButtonContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _textTile("Sub-Total", '\$${cart?.total.toStringAsFixed(2)}'),
          gapH8,
          _textTile("Discount", '-\$${cart?.discount.toStringAsFixed(2)}'),
          Divider(color: const Color(0xffDDDDDD).hardcodedColor, height: 30),
          _textTile("Total Cost", '\$${cart?.discountedTotal.toStringAsFixed(2)}'),
          gapH24,
          AppButton(
            width: double.infinity,
            label: 'Proceed to Checkout'.hardcoded,
            onPressed: () {
              // Usually order summary is created from backend, but for this demo we'll just update the cart
              ref.read(cartOrderSummaryProvider.notifier).updateCart(cart!);

              context.pushNamed(AppRoute.selectShippingAddress.name);
            },
          ),
        ],
      ),
    );
  }

  Row _textTile(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: TextStyle(fontSize: 16, color: const Color(0xff7E7E7E).hardcodedColor),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 18).medium,
        ),
      ],
    );
  }
}

class _CartProductTile extends StatelessWidget {
  final CartItem product;
  const _CartProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: Row(
        children: [
          ImageContainer(
            child: CachedNetworkImage(
              imageUrl: product.thumbnail.toString(),
              width: 100,
              height: 100,
            ),
          ),
          gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: const TextStyle(fontSize: 16).medium),
                Text(
                  "\$${product.totalPrice}",
                  style: const TextStyle(fontSize: 18).medium,
                ),
              ],
            ),
          ),
          gapW16,
          Transform.scale(
            scale: 0.8,
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                _DecrementQuantity(product.id),
                gapW8,
                Text(
                  product.quantity.toString(),
                  style: const TextStyle(fontSize: 20).medium,
                ),
                gapW8,
                _IncrementQuantity(product.id),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DecrementQuantity extends HookConsumerWidget {
  final int productId;
  const _DecrementQuantity(this.productId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final isDisabled = isLoading.value;

    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xffEDEDED).hardcodedColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.p8)),
        ),
      ),
      onPressed: isDisabled
          ? null
          : () async {
              isLoading.value = true;
              await ref.read(shoppingCartProvider.notifier).minusQuantity(productId);
              isLoading.value = false;
            },
      icon: isLoading.value
          ? AppButton.loader(context.textTheme.bodyLarge!.color!)
          : SvgPicture.asset(AppIcons.minus),
    );
  }
}

class _IncrementQuantity extends HookConsumerWidget {
  final int productId;
  const _IncrementQuantity(this.productId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final isDisabled = isLoading.value;

    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(context.colorScheme.primary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.p8)),
        ),
      ),
      onPressed: isDisabled
          ? null
          : () async {
              isLoading.value = true;
              await ref.read(shoppingCartProvider.notifier).addQuantity(productId);
              isLoading.value = false;
            },
      icon: isLoading.value
          ? AppButton.loader(context.colorScheme.onPrimary)
          : SvgPicture.asset(
              AppIcons.add,
              colorFilter: ColorFilter.mode(context.colorScheme.onPrimary, BlendMode.srcIn),
            ),
    );
  }
}
