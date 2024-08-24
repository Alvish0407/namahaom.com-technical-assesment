import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/app_loader.dart';
import '../../../../common_widgets/cart_button.dart';
import '../../../../common_widgets/error_retry_button.dart';
import '../../../../common_widgets/image_container.dart';
import '../../../../constants/app_animation.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../routing/app_router.dart';
import '../../../../services/secure_storage.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/extensions.dart';
import '../../../authentication/data/firebase_auth_repository.dart';
import '../../../products/domain/product_model.dart';
import '../../../products/presentation/providers/products_provider.dart';
import '../../../products/presentation/providers/selected_category_provider.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: _HomeAppBar(),
      body: Column(
        children: [
          gapH16,
          _Categories(),
          gapH16,
          Expanded(child: Center(child: _ProductsGrid())),
        ],
      ),
    );
  }
}

class _ProductsGrid extends ConsumerWidget {
  const _ProductsGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final productsAsync = ref.watch(productsProvider(category: selectedCategory));

    return productsAsync.when(
      loading: () => const AppLoader(),
      error: (error, _) => Center(child: ErrorRetryButton(error.toString())),
      data: (products) {
        return RefreshIndicator.adaptive(
          onRefresh: () async {
            return await ref.refresh(productsProvider(category: selectedCategory).future);
          },
          child: GridView.builder(
            itemCount: products.length,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.65,
              maxCrossAxisExtent: 225,
              mainAxisSpacing: Sizes.p16,
              crossAxisSpacing: Sizes.p16,
            ),
            itemBuilder: (context, index) {
              return _ProductCard(products[index]).animate(effects: AppAnimation.transitionIn);
            },
          ),
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        context.pushNamed(
          AppRoute.productDetails.name,
          pathParameters: {'id': product.id.toString()},
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ImageContainer(
              child: CachedNetworkImage(
                imageUrl: product.thumbnail.toString(),
                height: 185,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => const AppLoader(),
              ),
            ),
            gapH8,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
            gapH4,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\$${product.price}",
                style: const TextStyle(fontSize: 16).medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Categories extends HookConsumerWidget {
  const _Categories();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return SizedBox(
      height: 50,
      child: categories.mapOrNull(
        data: (categories) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.value.length,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            itemBuilder: (context, index) {
              final isSelected = selectedCategory == categories.value[index];

              final textStyle = TextStyle(
                fontSize: 15,
                color: isSelected ? context.colorScheme.onPrimary : null,
              );

              final backgroundColor =
                  isSelected ? context.colorScheme.primary : context.colorScheme.surface;

              final borderSide = isSelected
                  ? BorderSide.none
                  : BorderSide(color: const Color(0xffE9E9E9).hardcodedColor);

              return ActionChip(
                onPressed: () {
                  ref.read(selectedCategoryProvider.notifier).set = categories.value[index];
                },
                label: Text(categories.value[index].name, style: textStyle),
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                  side: borderSide,
                  borderRadius: BorderRadius.circular(24),
                ),
              ).animate(
                delay: AppAnimation.delay * index,
                effects: AppAnimation.transitionIn,
              );
            },
            separatorBuilder: (BuildContext context, int index) => gapW8,
          );
        },
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  final bottomHeight = 0.0;

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
      actions: const [CartButton(), gapW16, LogoutButton(), gapW16],
      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(bottomHeight),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      //     child: TextField(
      //       decoration: InputDecoration(
      //         hintText: "Search ".hardcoded,
      //         prefixIcon: UnconstrainedBox(
      //           child: SvgPicture.asset(
      //             AppIcons.search,
      //             colorFilter: ColorFilter.mode(
      //               context.colorScheme.primary,
      //               BlendMode.srcIn,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + bottomHeight);
}

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onLogout() async {
      final firebaseAuth = ref.watch(firebaseAuthProvider);
      // Clear cart on logout
      final secureStorage = ref.read(secureStorageProvider).requireValue;
      await secureStorage.remove(SecureStorageKey.cart);

      await firebaseAuth.signOut();
    }

    return CircleAvatar(
      backgroundColor: const Color(0xFFFFEFEF).hardcodedColor,
      child: IconButton(
        onPressed: onLogout,
        icon: SvgPicture.asset(
          AppIcons.logout,
          colorFilter: ColorFilter.mode(
            const Color(0xffE84B51).hardcodedColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
