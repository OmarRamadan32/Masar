import 'package:masar/core/constants/hive_constants.dart';
import 'package:masar/core/database/datebase_service.dart';
import 'package:masar/features/notes/data/models/note_model.dart';
import 'package:masar/features/notes/data/repo/notes_repo.dart';

class NotesRepoImpl implements NotesRepo {
  final DatabaseService databaseService;
  
  NotesRepoImpl({required this.databaseService});
  static String boxName = HiveConstants.notesBox;

  @override
  Future<void> addNote({required NoteModel note}) async {
   databaseService.add<NoteModel>(boxName, note);
  }

  @override
  Future<void> deleteNote({required NoteModel note}) async {
  note.delete();
  }

  @override
  List<NoteModel> getAllNotes() {
    List<NoteModel> notes = databaseService.getAll<NoteModel>(
      boxName,
    );
    return notes;
  }

  @override
  Future<void> updateNote({required NoteModel note})async {
     note.save();
  }

  @override
  Future<void> deleteNotes({required List<NoteModel> notes})async {
    for (var note in notes) {
      note.delete();
    }
  }
}
