import 'package:flutter/material.dart';
class EmptyNotesScreen extends StatelessWidget {
  const EmptyNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Image.asset(
            "assets/images/searching-data.png",
            width: 240,
          ),
          const Text("Add some notes",style: TextStyle(fontSize: 17),),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
