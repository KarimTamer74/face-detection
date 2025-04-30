import 'package:flutter/material.dart';
import 'package:image_detector/theme.dart';
import 'package:image_detector/view_model/image_picker_view_model.dart';
import 'package:provider/provider.dart';

import 'view/screens/image_picker_screen.dart';

void main() async {
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
      home: const ImagePickerScreen(),
    );
  }
}
