import 'package:flutter/material.dart';

class CustomFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final Color? color;
  final double height;
  final double width;
  final String? textLabel;
  const CustomFieldWidget(
      {Key? key,
      required this.height,
      required this.width,
      this.textEditingController,
      this.color,
      this.textLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
          controller: textEditingController ?? TextEditingController(),
          decoration: InputDecoration(
              fillColor:
                  color ?? Theme.of(context).primaryColor.withOpacity(0.2),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: textLabel ?? '')),
    );
  }
}
