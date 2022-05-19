import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final Color? color;
  final double height;
  final double width;
  final String? textLabel;
  final String? prefixText;
  final Function(String)? onChanged;
  final String? Function(String? string)? validator;
  final List<TextInputFormatter>? formaters;
  const CustomFieldWidget(
      {Key? key,
      required this.height,
      required this.width,
      this.textEditingController,
      this.color,
      this.textLabel,
      this.validator,
      this.prefixText,
      this.onChanged,
      this.formaters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        inputFormatters: formaters,
        validator: validator,
        controller: textEditingController ?? TextEditingController(),
        onChanged: onChanged,
        decoration: InputDecoration(
            prefixText: prefixText ?? '',
            fillColor: color ?? Theme.of(context).primaryColor.withOpacity(0.2),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: textLabel ?? ''),
      ),
    );
  }
}
