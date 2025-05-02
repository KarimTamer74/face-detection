import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_detector/models/user_model.dart';
import 'package:image_detector/services/face_recognition_service.dart';
import 'package:image_detector/services/storage_service.dart';
import 'package:image_detector/view/screens/image_picker_screen.dart';
import 'package:image_detector/view/widgets/app_button.dart';
import 'package:image_detector/view/widgets/user_image.dart';
import 'package:image_detector/view_model/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final StorageService _storageService = StorageService();
  final FaceRecognitionService _faceRecognitionService =
      FaceRecognitionService();
  final ImagePicker _imagePicker = ImagePicker();

  UserModel? _currentUser;
  Uint8List? _loginImageBytes;
  bool _isVerifying = false;
  bool _loginSuccess = false;
  String? _errorMessage;
  double? _similarityScore;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    _currentUser = _storageService.getCurrentUser();
    if (_currentUser == null) {
      setState(() {
        _errorMessage = 'No registered user found. Please register first.';
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
      );

      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _loginImageBytes = bytes;
          _errorMessage = null;
          _loginSuccess = false;
          _similarityScore = null;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error accessing camera: ${e.toString()}';
      });
    }
  }

  Future<void> _verifyFace() async {
    if (_currentUser == null) {
      setState(() {
        _errorMessage = 'No registered user found. Please register first.';
      });
      return;
    }

    if (_loginImageBytes == null) {
      setState(() {
        _errorMessage = 'Please select a face image to verify';
      });
      return;
    }

    // Start verification
    setState(() {
      _isVerifying = true;
      _errorMessage = null;
      _loginSuccess = false;
    });

    try {
      // Compare faces
      final double similarity = await _faceRecognitionService.compareFaces(
        _currentUser!.faceImageBytes,
        _loginImageBytes!,
      );

      final bool isMatch = _faceRecognitionService.isMatch(similarity);

      setState(() {
        _isVerifying = false;
        _loginSuccess = isMatch;
        _similarityScore = similarity;

        if (!isMatch) {
          _errorMessage = 'Face verification failed. Please try again.';
        }
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Verification error: ${e.toString()}';
        _isVerifying = false;
        _loginSuccess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with Face',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        actions: [
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Take or select a photo of your face to login',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Face image selection
            UserImage(
              imageBytes: _loginImageBytes,
              onTap: _showImageSourceDialog,
            ),
            const SizedBox(height: 20),

            // Image selection buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  label: 'Camera',
                  icon: Icons.camera_alt,
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                const SizedBox(width: 20),
                AppButton(
                  label: 'Gallery',
                  icon: Icons.photo_library,
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Verify button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isVerifying || _loginImageBytes == null
                    ? null
                    : _verifyFace,
                child: _isVerifying
                    ? const CircularProgressIndicator()
                    : const Text('Verify Face',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
              ),
            ),

            const SizedBox(height: 20),

            // Error message
            if (_errorMessage != null && !_loginSuccess)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),

            // Success message
            if (_loginSuccess && _currentUser != null)
              Column(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome, ${_currentUser!.name}!',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  if (_similarityScore != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Similarity: ${(_similarityScore! * 100).toStringAsFixed(2)}%',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton(
                      label: "Continue",
                      color: Colors.teal,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ImagePickerScreen()));
                      })
                ],
              ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
