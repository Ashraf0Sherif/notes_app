import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is required";
          }
          return null;
        },
        cursorColor: Colors.red,
        cursorRadius: const Radius.circular(20),
        cursorHeight: 19,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search for a note',
          hintStyle: const TextStyle(color: Colors.white60),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white70),
            borderRadius: BorderRadius.circular(50.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white70),
            borderRadius: BorderRadius.circular(50.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white70),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        onFieldSubmitted: (text) {},
      ),
    );
  }
}
