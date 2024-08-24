import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/cart/presentation/providers/shopping_cart_provider.dart';

class RootScaffold extends ConsumerWidget {
  const RootScaffold({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey<String>('RootScaffold'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(shoppingCartProvider);

    return navigationShell;
  }
}
