import 'package:flutter/material.dart';

class JokeWidget extends StatelessWidget {
  final String setup;
  final String punchline;

  const JokeWidget({
    Key? key,
    required this.setup,
    required this.punchline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 104, 3, 101), // Subtle darker pink card color
      elevation: 4, // Softer shadow for a clean look
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Softer rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0), // Slightly more padding around content
        child: ListTile(
          contentPadding: EdgeInsets.zero, // Remove default padding
          title: Text(
            setup,
            style: const TextStyle(
              fontWeight: FontWeight.w600, // Semi-bold for better readability
              fontSize: 20,
              color: Colors.white, // White text for better contrast
            ),
          ),
          subtitle: Text(
            punchline,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70, // Lighter text for punchline
              fontStyle: FontStyle.italic, // Italicized for emphasis
            ),
          ),
          leading: const Icon(
            Icons.sentiment_very_satisfied_rounded,
            color: Color.fromARGB(255, 243, 222, 30), // Friendly yellow accent for the icon
            size: 45, // Larger icon size
          ),
        ),
      ),
    );
  }
}
