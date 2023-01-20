part of 'theme.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.amber),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 16.0))));

const inputTheme = InputDecorationTheme(border: OutlineInputBorder());