import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/custom_search_bar.dart';
import 'package:notes_app/widgets/empty_notes_screen.dart';
import 'package:notes_app/widgets/notes_screen.dart';
import '../cubits/notes_cubit/notes_cubit.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const CustomSearchBar(),
        Expanded(
          child: BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              if (state is NotesEmpty) {
                return EmptyNotesScreen(search: state.search);
              } else {
                return const NotesScreen();
              }
            },
          ),
        ),
      ],
    );
  }
}
