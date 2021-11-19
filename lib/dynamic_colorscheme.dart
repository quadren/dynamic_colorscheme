import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

abstract class DynamicColorScheme {
  /// this method is to be used inside [DynamicColorBuilder] from the official Material package, dynamic_color.
  /// explanation is in example.
  static ColorScheme generate(CorePalette palette, {bool? dark}) {
    final result = _generateM3Scheme(palette, dark ?? false);
    return result;
  }
}

ColorScheme _generateM3Scheme(CorePalette palette, bool dark) {
  /// refer to https://m3.material.io/styles/color/the-color-system/tokens for detailed explanation
  /// lines commented out are colors defined in the link above, but undefined in [ColorScheme].
  /// tertiary and inverse colors also ignored due to the same reason.

  final bool d = dark;

  final primaries = palette.primary;
  final secondaries = palette.secondary;
  final neutrals = palette.neutral;

  final Color primary = Color(primaries.get(d ? 80 : 40));
  final Color primaryContainer = Color(primaries.get(d ? 30 : 90));
  final Color secondary = Color(secondaries.get(d ? 80 : 40));
  final Color secondaryContainer = Color(secondaries.get(d ? 30 : 90));
  final Color error = Color(palette.error.get(d ? 80 : 40));
  // final Color errorContainer = Color(palette.error.get(d ? 30 : 90));

  final Color background = Color(neutrals.get(d ? 10 : 99));
  final Color surface = background;

  final Color onPrimary = Color(primaries.get(d ? 20 : 100));
  final Color onSecondary = Color(secondaries.get(d ? 20 : 100));
  // final Color onPrimaryContainer = Color(primaries.get(d ? 90 : 10));
  // final Color onSecondaryContainer = Color(secondaries.get(d ? 90 : 10));
  final Color onError = Color(palette.error.get(d ? 20 : 100));
  // final Color onErrorContainer = Color(palette.error.get(d ? 80 : 10));

  final Color onBackground = Color(neutrals.get(d ? 90 : 10));
  final Color onSurface = onBackground;

  final ColorScheme result = ColorScheme(
      primary: primary,
      primaryVariant: primaryContainer,
      secondary: secondary,
      secondaryVariant: secondaryContainer,
      surface: surface,
      background: background,
      error: error,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
      brightness: d ? Brightness.dark : Brightness.light);

  return result;
}
