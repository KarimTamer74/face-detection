import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class FaceRecognitionService {
  static const double similarityThreshold = 0.90;
  static const int standardSize = 100; // استخدام حجم واحد للطول والعرض

  Future<double> compareFaces(Uint8List storedImageBytes, Uint8List newImageBytes) async {
    try {
      final storedImage = img.decodeImage(storedImageBytes);
      final newImage = img.decodeImage(newImageBytes);

      if (storedImage == null || newImage == null) return 0.0;

      final resizedStored = img.copyResize(storedImage, width: standardSize, height: standardSize);
      final resizedNew = img.copyResize(newImage, width: standardSize, height: standardSize);

      double totalDiff = 0;
      final pixelCount = standardSize * standardSize;

      for (int y = 0; y < standardSize; y++) {
        for (int x = 0; x < standardSize; x++) {
          final storedPixel = resizedStored.getPixel(x, y);
          final newPixel = resizedNew.getPixel(x, y);
          
          // استخراج القنوات اللونية مباشرة من كائن Pixel
          totalDiff += _calculatePixelDifference(
            storedPixel.r.toInt(), storedPixel.g.toInt(), storedPixel.b.toInt(),
            newPixel.r.toInt(), newPixel.g.toInt(), newPixel.b.toInt()
          );
        }
      }

      return 1.0 - (totalDiff / (pixelCount * 255));
    } catch (e) {
      debugPrint('Face comparison error: $e');
      return 0.0;
    }
  }

  static double _calculatePixelDifference(int r1, int g1, int b1, int r2, int g2, int b2) {
    return ((r1 - r2).abs() + (g1 - g2).abs() + (b1 - b2).abs()) / 3.0;
  }

  bool isMatch(double similarityScore) => similarityScore >= similarityThreshold;

  ImageProvider getImageProvider(Uint8List bytes) => MemoryImage(bytes);
}