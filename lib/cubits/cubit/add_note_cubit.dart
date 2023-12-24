import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_note_state.dart';

class NotesCubit extends Cubit<AddNoteInitial> {
  NotesCubit() : super(AddNoteInitial());
}
