import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/themes/colors_app.dart';

class CustomButtonCircular extends StatelessWidget {
  final double height;
  final double width;
  final String textButton;
  final Function onTap;
  const CustomButtonCircular(
      this.height, this.width, this.textButton, this.onTap,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorsApp.kPrimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              textButton,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
