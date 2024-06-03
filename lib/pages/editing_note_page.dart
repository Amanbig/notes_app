import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/notes_data.dart';
import 'package:provider/provider.dart';

class EditingNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;
  EditingNotePage({super.key,required this.note,required this.isNewNote});

  @override
  State<EditingNotePage> createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {
  QuillController _controller = QuillController.basic();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadExitingNote();
  }
  void loadExitingNote(){
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(document: doc, selection: TextSelection.collapsed(offset: 0));
    });
  }
  void addNewNote(){
    int id = Provider.of<NoteData>(context,listen: false).getallNotes().length;
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context,listen: false).addNewNote(Note(id:id,text:text));
  }
  void updateNote(){
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context,listen: false).updateNote(widget.note, text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            if(widget.isNewNote && !_controller.document.isEmpty()){
              addNewNote();
            }
            else{
              updateNote();
            }
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          QuillToolbar.simple(configurations: QuillSimpleToolbarConfigurations(controller: _controller)),
          Expanded(child: Container(
            padding: EdgeInsets.all(25),
            child: QuillEditor.basic(configurations: QuillEditorConfigurations(controller: _controller,checkBoxReadOnly: false),),

          ))
        ],
      ),
    );
  }
}
