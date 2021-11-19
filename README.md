# M3 Dynamic Palette Generator

The official [dynamic_color](https://pub.dev/packages/dynamic_color "dynamic_color") package by the Material Team does not allow us to use `CorePalette` that it returns from the system directly as a `ColorScheme`. This package is meant to provide a utility to work around this by generating a `ColorScheme` based on [official Material 3 Docs](https://m3.material.io/styles/color/the-color-system/tokens).

### NOTE: This package HAS to be used along with dynamic_color. 

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
              );
        });