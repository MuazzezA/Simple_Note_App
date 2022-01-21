import 'package:flutter/material.dart';
import 'package:simple_note_app/screens/notelist.dart';
import 'package:simple_note_app/screens/noteadd.dart';
import 'package:simple_note_app/screens/notedetail.dart';

import 'models/note.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (context) => const NoteList(),
  "/NoteAdd": (context) => const NoteAdd(),
  NoteDetail.route: (context) =>
      NoteDetail(ModalRoute.of(context)!.settings.arguments as Note),
};
