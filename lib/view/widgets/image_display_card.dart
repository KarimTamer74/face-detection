import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_detector/view_model/theme.dart';
import 'package:image_detector/view_model/image_picker_view_model.dart';
import 'package:image_picker/image_picker.dart';

class ImageDisplayCard extends StatelessWidget {
  final File? image;
  final ThemeNotifier themeNotifier;
  final ImagePickerViewModel controller;

  const ImageDisplayCard({
    super.key,
    required this.image,
    required this.controller,
    required this.themeNotifier,
  });

  Future<void> _showImagePickerBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Open Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  controller.pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Select from Gallery'),
                onTap: () async {
                  // إغلاق الـ Bottom Sheet
                  Navigator.pop(context);
                  controller.pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // عندما يتم النقر، عرض Bottom Sheet لاختيار صورة من المعرض أو الكاميرا
        _showImagePickerBottomSheet(context);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: image == null
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 80),
                      SizedBox(height: 16),
                      Text(
                        'Click here to select an image',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              : Image.file(
                  image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
      ),
    );
  }
}
