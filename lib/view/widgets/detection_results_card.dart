import 'package:flutter/material.dart';
import 'package:image_detector/theme.dart';

class DetectionResultsCard extends StatelessWidget {
  final String resultText;
  final Color backgroundColor;
  final ThemeNotifier themeNotifier; // Assuming you have a ThemeNotifier class
  const DetectionResultsCard({
    super.key,
    required this.resultText,
    this.backgroundColor = Colors.deepPurple,
    required this.themeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detection Results',
          style: TextStyle(
            fontSize: 20,
            color:
                themeNotifier.isDarkMode ? Colors.indigoAccent : Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          constraints: const BoxConstraints(minHeight: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Align(
            alignment:
                resultText.isEmpty ? Alignment.center : Alignment.topLeft,
            child: SelectableText(
              resultText.isEmpty
                  ? 'Face detection results will appear here'
                  : resultText,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
