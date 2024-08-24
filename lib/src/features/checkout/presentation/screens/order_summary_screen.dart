import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/app_button.dart';
import '../../../../common_widgets/bottombar_button_container.dart';
import '../../../../common_widgets/image_container.dart';
import '../../../../constants/app_animation.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/extensions.dart';
import '../../../cart/domain/cart_model.dart';
import '../../domain/address_model.dart';
import '../../domain/payment_method_model.dart';
import '../provider/order_summary_provider.dart';

class OrderSummaryScreen extends ConsumerWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderSummary = ref.watch(cartOrderSummaryProvider);

    final divider = Divider(color: const Color(0xffE6E6E6).hardcodedColor, height: 50);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text('Order Summary'.hardcoded),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (orderSummary.cart != null) ...[
                _OrderTotals(
                  total: orderSummary.cart?.total,
                  discount: orderSummary.cart?.discount,
                  subTotal: orderSummary.cart?.discountedTotal,
                ),
                divider,
              ],
              _LargeTitle("Products".hardcoded),
              gapH12,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: orderSummary.cart?.products.length ?? 0,
                itemBuilder: (context, index) {
                  if (orderSummary.cart?.products[index] == null) {
                    return null;
                  }
                  return _ProductDetailsTile(orderSummary.cart!.products[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return gapH16;
                },
              ),
              if (orderSummary.shippingAddress != null) ...[
                divider,
                _ShippingDetails(orderSummary.shippingAddress!).animate(
                  delay: AppAnimation.delay * 2,
                  effects: AppAnimation.transitionIn,
                ),
              ],
              if (orderSummary.paymentMethod != null) ...[
                divider,
                _PaymentDetails(orderSummary.paymentMethod!),
              ],
              gapH16,
            ].animateList(),
          ),
        ),
      ),
      bottomNavigationBar: BottombarButtonContainer(
        child: AppButton(
          width: double.infinity,
          onPressed: () {
            context.goNamed(AppRoute.home.name);
          },
          label: 'Back to Home'.hardcoded,
        ),
      ),
    );
  }
}

class _LargeTitle extends StatelessWidget {
  final String title;
  const _LargeTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: const TextStyle(fontSize: 20).semiBold),
    );
  }
}

class _OrderTotals extends StatelessWidget {
  final double? subTotal;
  final double? discount;
  final double? total;

  const _OrderTotals({required this.subTotal, required this.discount, required this.total});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LargeTitle("Order Details".hardcoded),
          gapH12,
          _textTile("Total Cost", '\$${total?.toStringAsFixed(2)}'),
          gapH8,
          _textTile("Discount", '-\$${discount?.toStringAsFixed(2)}'),
          gapH8,
          _textTile("Sub-Total", '\$${subTotal?.toStringAsFixed(2)}'),
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

class _PaymentDetails extends StatelessWidget {
  final PaymentMethod paymentMethod;
  const _PaymentDetails(this.paymentMethod);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LargeTitle("Payment Method".hardcoded),
          gapH12,
          Row(
            children: [
              SvgPicture.asset(paymentMethod.icon, width: 24),
              gapW12,
              Text(paymentMethod.name, style: const TextStyle(fontSize: 16).medium),
            ],
          ),
        ],
      ),
    );
  }
}

class _ShippingDetails extends StatelessWidget {
  final Address address;
  const _ShippingDetails(this.address);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LargeTitle("Shipping Details".hardcoded),
          gapH12,
          Text(address.type, style: const TextStyle(fontSize: 16).medium),
          Text(
            address.fullAddress,
            style: TextStyle(color: context.appColors.onSurface2),
          ),
        ],
      ),
    );
  }
}

class _ProductDetailsTile extends StatelessWidget {
  final CartItem product;
  const _ProductDetailsTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                "${"Qty : ".hardcoded}${product.quantity}",
                style: TextStyle(fontSize: 16, color: context.appColors.onSurface2),
              ),
              Text(
                "\$${product.totalPrice}",
                style: const TextStyle(fontSize: 18).medium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
