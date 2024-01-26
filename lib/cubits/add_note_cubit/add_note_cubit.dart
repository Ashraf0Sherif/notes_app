import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color noteColor = const Color(0xff1E1E24);

  addNote(NoteModel note) async {
    note.color = noteColor.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      debugPrint(notesBox.values.toString());
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
