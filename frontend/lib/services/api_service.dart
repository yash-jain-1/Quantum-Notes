import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/note.dart';

class ApiService {
  final String baseUrl = 'http://localhost:3000/api/Nota';

  Future<List<Note>> fetchNotes() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Note.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load notes');
    }
  }

  Future<Note> addNote(Note note) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(note),
    );

    if (response.statusCode == 201) {
      return Note.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add note');
    }
  }

  // Implement update and delete methods similarly
}
