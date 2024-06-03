import 'package:hive_flutter/hive_flutter.dart';
import '../models/note.dart';

class HiveDatabase {
  late Box _mybox;

  // Initialize Hive and open the box
  Future<void> init() async {
    await Hive.initFlutter();
    _mybox = await Hive.openBox('note_database');
  }

  // Load notes from the box
  List<Note> loadNotes() {
    List<Note> savedNotesFormatted = [];
    var savedNotes = _mybox.get('All_NOTES');

    if (savedNotes != null) {
      for (var note in savedNotes) {
        Note individualNote = Note(
          id: note[0],
          text: note[1],
        );
        savedNotesFormatted.add(individualNote);
      }
    } else {
      savedNotesFormatted.add(Note(
        id: 0,
        text: 'First Note',
      ));
    }

    return savedNotesFormatted;
  }

  // Save notes to the box
  void saveNotes(List<Note> allNotes) {
    List<List<dynamic>> allNotesFormatted = [];
    for (var note in allNotes) {
      allNotesFormatted.add([note.id, note.text]);
    }
    _mybox.put('All_NOTES', allNotesFormatted);
  }
}
