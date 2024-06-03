import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/data/hive_database.dart';
import 'note.dart';

class NoteData extends ChangeNotifier {
  final HiveDatabase db = HiveDatabase();
  List<Note> allNotes = [];

  Future<void> initializeNotes() async {
    await db.init();
    allNotes = db.loadNotes();
    notifyListeners();
  }

  List<Note> getallNotes() {
    return allNotes;
  }

  void addNewNote(Note note) {
    allNotes.add(note);
    db.saveNotes(allNotes);
    notifyListeners();
  }

  void updateNote(Note note, String text) {
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id) {
        allNotes[i].text = text;
      }
    }
    db.saveNotes(allNotes);
    notifyListeners();
  }

  void deleteNote(Note note) {
    allNotes.remove(note);
    db.saveNotes(allNotes);
    notifyListeners();
  }
}
