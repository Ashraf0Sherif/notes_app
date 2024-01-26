import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/notes_view_body.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../widgets/add_note_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (BuildContext context) => AddNoteCubit(),
                child: const AddNoteBottomSheet(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(
        child: NotesViewBody(),
      ),
    );
  }
}
