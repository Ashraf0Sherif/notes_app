import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({super.key, required this.icon, this.onPressed});

  final IconData icon;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
