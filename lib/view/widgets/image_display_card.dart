import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_detector/theme.dart';

class ImageDisplayCard extends StatelessWidget {
  final File? image;
  final ThemeNotifier controller;
  const ImageDisplayCard(
      {super.key, required this.image, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: image == null
            ? const Center(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.face_sharp, size: 80),
                    SizedBox(height: 16),
                    Text(
                      'No image selected',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            : Image.file(image!, fit: BoxFit.cover),
      ),
    );
  }
}
