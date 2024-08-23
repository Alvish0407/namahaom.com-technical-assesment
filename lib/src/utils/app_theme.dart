import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_sizes.dart';
import 'app_assets.dart';
import 'extensions.dart';

abstract class AppTheme {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      primaryColor: const Color(0xFF704F38),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF704F38),
        primary: const Color(0xFF704F38),
        onPrimary: Colors.white,
        surface: Colors.white,
        onSurface: const Color(0xff1f2029),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: const Color(0xff1f2029),
            displayColor: const Color(0xff1f2029),
          ),
      extensions: const [
        AppColors(
          onSurface2: Color(0xff797979),
        ),
      ],
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        isDense: true,
        isCollapsed: true,
        alignLabelWithHint: true,
        fillColor: Colors.white,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFFAD7D9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFF704F38)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xffE6E6E6)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xffE84B51)),
        ),
        hintStyle: const TextStyle(fontSize: 14, color: Color(0xff797979)).regular,
        labelStyle: const TextStyle(fontSize: 14, color: Color(0xff797979)).regular,
        contentPadding: const EdgeInsets.symmetric(horizontal: Sizes.p20, vertical: Sizes.p12),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(fontSize: 18, color: Color(0xff1f2029)).medium,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          fixedSize: const Size(240, 52),
          textStyle: const TextStyle(fontSize: 16, color: Colors.white).bold,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.p12)),
        ),
      ),
    );
  }
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.onSurface2,
  });

  final Color? onSurface2;

  @override
  AppColors copyWith({
    Color? green,
    Color? onSurface2,
  }) {
    return AppColors(
      onSurface2: onSurface2 ?? this.onSurface2,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      onSurface2: Color.lerp(onSurface2, other.onSurface2, t),
    );
  }

  @override
  String toString() => 'AppColors(onSurface2: $onSurface2)';
}

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  AppColors get appColors => theme.extension<AppColors>()!;

  ScaffoldMessengerState? errorSnackBar([String? text]) =>
      text == null || text.isEmpty ? null : ScaffoldMessenger.of(this)
        ?..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.p16),
              side: BorderSide(color: const Color(0xffFF576B).hardcodedColor),
            ),
            content: Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: const Color(0xffFF576B).hardcodedColor,
                  child: SvgPicture.asset(AppIcons.cross),
                ),
                gapW8,
                Expanded(
                  child: Text(
                    text ?? "Error".hardcoded,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xff04002E).hardcodedColor,
                    ),
                  ),
                ),
              ],
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color(0xFFFFEFEF).hardcodedColor,
          ),
        );

  ScaffoldMessengerState successSnackBar([
    String? text,
  ]) =>
      ScaffoldMessenger.of(this)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.p16),
              side: BorderSide(color: const Color(0xff47B990).hardcodedColor),
            ),
            content: Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: const Color(0xFFE6F5EC).hardcodedColor,
                  child: SvgPicture.asset(AppIcons.cross),
                ),
                gapW8,
                Expanded(
                  child: Text(
                    text ?? "Success".hardcoded,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xff04002E).hardcodedColor,
                    ),
                  ),
                ),
              ],
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color(0xFFE6F5EC).hardcodedColor,
          ),
        );
}

extension TextStyleX on TextStyle {
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}
