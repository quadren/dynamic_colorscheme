import 'package:dynamic_color/dynamic_color.dart';
import 'package:dynamic_colorscheme/dynamic_colorscheme.dart';
import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

void main() {
  runApp(const DynamicPaletteGeneratorExample());
}

class DynamicPaletteGeneratorExample extends StatefulWidget {
  const DynamicPaletteGeneratorExample({Key? key}) : super(key: key);

  @override
  _DynamicPaletteGeneratorExampleState createState() =>
      _DynamicPaletteGeneratorExampleState();
}

class _DynamicPaletteGeneratorExampleState
    extends State<DynamicPaletteGeneratorExample> {
  /// [m3Light] and [m3Dark] will be generated for use on Android S+.
  ColorScheme? m3Light;
  ColorScheme? m3Dark;

  @override
  Widget build(BuildContext context) {
    /// fallback color schemes [light] and [dark].
    /// here, we're using the default Flutter schemes.
    ColorScheme light = const ColorScheme.light();
    ColorScheme dark = const ColorScheme.dark();

    /// to use this plugin, you need a [CorePalette] which is given by the dynamic_color package's [DynamicColorBuilder] widget.
    /// simply use it with material_color_utilities (exposes the [CorePalette] class) and if [palette] is != null, then generate the appropriate M3 dynamic color palette.
    return DynamicColorBuilder(builder: (CorePalette? palette) {
      if (palette != null) {
        m3Light = DynamicColorScheme.generate(palette, dark: false);
        m3Dark = DynamicColorScheme.generate(palette, dark: true);
      }

      /// since this takes a small amount of time to complete (uses a PlatformChannel, so it's asynchronous), to avoid a null error we need to pass in the fallback until [m3Light] and [m3Dark] are ready.
      /// if the scheme is never generated, continue to use the fallback.
      return MaterialApp(
          theme: m3Light == null
              ? ThemeData(colorScheme: light)
              : ThemeData(colorScheme: m3Light),
          darkTheme: m3Dark == null
              ? ThemeData(colorScheme: dark)
              : ThemeData(colorScheme: m3Dark),
          debugShowCheckedModeBanner: false,
          home: Builder(builder: (context) {
            ThemeData t = Theme.of(context);
            ColorScheme c = t.colorScheme;
            return Scaffold(
              backgroundColor: c.background,
              appBar: AppBar(
                  backgroundColor: c.surface,
                  title: Text('Dynamic Color Showcase',
                      style: TextStyle(color: c.onSurface))),
              body: Center(
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                    li('primary\nonPrimary Text', c.onPrimary, c.primary),
                    li('secondary\nonSecondary Text', c.onSecondary,
                        c.secondary),
                    li('error\nonError Text', c.onError, c.error),
                    li('surface\nonSurface Text', c.onSurface, c.surface),
                  ])),
            );
          }));
    });
  }

  Widget li(String text, Color textColor, Color boxColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
          child: Text(text,
              style: TextStyle(
                color: textColor,
              ),
              textAlign: TextAlign.center)),
    );
  }
}
