import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/routing/app_router.dart';
import 'src/services/secure_storage.dart';
import 'src/utils/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const _EagerInitialization(child: _MainApp());
  }
}

class _MainApp extends ConsumerWidget {
  const _MainApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter goRouter = ref.watch(goRouterProvider);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp.router(
        title: 'Nesscale POS',
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeData(context),
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  final Widget child;
  const _EagerInitialization({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = [
      ref.watch(secureStorageProvider),
    ];

    if (values.every((value) => value.hasValue)) {
      return child;
    }

    return const Material();
  }
}
