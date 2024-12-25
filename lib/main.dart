import 'package:flutter/material.dart';
import 'joke_service.dart';
import 'joke_cache.dart';
import 'widgets/joke_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFD81B60)),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFF4A0033),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ),
      home: const JokeHomePage(),
    );
  }
}

class JokeHomePage extends StatefulWidget {
  const JokeHomePage({super.key});

  @override
  State<JokeHomePage> createState() => _JokeHomePageState();
}

class _JokeHomePageState extends State<JokeHomePage> {
  late Future<List<Map<String, dynamic>>> _jokes;

  @override
  void initState() {
    super.initState();
    _fetchAndCacheJokes();
  }

  void _fetchAndCacheJokes() {
    setState(() {
      _jokes = fetchAndCacheJokes();
    });
  }

  Future<List<Map<String, dynamic>>> fetchAndCacheJokes() async {
    try {
      final jokes = await fetchJokes();
      await JokeCache.saveJokes(jokes);
      return jokes;
    } catch (e) {
      return await JokeCache.getCachedJokes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Daily Jokes'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFD81B60), Color(0xFF880E4F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _jokes,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFD81B60),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Oops! Something went wrong.\n${snapshot.error}',
                      style: const TextStyle(color: Colors.white70, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'No jokes found. Please refresh.',
                      style: TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                  );
                } else {
                  final jokes = snapshot.data!;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    itemCount: jokes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Color.fromARGB(255, 255, 204, 247),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: JokeWidget(
                          setup: jokes[index]['setup'],
                          punchline: jokes[index]['punchline'],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 226, 125, 199), Color.fromARGB(255, 188, 20, 82)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: const Offset(0, -2),
                  blurRadius: 6,
                ),
              ],
            ),
            child: ElevatedButton.icon(
              onPressed: _fetchAndCacheJokes,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFFD81B60),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.refresh, size: 24),
              label: const Text(
                'Refresh',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
