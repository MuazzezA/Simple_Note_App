import 'package:flutter/material.dart';
import 'package:simple_note_app/routes.dart';
import 'package:simple_note_app/themes/softtheme.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note_App',
      theme: softTheme(),
      initialRoute: '/',
      routes: routes,
    );
  }
}
