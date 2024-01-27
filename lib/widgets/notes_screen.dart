import 'package:flutter/material.dart';
import 'notes_list_view.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Column(
        children: [

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: NotesListView(),
            ),
          ),
        ],
      ),
    );
  }
}
