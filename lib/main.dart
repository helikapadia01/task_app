import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:task_app/screens/screens.dart';
import 'package:task_app/themes/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightScheme = lightDynamic.harmonized();
          darkScheme = darkDynamic.harmonized();

          lightCustomColors = lightCustomColors.harmonized(lightScheme);
          darkCustomColors = darkCustomColors.harmonized(darkScheme);
        } else {
          lightScheme = lightColorScheme;
          darkScheme = darkColorScheme;
        }

        return MaterialApp(
          title: "Task App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: lightScheme,
            appBarTheme: AppBarTheme(
              color: lightScheme.primary,
            ),
          ),
          darkTheme: ThemeData(
            colorScheme: darkScheme,
            appBarTheme: AppBarTheme(
              color: darkScheme.primary,
            ),
          ),
          themeMode: ThemeMode.light,
          home: TaskListingScreen(),
        );
      },
    );
  }
}
