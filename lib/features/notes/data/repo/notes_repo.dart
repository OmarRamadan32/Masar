import 'package:masar/features/notes/data/models/note_model.dart';

abstract class NotesRepo {
  Future<void> addNote({required NoteModel note,});
  Future<void> deleteNote({required NoteModel note,});
  Future<void> updateNote({required NoteModel note,});
  List<NoteModel> getAllNotes();
}