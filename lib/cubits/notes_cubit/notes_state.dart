part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}
class NotesEmpty extends NotesState {
  bool search;
  NotesEmpty({this.search = false});
}
class NotesChange extends NotesState {}

