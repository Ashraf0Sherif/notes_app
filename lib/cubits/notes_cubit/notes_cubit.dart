import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import '../../constants.dart';
import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> notes = [];

  void fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    if (notes.isEmpty) {
      emit(NotesEmpty());
    } else {
      emit(NotesChange());
    }
  }

  void searchNotes(String searchText) async {
    if (searchText.isEmpty) {
      fetchAllNotes();
    } else {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
      List<NoteModel> notes1 = notes
          .where((element) =>
              element.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      List<NoteModel> notes2 = notes
          .where((element) =>
              element.subTitle
                  .toLowerCase()
                  .contains(searchText.toLowerCase()) &&
              !element.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      notes = notes1 + notes2;
      if (notes.isEmpty) {
        emit(NotesEmpty(search: true));
      } else {
        emit(NotesChange());
      }
    }
  }
}
