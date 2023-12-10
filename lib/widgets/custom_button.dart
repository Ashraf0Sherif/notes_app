import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label,required this.onTap});
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );
  }
}
