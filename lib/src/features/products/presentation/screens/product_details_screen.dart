import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/app_back_button.dart';
import '../../../../common_widgets/app_button.dart';
import '../../../../common_widgets/app_loader.dart';
import '../../../../common_widgets/error_retry_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/extensions.dart';
import '../../domain/product_model.dart';
import '../providers/product_details_provider.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final String id;
  const ProductDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailsProvider(id: id));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const AppBackButton(),
        title: Text('Product Details'.hardcoded),
        backgroundColor: const Color(0xffECDEDB).hardcodedColor,
      ),
      body: productAsync.when(
        loading: () => const Center(child: AppLoader()),
        error: (error, _) => Center(child: ErrorRetryButton(error.toString())),
        data: (product) {
          return Column(
            children: [
              _ProductImage(product.thumbnail),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                    child: _OtherProductDetails(product),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const SafeArea(child: _QuantityModifier()),
    );
  }
}

class _QuantityModifier extends StatelessWidget {
  const _QuantityModifier();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p20),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: const Border(top: BorderSide(color: Color(0xffE4E3E3))),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(0, 4),
            color: const Color(0x0f00498a).hardcodedColor,
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price'.hardcoded,
                  style: TextStyle(color: context.appColors.onSurface2),
                ),
                Text(r'$34'.hardcoded, style: const TextStyle(fontSize: 16).medium),
              ],
            ),
          ),
          gapW20,
          AppButton(
            width: 200,
            onPressed: () {},
            label: 'Add to cart'.hardcoded,
            leading: Padding(
              padding: const EdgeInsets.only(right: Sizes.p8),
              child: SvgPicture.asset(
                AppIcons.bagFilled,
                colorFilter: ColorFilter.mode(context.colorScheme.surface, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OtherProductDetails extends StatelessWidget {
  final Product product;
  const _OtherProductDetails(this.product);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH24,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                product.brand ?? product.category,
                style: TextStyle(color: context.appColors.onSurface2),
              ),
            ),
            gapW8,
            Row(
              children: [
                SvgPicture.asset(AppIcons.star),
                gapW4,
                Text(
                  product.rating.toString(),
                  style: TextStyle(color: context.appColors.onSurface2),
                ),
              ],
            ),
          ],
        ),
        gapH8,
        Text(
          product.title,
          style: const TextStyle(fontSize: 18).medium,
        ),
        gapH16,
        Text(
          "Product Details".hardcoded,
          style: const TextStyle(fontSize: 16).medium,
        ),
        gapH8,
        Text(
          product.description,
          style: TextStyle(color: context.appColors.onSurface2),
        ),
      ],
    );
  }
}

class _ProductImage extends StatelessWidget {
  final Uri? thumbnail;
  const _ProductImage(this.thumbnail);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: const Color(0xffECDEDB).hardcodedColor,
        image: DecorationImage(
          image: CachedNetworkImageProvider(thumbnail.toString()),
        ),
      ),
    );
  }
}
