import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchJokes() async {
  final url = Uri.parse('https://official-joke-api.appspot.com/random_ten');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jokes = jsonDecode(response.body) as List;
    return jokes.take(5).map((joke) => {
      'setup': joke['setup'],
      'punchline': joke['punchline'],
    }).toList();
  } else {
    throw Exception('Failed to fetch jokes');
  }
}
