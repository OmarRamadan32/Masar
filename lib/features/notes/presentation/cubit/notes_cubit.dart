import 'package:bloc/bloc.dart';
import 'package:masar/features/notes/data/models/note_model.dart';
import 'package:masar/features/notes/data/repo/notes_repo.dart';
import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit({required this.notesRepo}) : super(NotesInitial());
  final NotesRepo notesRepo;
  List<NoteModel> notes = [];

  void getNotes() {
    notes = notesRepo.getAllNotes();
    emit(NotesLoaded(notes: notes));
  }

  Future<void> addNote({required NoteModel note}) async {
    emit(NotesLoading());
    await notesRepo.addNote(note: note);
    getNotes();
  }

  Future<void> deleteNote({required NoteModel note}) async {
    await notesRepo.deleteNote(note: note);
    getNotes();
  }

  Future<void> updateNote({required NoteModel note}) async {
    await notesRepo.updateNote(note: note);
    getNotes();
  }

  Future<void> deleteNotes({required List<NoteModel> notes}) async {
    await notesRepo.deleteNotes(notes: notes);
    getNotes();
  }

  Future<void> removeNotesCategory({required String categoryName}) async {
    await notesRepo.removeNotesCategory(categoryName: categoryName);
    getNotes();
  }
}
