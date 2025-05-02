import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_detector/models/user_model.dart';
import 'package:image_detector/view/screens/home_screen.dart';
import 'package:image_detector/view_model/image_picker_view_model.dart';
import 'package:image_detector/view_model/theme.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);

  // Register adapters
  Hive.registerAdapter(UserModelAdapter());

  // Open boxes
  await Hive.openBox<UserModel>('usersBox');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ImagePickerViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Face Detector',
      theme: themeNotifier.themeData,
      home: const HomeScreen(),
    );
  }
}
