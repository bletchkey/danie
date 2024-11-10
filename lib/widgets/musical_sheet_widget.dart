import 'package:flutter/material.dart';
import '../utils/constants.dart';

class MusicalSheetWidget extends StatelessWidget {

  final String selectedNoteBegin;
  final String selectedNoteEnd;

  MusicalSheetWidget({
    required this.selectedNoteBegin,
    required this.selectedNoteEnd,
  });

  @override
  Widget build(BuildContext context) {
    // Get the range of notes between the selected begin and end notes
    int startIndex = notes.indexOf(selectedNoteBegin);
    int endIndex   = notes.indexOf(selectedNoteEnd) + 1;
    List<String> notesInRange = notes.sublist(startIndex, endIndex);

    return Container(
      width: double.infinity,
      height: 600,
      child: CustomPaint(
        painter: DynamicMusicalSheetPainter(
          notesRange: notesInRange,
          noteTypeMap: notePositionTypeOnMusicalSheet
        ),
      ),
    );
  }
}

class DynamicMusicalSheetPainter extends CustomPainter {
  final List<String> notesRange;
  final Map<String, String> noteTypeMap;

  DynamicMusicalSheetPainter({
    required this.notesRange,
    required this.noteTypeMap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    // Calculate line spacing dynamically to fit the notes within the canvas height
    double lineSpacing = size.height / notesRange.length;
    double startY = size.height; // Start from the bottom of the canvas

    // Draw lines and spaces for the notes in the range from bottom (A0) to top (C8)
    for (int i = 0; i < notesRange.length; i++) {
      String note = notesRange[i];
      bool isLine = noteTypeMap[note] == 'line';

      // Calculate the y-position for the current note
      double yPosition = startY - (i * lineSpacing);

      // Draw the line if the note is a "line" type
      if (isLine) {
        canvas.drawLine(
          Offset(20, yPosition),
          Offset(size.width, yPosition),
          linePaint,
        );
      }

      // Draw the note name without overlapping with the lines
      TextPainter textPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: note,
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(5, yPosition - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint when the range changes
  }
}