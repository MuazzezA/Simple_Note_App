import 'package:flutter/material.dart';
import 'package:simple_note_app/models/note.dart';
import 'package:simple_note_app/services/dbHelper.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<Note>? noteList;
  DbHelper dbHelper = DbHelper();
  int? noteItemCount = 0;

  @override
  void initState() {
    getNoteInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 40.0,
              floating: false,
              snap: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Note List",
                    style: TextStyle(fontFamily: 'Yaquote', fontSize: 35)),
                centerTitle: true,
                titlePadding: EdgeInsetsDirectional.only(bottom: 10),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return buildNoteCard(index);
                },
                childCount: noteItemCount,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            gotoNoteAdd();
          }),
    );
  }

  Widget buildNoteCard(int x) {
    return Card(
      child: ListTile(
        title: Text("${noteList![x].noteTitle}"),
        trailing: Text(noteList![x].time.toString()),
        onTap: () {
          goToNoteDetail(noteList![x]);
        },
      ),
    );
  }

  void gotoNoteAdd() async {
    Navigator.pushNamed(context, '/NoteAdd').then((value) {
      setState(() {
        getNoteInit();
      });
    });
  }

  Future<void> goToNoteDetail(Note notex) async {
    Navigator.pushNamed(context, '/NoteDetail', arguments: notex).then((value) {
      setState(() {
        getNoteInit();
      });
    });
  }

  void getNoteInit() {
    var list = dbHelper.getNotes();
    list.then((value) {
      setState(() {
        noteList = value;
        noteItemCount = noteList?.length;
      });
    });
  }
}
