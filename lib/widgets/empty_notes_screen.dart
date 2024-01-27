import 'package:flutter/material.dart';

class EmptyNotesScreen extends StatelessWidget {
  const EmptyNotesScreen({super.key, required this.search});

  final bool search;

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
          Text(
            search ? "There is no such a note" : "Add some notes",
            style: const TextStyle(fontSize: 17),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
