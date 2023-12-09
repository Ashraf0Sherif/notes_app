import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_widget.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      backgroundColor: Color(0xff2D2F2F),
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Color(0xff303030),
        title: Text("Notes"),
      ),
      body: ListView(
        children: [
          NoteCard(),
          NoteCard(),
          NoteCard(),
        ],
      ),
    );
  }
}
