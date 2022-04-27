import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/themes/colors_app.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorsApp.kSecondColor.withOpacity(0.5),
          ),
          height: size.height * 0.8,
          width: size.width <= 1000 ? size.width * 0.8 : size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIconColor: Colors.red,
                              iconColor: Colors.red,
                              fillColor: Colors.red,
                              hoverColor: Colors.red,
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
