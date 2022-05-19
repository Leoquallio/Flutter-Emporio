import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_emporio/src/themes/custom_theme_data.dart';
import 'package:flutter_emporio/src/utils/custom_dio.dart';
import 'package:flutter_emporio/src/view/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'controller/controller.dart';
import 'repository/repository.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CustomDio>(
          create: (context) => CustomDio(Dio()),
        ),
        Provider<ProductRepository>(
          lazy: false,
          create: (context) => ProductRepository(
            Provider.of<CustomDio>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider<ProductsController>(
          lazy: true,
          create: (context) => ProductsController(
            Provider.of<ProductRepository>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider<ProductPageController>(
          lazy: true,
          create: (context) => ProductPageController(
            Provider.of<ProductRepository>(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp(
          title: 'Empório da cidade',
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
          theme: CustomThemeData.themeData),
    );
  }
}
