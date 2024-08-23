import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class AppButton extends StatelessWidget {
  final double height;
  final double? width;
  final String? label;
  final Widget? child;
  final bool isLoading;
  final Widget? leading;
  final Widget? trailing;
  final Color? labelColor;
  final ShapeBorder? shape;
  final double labelFontSize;
  final Color? borderColor;
  final double borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  AppButton({
    super.key,
    this.child,
    this.label,
    this.width,
    this.shape,
    this.leading,
    this.trailing,
    this.onPressed,
    this.labelColor,
    this.borderColor,
    this.backgroundColor,
    this.isLoading = false,
    this.height = defaultHeight,
    this.borderRadius = defaultBorderRadius,
    this.labelFontSize = defaultLabelFontSize,
  }) {
    assert(label != null || child != null, 'title or child must be provided');
  }

  static const defaultHeight = 52.0;
  static const defaultBorderRadius = 32.0;
  static const defaultLabelFontSize = 16.0;

  static Widget loader(Color color) {
    return SizedBox.square(
      dimension: 15,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget child;
    final Color labelLoaderColor = labelColor ?? context.colorScheme.onPrimary;

    if (isLoading) {
      child = loader(labelLoaderColor);
    } else if (this.child != null) {
      child = this.child!;
    } else {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) leading!,
          Text(
            label!,
            style: TextStyle(fontSize: labelFontSize, color: labelLoaderColor).semiBold,
          ),
          if (trailing != null) trailing!,
        ],
      );
    }

    final ShapeBorder? shape;
    if (this.shape != null) {
      shape = this.shape;
    } else {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none,
      );
    }

    return SizedBox(
      width: width,
      child: MaterialButton(
        minWidth: 0,
        shape: shape,
        elevation: 0,
        height: height,
        onPressed: onPressed,
        highlightElevation: 0,
        disabledColor: backgroundColor?.withOpacity(0.5),
        color: backgroundColor ?? context.colorScheme.primary,
        child: child,
      ),
    );
  }
}
