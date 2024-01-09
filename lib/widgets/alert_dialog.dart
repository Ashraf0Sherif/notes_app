import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Remove note"),
      content: const Text("Are you sure ?"),
      actions: [
        CupertinoDialogAction(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: const Text("Remove"),
          onPressed: () {
            note.delete();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
