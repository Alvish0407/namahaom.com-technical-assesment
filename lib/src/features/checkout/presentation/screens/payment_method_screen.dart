import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/app_button.dart';
import '../../../../common_widgets/app_loader.dart';
import '../../../../common_widgets/bottombar_button_container.dart';
import '../../../../common_widgets/error_retry_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/extensions.dart';
import '../../domain/payment_method_model.dart';
import '../provider/payment_methods_provider.dart';

class PaymentMethodScreen extends HookConsumerWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConfirmingPayment = useState(false);
    final ValueNotifier<PaymentMethod?> selectedPaymentMethod = useState<PaymentMethod?>(null);
    final paymentMethodsAsync = ref.watch(paymentMethodsProvider);

    Future<void> onConfirmPayment() async {
      isConfirmingPayment.value = true;
      // Simulate payment confirmation
      await Future.delayed(const Duration(seconds: 2));
      isConfirmingPayment.value = false;

      if (context.mounted) context.pushNamed(AppRoute.paymentSuccess.name);
    }

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Payment Methods'),
      ),
      body: paymentMethodsAsync.when(
        loading: () => const Center(child: AppLoader()),
        error: (error, _) => Center(child: ErrorRetryButton(error.toString())),
        data: (paymentMethods) {
          return Container(
            margin: const EdgeInsets.all(Sizes.p16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.p16),
              border: Border.all(color: const Color(0xffE6E6E6).hardcodedColor),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) {
                final paymentMethod = paymentMethods[index];
                return ListTile(
                  title: Text(paymentMethod.name),
                  leading: SvgPicture.asset(paymentMethod.icon, width: 24),
                  trailing: Radio<PaymentMethod>(
                    value: paymentMethod,
                    groupValue: selectedPaymentMethod.value,
                    onChanged: (value) {
                      selectedPaymentMethod.value = value;
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: const Color(0xffE6E6E6).hardcodedColor, height: 0);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottombarButtonContainer(
        child: AppButton(
          width: double.infinity,
          onPressed: onConfirmPayment,
          label: 'Confirm Payment'.hardcoded,
          isLoading: isConfirmingPayment.value,
        ),
      ),
    );
  }
}
