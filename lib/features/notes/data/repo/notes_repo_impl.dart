import 'package:masar/core/constants/hive_constants.dart';
import 'package:masar/core/database/datebase_service.dart';
import 'package:masar/features/notes/data/models/note_model.dart';
import 'package:masar/features/notes/data/repo/notes_repo.dart';

class NotesRepoImpl implements NotesRepo {
  final DatabaseService databaseService;
  NotesRepoImpl({required this.databaseService});

  @override
  Future<void> addNote({required NoteModel note}) async {
   databaseService.add<NoteModel>(HiveConstants.notesBox, note);
  }

  @override
  Future<void> deleteNote({required NoteModel note}) async {
  note.delete();
  }

  @override
  List<NoteModel> getAllNotes() {
    List<NoteModel> notes = databaseService.getAll<NoteModel>(
      HiveConstants.notesBox,
    );
    return notes;
  }

  @override
  Future<void> updateNote({required NoteModel note})async {
     note.save();
  }
}
