import 'package:flutter/material.dart';
import 'package:image_detector/view/widgets/detection_results_card.dart';
import 'package:image_detector/view/widgets/image_display_card.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import '../../view_model/image_picker_view_model.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ImagePickerViewModel>(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text(
          'Face Detector',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () => _showInfoDialog(context),
          ),
          IconButton(
            icon: themeNotifier.isDarkMode
                ? const Icon(Icons.wb_sunny, color: Colors.white)
                : const Icon(Icons.nightlight_round, color: Colors.white),
            onPressed: () {
              themeNotifier.isDarkMode = !themeNotifier.isDarkMode;
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageDisplayCard(
                    image: controller.image, controller: themeNotifier),
                const SizedBox(height: 20),
                DetectionResultsCard(
                  themeNotifier: themeNotifier,
                  resultText: controller.result,
                  backgroundColor: controller.getMoodColor(controller.mood),
                ),
                const SizedBox(height: 20),
                Text(
                  'Select Image',
                  style: TextStyle(
                    color: themeNotifier.isDarkMode
                        ? Colors.indigoAccent
                        : Colors.indigo,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _FloatingActionButton(
                      icon: Icons.photo,
                      onTap: () => controller.pickImage(ImageSource.gallery),
                    ),
                    _FloatingActionButton(
                      icon: Icons.camera_alt,
                      onTap: () => controller.pickImage(ImageSource.camera),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('About Face Detector'),
        content: const Text(
          'This app uses ML Kit for Face Detection to analyze faces in images. It can detect multiple faces and provide information about facial features.',
        ),
        actions: [
          TextButton(
            child: const Text(
              'OK',
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _FloatingActionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.indigoAccent.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}
