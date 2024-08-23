import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const UnconstrainedBox(child: CircularProgressIndicator(strokeWidth: 3));
  }
}
