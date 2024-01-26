import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import '../constants.dart';
import 'colors_list_view.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late int tappedIndex;

  @override
  void initState() {
    tappedIndex = kColors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                tappedIndex = index;
                widget.noteModel.color = kColors[tappedIndex].value;
              });
            },
            child: ColorItem(
              color: kColors[index],
              clicked: tappedIndex == index,
            ),
          );
        },
        itemCount: kColors.length,
      ),
    );
  }
}
