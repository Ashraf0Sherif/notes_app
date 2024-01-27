import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: TextFormField(
          controller: controller,
          onChanged: (text) {
            print(BlocProvider.of<NotesCubit>(context).notes);
            BlocProvider.of<NotesCubit>(context).searchNotes(text);
          },
          cursorColor: Colors.blueGrey,
          cursorRadius: const Radius.circular(20),
          cursorHeight: 19,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear, color: Colors.blueGrey),
              onPressed: () {
                controller.clear();
                FocusScope.of(context).unfocus();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20),
            hintText: 'Search for a note',
            hintStyle: const TextStyle(color: Colors.white60),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(50.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2.3, color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }
}
