import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final String hintText;
  final bool? obScureText;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? minLines;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.onChanged,
      this.textInputType,
      this.obScureText = false,
      this.minLines = 1,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: textInputType,
      obscureText: obScureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kPrimaryColor,
        ),
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    );
  }
}
