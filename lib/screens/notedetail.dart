// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:simple_note_app/models/note.dart';
import 'package:simple_note_app/services/dbHelper.dart';

class NoteDetail extends StatefulWidget {
  Note note;

  static const String route = '/NoteDetail';

  NoteDetail(this.note, {Key? key}) : super(key: key);
  //NoteDetail(this.note);
  @override
  _NoteDetailState createState() => _NoteDetailState(note);
}

class _NoteDetailState extends State<NoteDetail> {
  Note note;
  _NoteDetailState(this.note);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: ListView(
          children: [
            buildTitleDetailCard(),
            buildDivider(30.0),
            buildDescDetailCard(),
            buildDivider(70.0),
            buildDeleteButton(),
          ],
        ),
      ),
    );
  }

  buildTitleDetailCard() {
    return Card(
      child: ListTile(
        title: Text("${note.noteTitle}"),
        subtitle: Text("${note.time.toString()} gün"),
      ),
    );
  }

  buildDescDetailCard() {
    return Card(
      child: Text("${note.noteDescription}"),
    );
  }

  buildDeleteButton() {
    return IconButton(
      onPressed: () {
        var alert = AlertDialog(
          title: const Text("bu kayıt silinecek"),
          content: const Text("kaydı silmek istediğinden emin misin?"),
          actions: [
            TextButton(
              onPressed: deleteNote,
              child: const Text("evet, sil"),
            ),
          ],
        );
        showDialog(context: context, builder: (builder) => alert);
      },
      icon: const Icon(
        Icons.delete,
        size: 20,
        color: Color(0xff6ea0b8),
      ),
    );
  }

  void deleteNote() async {
    await DbHelper().delete(note.id!);
    Navigator.pop(context); // dismiss the alertDialog
    Navigator.pop(context, true);
  }

  buildDivider(double indent) {
    return Divider(
      height: 35,
      thickness: 1,
      endIndent: indent,
      indent: indent,
      color: Colors.grey,
    );
  }
}
