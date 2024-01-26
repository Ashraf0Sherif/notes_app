import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/empty_notes_screen.dart';
import 'package:notes_app/widgets/notes_screen.dart';
import '../cubits/notes_cubit/notes_cubit.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        var notes = BlocProvider.of<NotesCubit>(context).notes;
        if (notes.isEmpty) {
          return const EmptyNotesScreen();
        } else {
          return NotesScreen();
        }
      },
    );
  }
}
