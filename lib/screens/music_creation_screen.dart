import 'package:flutter/material.dart';
import '../widgets/musical_sheet_widget.dart';
import '../utils/constants.dart';

class MusicCreationScreen extends StatefulWidget {
  @override
  State<MusicCreationScreen> createState() => _MusicCreationScreenState();
}

class _MusicCreationScreenState extends State<MusicCreationScreen> {
  String selectedNoteBegin = notes.first;
  String selectedNoteEnd   = notes.last;

  List<String> get filteredNotesBegin {
    // Return notes from A0 to the selected end note
    return notes.sublist(0, notes.indexOf(selectedNoteEnd) + 1);
  }

  List<String> get filteredNotesEnd {
    // Return notes from the selected begin note to C8
    return notes.sublist(notes.indexOf(selectedNoteBegin));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
        children: [
          // Navigation Menu
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Logic for playing notes
                  },
                  icon: Icon(Icons.play_arrow),
                  label: Text('Play'),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Logic for adding notes
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Note'),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Additional functionality (e.g., clear sheet)
                  },
                  icon: Icon(Icons.clear),
                  label: Text('Clear'),
                ),
                SizedBox(width: 20),
                DropdownButton<String>(
                  value: selectedNoteBegin,
                  icon: Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedNoteBegin = newValue!;
                    });
                  },
                  items: filteredNotesBegin.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(width: 20),
                DropdownButton<String>(
                  value: selectedNoteEnd,
                  icon: Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedNoteEnd = newValue!;
                    });
                  },
                  items: filteredNotesEnd.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // Musical Sheet Widget
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 20),
                // The MusicalSheetWidget takes up the available space
                Expanded(
                  child: MusicalSheetWidget(
                    selectedNoteBegin: selectedNoteBegin,
                    selectedNoteEnd: selectedNoteEnd,
                  ),
                ),
                // Spacer to push the Text widget to the bottom
                Spacer(),
                // Text at the bottom of the page
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Musical sheet range: $selectedNoteBegin - $selectedNoteEnd',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}