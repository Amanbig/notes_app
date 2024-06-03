import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_data.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import 'editing_note_page.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoteData>(context, listen: false).initializeNotes();
  }

  void createNewNote() {
    int id = Provider.of<NoteData>(context, listen: false).getallNotes().length;
    Note newNote = Note(
      id: id,
      text: '',
    );
    gotoNotePage(newNote, true);
  }

  void gotoNotePage(Note note, bool isNewNote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditingNotePage(note: note, isNewNote: isNewNote),
      ),
    );
  }

  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewNote,
          elevation: 0,
          backgroundColor: Colors.grey[300],
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 75),
              child: Text(
                'Notes',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            value.allNotes.isEmpty
                ? Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Text(
                  'Nothing Here..',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
            )
                : CupertinoListSection.insetGrouped(
              children: List.generate(
                value.allNotes.length,
                    (index) => CupertinoListTile(
                  title: Text(value.getallNotes()[index].text),
                  onTap: () => gotoNotePage(value.getallNotes()[index], false),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteNote(value.getallNotes()[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
