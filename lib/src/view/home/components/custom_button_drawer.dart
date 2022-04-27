import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/themes/colors_app.dart';

class CustomButtonDrawer extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final bool isSelected;
  const CustomButtonDrawer(this.height, this.width, this.text, this.isSelected,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                color: ColorsApp.kPrimaryColor,
                borderRadius: BorderRadius.circular(30))
            : const BoxDecoration(),
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.0173, left: 10),
          child: Text(
            text,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
