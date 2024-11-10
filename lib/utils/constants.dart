import 'package:flutter/material.dart';

// General
const Text appNameText = Text('Danie');

// General dimensions
const double musicalSheetLineSpacing = 20.0;
const double musicalSheetWidth       = 400.0;
const double musicalSheetHeight      = 200.0;

const double barStrokeWidth          = 0.5;

// Colors
const MaterialColor materialColorDanie = Colors.blue;
const Color musicalSheetLineColor      = Colors.black;
const Color noteColor                  = Colors.blue;

// Text styles
const TextStyle titleTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
);

// Notes related
const List<String> notes = [
  'A0', 'B0',
  'C1', 'D1', 'E1', 'F1', 'G1', 'A1', 'B1',
  'C2', 'D2', 'E2', 'F2', 'G2', 'A2', 'B2',
  'C3', 'D3', 'E3', 'F3', 'G3', 'A3', 'B3',
  'C4', 'D4', 'E4', 'F4', 'G4', 'A4', 'B4',
  'C5', 'D5', 'E5', 'F5', 'G5', 'A5', 'B5',
  'C6', 'D6', 'E6', 'F6', 'G6', 'A6', 'B6',
  'C7', 'D7', 'E7', 'F7', 'G7', 'A7', 'B7',
  'C8'];

// Dictionary mapping each note to whether it is on a line or space
const Map<String, String> notePositionTypeOnMusicalSheet = {
  'A0': 'space', 'B0': 'line' ,
  'C1': 'space', 'D1': 'line' , 'E1': 'space', 'F1': 'line' , 'G1': 'space', 'A1': 'line' , 'B1': 'space',
  'C2': 'line' , 'D2': 'space', 'E2': 'line' , 'F2': 'space', 'G2': 'line' , 'A2': 'space', 'B2': 'line' ,
  'C3': 'space', 'D3': 'line' , 'E3': 'space', 'F3': 'line' , 'G3': 'space', 'A3': 'line' , 'B3': 'space',
  'C4': 'line' , 'D4': 'space', 'E4': 'line' , 'F4': 'space', 'G4': 'line' , 'A4': 'space', 'B4': 'line' ,
  'C5': 'space', 'D5': 'line' , 'E5': 'space', 'F5': 'line' , 'G5': 'space', 'A5': 'line' , 'B5': 'space',
  'C6': 'line' , 'D6': 'space', 'E6': 'line' , 'F6': 'space', 'G6': 'line' , 'A6': 'space', 'B6': 'line' ,
  'C7': 'space', 'D7': 'line' , 'E7': 'space', 'F7': 'line' , 'G7': 'space', 'A7': 'line' , 'B7': 'space',
  'C8': 'line'
};