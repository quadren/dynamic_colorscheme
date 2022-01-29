import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

abstract class DynamicColorScheme {
  /// this method is to be used inside [DynamicColorBuilder] from the official Material package, dynamic_color.
  /// explanation is in example.
  static ColorScheme generate(CorePalette palette, {required bool dark}) {
    final result = _generateM3Scheme(palette, dark);
    return result;
  }
}

ColorScheme _generateM3Scheme(CorePalette palette, bool dark) {
  /// created with reference to https://m3.material.io/styles/color/the-color-system/tokens.

  final bool d = dark;

  final primaries = palette.primary;
  final secondaries = palette.secondary;
  final tertiaries = palette.tertiary;
  final neutrals = palette.neutral;

  final Color primary = Color(primaries.get(d ? 80 : 40));
  final Color inversePrimary = Color(primaries.get(d ? 40 : 80));
  final Color primaryContainer = Color(primaries.get(d ? 30 : 90));
  final Color secondary = Color(secondaries.get(d ? 80 : 40));
  final Color secondaryContainer = Color(secondaries.get(d ? 30 : 90));
  final Color tertiary = Color(tertiaries.get(d ? 80 : 40));
  final Color tertiaryContainer = Color(tertiaries.get(d ? 30 : 90));
  final Color error = Color(palette.error.get(d ? 80 : 40));
  final Color errorContainer = Color(palette.error.get(d ? 30 : 90));

  final Color background = Color(neutrals.get(d ? 10 : 99));
  final Color surface = background;
  final Color surfaceVariant = Color(neutrals.get(d ? 30 : 90));
  final Color onSurfaceVariant = Color(neutrals.get(d ? 90 : 80));
  final Color inverseSurface = Color(neutrals.get(d ? 90 : 20));
  final Color inverseOnSurface = Color(neutrals.get(d ? 20 : 95));

  final Color onPrimary = Color(primaries.get(d ? 20 : 100));
  final Color onSecondary = Color(secondaries.get(d ? 20 : 100));
  final Color onTertiary = Color(tertiaries.get(d ? 20 : 100));
  final Color onPrimaryContainer = Color(primaries.get(d ? 90 : 10));
  final Color onSecondaryContainer = Color(secondaries.get(d ? 90 : 10));
  final Color onTertiaryContainer = Color(tertiaries.get(d ? 90 : 10));
  final Color onError = Color(palette.error.get(d ? 20 : 100));
  final Color onErrorContainer = Color(palette.error.get(d ? 80 : 10));

  final Color onBackground = Color(neutrals.get(d ? 90 : 10));
  final Color onSurface = onBackground;
  final Color outline = Color(neutrals.get(d ? 60 : 50));

  final ColorScheme result = ColorScheme(
      primary: primary,
      primaryContainer: primaryContainer,
      inversePrimary: inversePrimary,
      secondary: secondary,
      secondaryContainer: secondaryContainer,
      tertiary: tertiary,
      tertiaryContainer: tertiaryContainer,
      surface: surface,
      surfaceVariant: surfaceVariant,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      onSurfaceVariant: onSurfaceVariant,
      background: background,
      error: error,
      onPrimary: onPrimary,
      onPrimaryContainer: onPrimaryContainer,
      onSecondary: onSecondary,
      onSecondaryContainer: onSecondaryContainer,
      onTertiary: onTertiary,
      onTertiaryContainer: onTertiaryContainer,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      outline: outline,
      brightness: d ? Brightness.dark : Brightness.light);

  return result;
}
