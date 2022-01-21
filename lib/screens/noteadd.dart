import 'package:flutter/material.dart';
import 'package:simple_note_app/models/note.dart';
import 'package:simple_note_app/services/dbHelper.dart';

class NoteAdd extends StatefulWidget {
  const NoteAdd({Key? key}) : super(key: key);

  @override
  _NoteAddState createState() => _NoteAddState();
}

class _NoteAddState extends State<NoteAdd> {
  DbHelper dbHelper = DbHelper();

  TextEditingController txtControllerTitle = TextEditingController();
  TextEditingController txtControllerDesc = TextEditingController();
  int time = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: ListView(
          children: [
            buildTitleTextField(),
            const SizedBox(
              height: 15,
            ),
            buildDescTextField(),
            const SizedBox(
              height: 20,
            ),
            buildTimeIconButtons(),
            const SizedBox(
              height: 25,
            ),
            buildSaveButton(),
          ],
        ),
      ),
    );
  }

  buildTitleTextField() {
    return Card(
      color: const Color(0xfff0f8ff),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 1,
        controller: txtControllerTitle,
        decoration: const InputDecoration(
          labelText: "BASLIK",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff0f8ff)),
          ),
        ),
      ),
    );
  }

  buildDescTextField() {
    return Card(
      color: const Color(0xfff0f8ff),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 20,
        controller: txtControllerDesc,
        decoration: const InputDecoration(
          labelText: "ACIKLAMA",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff0f8ff)),
          ),
        ),
      ),
    );
  }

  buildTimeIconButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                time = 1;
              });
            },
            icon: Icon(
              Icons.looks_one,
              color: time == 1 ? const Color(0xff6ea0b8) : Colors.black,
            )),
        IconButton(
            onPressed: () {
              setState(() {
                time = 3;
              });
            },
            icon: Icon(
              Icons.looks_3,
              color: time == 3 ? const Color(0xff6ea0b8) : Colors.black,
            )),
        IconButton(
            onPressed: () {
              setState(() {
                time = 6;
              });
            },
            icon: Icon(
              Icons.looks_6,
              color: time == 6 ? const Color(0xff6ea0b8) : Colors.black,
            )),
      ],
    );
  }

  buildSaveButton() {
    return ElevatedButton(
      onPressed: saveAction,
      child: const Text("KAYDET"),
      style: ElevatedButton.styleFrom(primary: const Color(0xff6ea0b8)),
    );
  }

  saveAction() async {
    if (time != 0 && txtControllerTitle.text.isNotEmpty) {
      var result = dbHelper.insert(Note(
          noteTitle: txtControllerTitle.text,
          noteDescription: txtControllerDesc.text,
          time: time));

      Navigator.pop(context, result);
    } else if (txtControllerTitle.text.isEmpty) {
      buildSnackBar("baslik bos bırakılamaz");
    } else if (time == 0) {
      buildSnackBar("lütfen gün seçiniz");
    }
  }

  buildSnackBar(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }
}
