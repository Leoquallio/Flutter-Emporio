import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/home/home_screen.dart';
import 'package:flutter_emporio/src/themes/custom_theme_data.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Empório da cidade',
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        theme: CustomThemeData.themeData);
  }
}
