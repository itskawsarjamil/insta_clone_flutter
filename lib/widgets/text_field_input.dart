import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String textHint;
  final bool isPass;
  final TextInputType textInputType;
  const TextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.textInputType,
    this.isPass = false,
    required this.textHint,
  });
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      // borderSide:  BorderSide(
      //   // width: 2,
      //   // color: Colors.white,
      // ),
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: textHint,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        // fillColor: ,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
