import 'package:flutter/material.dart';
import 'screens/music_creation_screen.dart';
import '../utils/constants.dart';

void main() {
  runApp(Danie());
}

class Danie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Danie',
      theme: ThemeData(primarySwatch: materialColorDanie),
      home: MusicCreationScreen(),
    );
  }
}