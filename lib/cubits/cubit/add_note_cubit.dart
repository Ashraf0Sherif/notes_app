import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class NotesCubit extends Cubit<AddNoteInitial> {
  NotesCubit() : super(AddNoteInitial());
  addNote(NoteModel note){

  }
}
