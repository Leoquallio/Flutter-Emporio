import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/themes/colors_app.dart';

class CustomButtonDrawer extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  const CustomButtonDrawer(this.height, this.width, this.text, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: ColorsApp.kPrimaryColor,
            borderRadius: BorderRadius.circular(30)),
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
