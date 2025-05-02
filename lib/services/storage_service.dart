import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'package:image_detector/models/user_model.dart';

class StorageService {
  static const String userBoxName = 'usersBox';
  static const String currentUserKey = 'currentUser';

  // Save the user to local storage
  Future<void> saveUser(String name, Uint8List faceImageBytes) async {
    final box = Hive.box<UserModel>(userBoxName);
    
    // Create a new user
    final user = UserModel(
      name: name,
      faceImageBytes: faceImageBytes,
    );
    
    // Save the user with a specific key
    await box.put(currentUserKey, user);
  }

  // Get the current user
  UserModel? getCurrentUser() {
    final box = Hive.box<UserModel>(userBoxName);
    return box.get(currentUserKey);
  }

  // Check if a user exists
  bool hasUser() {
    final box = Hive.box<UserModel>(userBoxName);
    return box.containsKey(currentUserKey);
  }

  // Delete the current user
  Future<void> deleteCurrentUser() async {
    final box = Hive.box<UserModel>(userBoxName);
    await box.delete(currentUserKey);
  }
}
