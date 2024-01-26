part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}
class NotesEmpty extends NotesState {}
class NotesChange extends NotesState {}

