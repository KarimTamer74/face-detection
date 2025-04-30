import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerViewModel extends ChangeNotifier {
  File? _image;
  String _result = '';
  String _mood = 'Unknown';
  bool _isLoading = false;
bool get isLoading => _isLoading;
  File? get image => _image;
  String get result => _result;

  String get mood => _mood;

  String _getMood(double? smilingProbability) {
    if (smilingProbability == null) return 'Unknown';
    if (smilingProbability > 0.8) return 'Very Happy 😄';
    if (smilingProbability > 0.6) return 'Happy 🙂';
    if (smilingProbability > 0.4) return 'Neutral 😐';
    if (smilingProbability > 0.2) return 'Slightly Unhappy 🙁';
    return 'Unhappy ☹️';
  }

  String _getEyeStatus(double? leftEye, double? rightEye) {
    if (leftEye == null || rightEye == null) return 'Unknown';

    bool leftEyeOpen = leftEye > 0.5;
    bool rightEyeOpen = rightEye > 0.5;

    if (leftEyeOpen && rightEyeOpen) return 'Both Eyes Open 👀';
    if (!leftEyeOpen && !rightEyeOpen) return 'Eyes Closed 😴';
    if (!leftEyeOpen) return 'Winking Right Eye 😉';
    return 'Winking Left Eye 😉';
  }

Future<void> pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: source);
  if (pickedFile != null) {
    _isLoading = true;
    notifyListeners();

    _image = File(pickedFile.path);

    await _analyzeFace(_image!);

    _isLoading = false;
    notifyListeners();
  }
}


  Future<void> _analyzeFace(File image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableLandmarks: true,
        enableClassification: true,
        enableTracking: true,
        minFaceSize: 0.15,
        performanceMode: FaceDetectorMode.accurate,
      ),
    );

    try {
      final List<Face> faces = await faceDetector.processImage(inputImage);
      if (faces.isEmpty) {
        _result = '😕 No faces detected in the image';
      } else {
        _result =
            '✨ Found ${faces.length} face${faces.length > 1 ? 's' : ''}\n\n';

        for (int index = 0; index < faces.length; index++) {
          Face face = faces[index];
          _result +=
              '👤 Face Analysis ${face.trackingId != null ? '' : ''} (Face ${index + 1})\n';
          _result += '───────────────────\n';

          // Mood Detection
          if (face.smilingProbability != null) {
            String mood = _getMood(face.smilingProbability);
            _mood = mood;
            notifyListeners();
            _result += '😊 Mood: $mood\n';
            _result +=
                '   • Smile Confidence: ${(face.smilingProbability! * 100).toStringAsFixed(1)}%\n';
          }

          // Eye Status
          String eyeStatus = _getEyeStatus(
              face.leftEyeOpenProbability, face.rightEyeOpenProbability);
          _result += '👁️ Eyes: $eyeStatus\n';

          if (face.leftEyeOpenProbability != null) {
            _result +=
                '   • Left Eye: ${(face.leftEyeOpenProbability! * 100).toStringAsFixed(1)}% open\n';
          }
          if (face.rightEyeOpenProbability != null) {
            _result +=
                '   • Right Eye: ${(face.rightEyeOpenProbability! * 100).toStringAsFixed(1)}% open\n';
          }

          // Head Rotation (if available)
          if (face.headEulerAngleY != null || face.headEulerAngleZ != null) {
            _result += '\n🔄 Head Position:\n';
            if (face.headEulerAngleY != null) {
              String direction = face.headEulerAngleY! > 0 ? 'right' : 'left';
              _result +=
                  '   • Turning ${direction.padRight(5)}: ${face.headEulerAngleY!.abs().toStringAsFixed(1)}°\n';
            }
            if (face.headEulerAngleZ != null) {
              String tilt = face.headEulerAngleZ! > 0 ? 'right' : 'left';
              _result +=
                  '   • Tilting ${tilt.padRight(5)}: ${face.headEulerAngleZ!.abs().toStringAsFixed(1)}°\n';
            }
          }

          _result += '\n';
        }
      }
    } catch (e) {
      print('Error processing image: $e');
      _result = 'Error occurred while processing the image.';
    } finally {
      await faceDetector.close();
      notifyListeners();
    }
  }

  Color getMoodColor(String mood) {
    switch (mood) {
      case 'Very Happy 😄':
        return Colors.green[200]!;
      case 'Happy 🙂':
        return Colors.lightGreen[300]!;
      case 'Neutral 😐':
        return Colors.grey[300]!;
      case 'Slightly Unhappy 🙁':
        return Colors.orange[200]!;
      case 'Unhappy ☹️':
        return Colors.red[200]!;
      default:
        return Colors.blueGrey[100]!;
    }
  }
}
