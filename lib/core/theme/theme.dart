import 'package:flutter/material.dart';
part 'colors.dart';
part 'components.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: tertiaryColor),
  elevatedButtonTheme: elevatedButtonTheme,
  inputDecorationTheme: inputTheme,
);