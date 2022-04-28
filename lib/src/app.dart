import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/controller/product_controller.dart';

import 'package:flutter_emporio/src/themes/custom_theme_data.dart';
import 'package:flutter_emporio/src/view/home/home_screen.dart';
import 'package:flutter_emporio/src/view/product/product_screen.dart';
import 'package:provider/provider.dart';

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
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<ProductController>(
                lazy: true, create: (context) => ProductController()),
          ],
          child: const HomeScreen(),
        ),
        theme: CustomThemeData.themeData);
  }
}
