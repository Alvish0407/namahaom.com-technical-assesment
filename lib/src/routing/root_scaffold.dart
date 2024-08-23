import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScaffold extends StatelessWidget {
  const RootScaffold({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey<String>('RootScaffold'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
    );
  }
}
