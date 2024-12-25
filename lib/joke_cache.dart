import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class JokeCache {
  static const _cacheKey = 'cached_jokes';

  static Future<void> saveJokes(List<Map<String, dynamic>> jokes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_cacheKey, jsonEncode(jokes));
  }

  static Future<List<Map<String, dynamic>>> getCachedJokes() async {
    final prefs = await SharedPreferences.getInstance();
    final jokes = prefs.getString(_cacheKey);
    if (jokes != null) {
      return List<Map<String, dynamic>>.from(jsonDecode(jokes));
    }
    return [];
  }
}
