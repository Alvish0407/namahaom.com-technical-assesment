import 'package:flutter/widgets.dart';

// TODO: add retry button
class ErrorRetryButton extends StatelessWidget {
  final String? error;
  const ErrorRetryButton(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(error ?? 'An error occurred. Please try again.');
  }
}
