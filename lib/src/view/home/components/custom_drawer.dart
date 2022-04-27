import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/home/components/custom_button_drawer.dart';
import 'package:flutter_emporio/src/themes/colors_app.dart';

class CustomDrawer extends StatelessWidget {
  final Function onTapListMenu;
  final int indexWidget;
  CustomDrawer(this.onTapListMenu, this.indexWidget, {Key? key})
      : super(key: key);

  final List<String> listMenuDrawer = [
    'Dashboard',
    'Produtos',
    'Vendas',
    'Clientes',
    'Fornecedores'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: size.width <= 800 ? size.width * 0.55 : size.width * 0.25,
      color: ColorsApp.kSecondColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: size.height * 0.15,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: listMenuDrawer.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => onTapListMenu(index),
                child: CustomButtonDrawer(size.height * 0.05, double.infinity,
                    listMenuDrawer[index], indexWidget == index),
              ),
            )
          ],
        ),
      ),
    );
  }
}
