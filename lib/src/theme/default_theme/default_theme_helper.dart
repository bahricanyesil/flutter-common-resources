import 'package:flutter/material.dart';

import '../app_colors.dart';

/// Default theme helper for the app.
abstract final class DefaultThemeHelper {
  /// Default theme data for the app.
  static ThemeData defaultThemeData({bool isDark = true}) => ThemeData(
        useMaterial3: true,
        colorScheme: defaultColorScheme(isDark: isDark),
        textTheme: defaultTextTheme(isDark: isDark),
        dropdownMenuTheme: defaultDropdownMenuThemeData(isDark: isDark),
        inputDecorationTheme: defaultInputDecorationTheme(isDark: isDark),
      );

  /// Default color scheme for the app.
  static ColorScheme defaultColorScheme({bool isDark = true}) => isDark
      ? const ColorScheme.dark(primary: AppColors.primary)
      : const ColorScheme.light(primary: AppColors.primary);

  /// Default text theme for the app.
  static TextTheme defaultTextTheme({bool isDark = true}) {
    final TextTheme baseTextTheme = isDark
        ? Typography.material2021().white
        : Typography.material2021().black;

    const String fontFamily = 'Roboto';
    const double fontSizeFactor = 1.2;

    return baseTextTheme
        .copyWith(
          displayLarge: baseTextTheme.displayLarge?.copyWith(
            fontFamily: fontFamily,
            fontSize: 57,
            fontWeight: FontWeight.w800,
          ),
          displayMedium: baseTextTheme.displayMedium?.copyWith(
            fontFamily: fontFamily,
            fontSize: 45,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: baseTextTheme.displaySmall?.copyWith(
            fontFamily: fontFamily,
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
          headlineLarge: baseTextTheme.headlineLarge?.copyWith(
            fontFamily: fontFamily,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: baseTextTheme.headlineMedium?.copyWith(
            fontFamily: fontFamily,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          headlineSmall: baseTextTheme.headlineSmall?.copyWith(
            fontFamily: fontFamily,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: baseTextTheme.titleLarge?.copyWith(
            fontFamily: fontFamily,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: baseTextTheme.titleMedium?.copyWith(
            fontFamily: fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: baseTextTheme.titleSmall?.copyWith(
            fontFamily: fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: baseTextTheme.bodyLarge?.copyWith(
            fontFamily: fontFamily,
            fontSize: 15.5,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: baseTextTheme.bodyMedium?.copyWith(
            fontFamily: fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: baseTextTheme.bodySmall?.copyWith(
            fontFamily: fontFamily,
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
          labelLarge: baseTextTheme.labelLarge?.copyWith(
            fontFamily: fontFamily,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          labelMedium: baseTextTheme.labelMedium?.copyWith(
            fontFamily: fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
          labelSmall: baseTextTheme.labelSmall?.copyWith(
            fontFamily: fontFamily,
            fontSize: 11,
            fontWeight: FontWeight.w200,
          ),
        )
        .apply(fontFamily: fontFamily, fontSizeFactor: fontSizeFactor);
  }

  /// Default dropdown menu theme data for the app.
  static DropdownMenuThemeData defaultDropdownMenuThemeData({
    bool isDark = true,
  }) =>
      DropdownMenuThemeData(
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.resolveWith(_bgColorResolver),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          minimumSize: WidgetStateProperty.all(Size.zero),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          constraints: BoxConstraints(),
          contentPadding: EdgeInsets.zero,
        ),
        textStyle:
            defaultTextTheme().bodyMedium?.copyWith(color: AppColors.blackText),
      );

  static Color? _bgColorResolver(Set<WidgetState> states) =>
      states.contains(WidgetState.selected)
          ? AppColors.selectedColor
          : AppColors.selectedColor.withOpacity(.6);

  /// Default input decoration theme for the app.
  static InputDecorationTheme defaultInputDecorationTheme({
    bool isDark = true,
  }) {
    final TextStyle? hintStyle =
        defaultTextTheme().labelLarge?.copyWith(color: AppColors.blackText);
    return InputDecorationTheme(
      hintStyle: hintStyle,
      helperStyle: hintStyle,
      labelStyle: hintStyle,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      constraints: const BoxConstraints(maxWidth: 300),
      suffixIconColor: AppColors.primary,
      prefixIconColor: AppColors.primary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      errorStyle:
          defaultTextTheme().labelMedium?.copyWith(color: AppColors.error),
      errorMaxLines: 2,
      floatingLabelStyle:
          defaultTextTheme().labelMedium?.copyWith(color: AppColors.primary),
    );
  }
}