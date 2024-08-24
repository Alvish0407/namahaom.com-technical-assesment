import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/app_button.dart';
import '../../../../common_widgets/app_loader.dart';
import '../../../../common_widgets/bottombar_button_container.dart';
import '../../../../common_widgets/error_retry_button.dart';
import '../../../../constants/app_animation.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/extensions.dart';
import '../../domain/address_model.dart';
import '../provider/order_summary_provider.dart';
import '../provider/shipping_address_provider.dart';

class SelectShippingAddressScreen extends HookConsumerWidget {
  const SelectShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<Address?> selectedAddress = useState<Address?>(null);
    final addressesAsync = ref.watch(shippingAddressProvider);

    void onProceed() {
      if (selectedAddress.value == null) {
        context.errorSnackBar('Please select a shipping address'.hardcoded);
        return;
      }
      // Since we don't have a real backend, we'll just update the shipping address and
      // navigate to the payment method screen
      ref.read(cartOrderSummaryProvider.notifier).updateShippingAddress(selectedAddress.value!);

      context.pushNamed(AppRoute.paymentMethod.name);
    }

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Shipping Address'),
      ),
      body: addressesAsync.when(
        loading: () => const Center(child: AppLoader()),
        error: (error, _) => Center(child: ErrorRetryButton(error.toString())),
        data: (addresses) {
          return ListView.separated(
            itemCount: addresses.length,
            padding: const EdgeInsets.all(Sizes.p16),
            itemBuilder: (context, index) {
              final address = addresses[index];
              return Row(
                children: [
                  SvgPicture.asset(AppIcons.location),
                  gapW8,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(address.type, style: const TextStyle(fontSize: 16).medium),
                        Text(
                          address.fullAddress,
                          style: TextStyle(color: context.appColors.onSurface2),
                        ),
                      ],
                    ),
                  ),
                  gapW8,
                  Radio<Address>(
                    value: address,
                    onChanged: (value) {
                      selectedAddress.value = value;
                    },
                    groupValue: selectedAddress.value,
                  ),
                ],
              ).animate(
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
      bottomNavigationBar: BottombarButtonContainer(
        child: AppButton(
          width: double.infinity,
          label: 'Proceed'.hardcoded,
          onPressed: onProceed,
        ),
      ),
    );
  }
}
