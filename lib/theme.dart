import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff72323f),
      surfaceTint: Color(0xff8e4956),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8e4956),
      onPrimaryContainer: Color(0xffffcbd2),
      secondary: Color(0xff78555a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffdced4),
      onSecondaryContainer: Color(0xff79565b),
      tertiary: Color(0xff643f00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff815510),
      onTertiaryContainer: Color(0xffffd097),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff211a1b),
      onSurfaceVariant: Color(0xff524345),
      outline: Color(0xff857375),
      outlineVariant: Color(0xffd7c1c3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362e2f),
      inversePrimary: Color(0xffffb2bd),
      primaryFixed: Color(0xffffd9de),
      onPrimaryFixed: Color(0xff3b0715),
      primaryFixedDim: Color(0xffffb2bd),
      onPrimaryFixedVariant: Color(0xff72323f),
      secondaryFixed: Color(0xffffd9de),
      onSecondaryFixed: Color(0xff2d1419),
      secondaryFixedDim: Color(0xffe8bbc1),
      onSecondaryFixedVariant: Color(0xff5e3e43),
      tertiaryFixed: Color(0xffffddb6),
      onTertiaryFixed: Color(0xff2a1800),
      tertiaryFixedDim: Color(0xfff7bc6f),
      onTertiaryFixedVariant: Color(0xff643f00),
      surfaceDim: Color(0xffe4d7d7),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef0f1),
      surfaceContainer: Color(0xfff9ebeb),
      surfaceContainerHigh: Color(0xfff3e5e6),
      surfaceContainerHighest: Color(0xffeddfe0),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5d222f),
      surfaceTint: Color(0xff8e4956),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8e4956),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4c2e33),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff886369),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4e3000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff815510),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff161010),
      onSurfaceVariant: Color(0xff413234),
      outline: Color(0xff5f4e50),
      outlineVariant: Color(0xff7b696b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362e2f),
      inversePrimary: Color(0xffffb2bd),
      primaryFixed: Color(0xffa05765),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff83404d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff886369),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6e4c51),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff92641f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff764c05),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd0c3c4),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef0f1),
      surfaceContainer: Color(0xfff3e5e6),
      surfaceContainerHigh: Color(0xffe7dada),
      surfaceContainerHighest: Color(0xffdccecf),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff511825),
      surfaceTint: Color(0xff8e4956),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff753542),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff412429),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff614045),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff402700),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff674100),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff36292a),
      outlineVariant: Color(0xff554547),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362e2f),
      inversePrimary: Color(0xffffb2bd),
      primaryFixed: Color(0xff753542),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff591f2c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff614045),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff482a2f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff674100),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff492d00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2b6b6),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcedee),
      surfaceContainer: Color(0xffeddfe0),
      surfaceContainerHigh: Color(0xffdfd1d2),
      surfaceContainerHighest: Color(0xffd0c3c4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb2bd),
      surfaceTint: Color(0xffffb2bd),
      onPrimary: Color(0xff561c2a),
      primaryContainer: Color(0xff8e4956),
      onPrimaryContainer: Color(0xffffcbd2),
      secondary: Color(0xffe8bbc1),
      onSecondary: Color(0xff45282d),
      secondaryContainer: Color(0xff614045),
      onSecondaryContainer: Color(0xffd9adb3),
      tertiary: Color(0xfff7bc6f),
      onTertiary: Color(0xff462a00),
      tertiaryContainer: Color(0xff815510),
      onTertiaryContainer: Color(0xffffd097),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff181213),
      onSurface: Color(0xffeddfe0),
      onSurfaceVariant: Color(0xffd7c1c3),
      outline: Color(0xffa08c8e),
      outlineVariant: Color(0xff524345),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeddfe0),
      inversePrimary: Color(0xff8e4956),
      primaryFixed: Color(0xffffd9de),
      onPrimaryFixed: Color(0xff3b0715),
      primaryFixedDim: Color(0xffffb2bd),
      onPrimaryFixedVariant: Color(0xff72323f),
      secondaryFixed: Color(0xffffd9de),
      onSecondaryFixed: Color(0xff2d1419),
      secondaryFixedDim: Color(0xffe8bbc1),
      onSecondaryFixedVariant: Color(0xff5e3e43),
      tertiaryFixed: Color(0xffffddb6),
      onTertiaryFixed: Color(0xff2a1800),
      tertiaryFixedDim: Color(0xfff7bc6f),
      onTertiaryFixedVariant: Color(0xff643f00),
      surfaceDim: Color(0xff181213),
      surfaceBright: Color(0xff3f3738),
      surfaceContainerLowest: Color(0xff130d0d),
      surfaceContainerLow: Color(0xff211a1b),
      surfaceContainer: Color(0xff251e1f),
      surfaceContainerHigh: Color(0xff302829),
      surfaceContainerHighest: Color(0xff3b3334),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd1d7),
      surfaceTint: Color(0xffffb2bd),
      onPrimary: Color(0xff48111f),
      primaryContainer: Color(0xffc97a87),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd1d7),
      onSecondary: Color(0xff391e22),
      secondaryContainer: Color(0xffaf868c),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd5a4),
      onTertiary: Color(0xff372100),
      tertiaryContainer: Color(0xffbb873f),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff181213),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed7d9),
      outline: Color(0xffc2adaf),
      outlineVariant: Color(0xff9f8c8e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeddfe0),
      inversePrimary: Color(0xff733340),
      primaryFixed: Color(0xffffd9de),
      onPrimaryFixed: Color(0xff2c000b),
      primaryFixedDim: Color(0xffffb2bd),
      onPrimaryFixedVariant: Color(0xff5d222f),
      secondaryFixed: Color(0xffffd9de),
      onSecondaryFixed: Color(0xff21090e),
      secondaryFixedDim: Color(0xffe8bbc1),
      onSecondaryFixedVariant: Color(0xff4c2e33),
      tertiaryFixed: Color(0xffffddb6),
      onTertiaryFixed: Color(0xff1c0e00),
      tertiaryFixedDim: Color(0xfff7bc6f),
      onTertiaryFixedVariant: Color(0xff4e3000),
      surfaceDim: Color(0xff181213),
      surfaceBright: Color(0xff4b4243),
      surfaceContainerLowest: Color(0xff0b0607),
      surfaceContainerLow: Color(0xff231c1d),
      surfaceContainer: Color(0xff2d2627),
      surfaceContainerHigh: Color(0xff383131),
      surfaceContainerHighest: Color(0xff443c3c),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffebed),
      surfaceTint: Color(0xffffb2bd),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffacb9),
      onPrimaryContainer: Color(0xff210007),
      secondary: Color(0xffffebed),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe4b7bd),
      onSecondaryContainer: Color(0xff1a0509),
      tertiary: Color(0xffffeddb),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff2b86b),
      onTertiaryContainer: Color(0xff140900),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff181213),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffebed),
      outlineVariant: Color(0xffd3bdbf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeddfe0),
      inversePrimary: Color(0xff733340),
      primaryFixed: Color(0xffffd9de),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb2bd),
      onPrimaryFixedVariant: Color(0xff2c000b),
      secondaryFixed: Color(0xffffd9de),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe8bbc1),
      onSecondaryFixedVariant: Color(0xff21090e),
      tertiaryFixed: Color(0xffffddb6),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff7bc6f),
      onTertiaryFixedVariant: Color(0xff1c0e00),
      surfaceDim: Color(0xff181213),
      surfaceBright: Color(0xff574e4f),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff251e1f),
      surfaceContainer: Color(0xff362e2f),
      surfaceContainerHigh: Color(0xff42393a),
      surfaceContainerHighest: Color(0xff4d4545),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
