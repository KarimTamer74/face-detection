import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  Uint8List faceImageBytes;

  UserModel({
    required this.name,
    required this.faceImageBytes,
  });
}

// Note: To generate the adapter file, run:
// flutter pub run build_runner build
// 
// This will generate the user_model.g.dart file that contains the HiveAdapter
// for this model. The adapter is needed for Hive to serialize and deserialize
// the model.