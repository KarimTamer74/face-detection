import 'package:flutter/material.dart';
import 'package:image_detector/services/storage_service.dart';
import 'package:image_detector/view/screens/login_screen.dart';
import 'package:image_detector/view/screens/register_screen.dart';
import 'package:image_detector/view/widgets/app_button.dart';
import 'package:image_detector/view_model/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StorageService _storageService = StorageService();
  bool _userExists = false;

  @override
  void initState() {
    super.initState();
    _checkUserExists();
  }

  void _checkUserExists() {
    setState(() {
      _userExists = _storageService.hasUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Recognition Login',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Icon(
                Icons.face,
                size: 100,
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome to Face Recognition Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'A secure way to authenticate using facial recognition',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              if (_userExists) ...[
                AppButton(
                  label: 'Login with Face',
                  icon: Icons.login,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ).then((_) => _checkUserExists());
                  },
                ),
                const SizedBox(height: 20),
                AppButton(
                  color: Colors.red,
                  label: 'Delete User',
                  icon: Icons.delete,
                  onPressed: () async {
                    bool? confirm = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete User?'),
                        content: const Text(
                            'This will delete your registered face data. Are you sure?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('CANCEL'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('DELETE'),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true) {
                      await _storageService.deleteCurrentUser();
                      _checkUserExists();
                    }
                  },
                ),
              ] else ...[
                AppButton(
                  label: 'Register New User',
                  icon: Icons.person_add,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    ).then((_) => _checkUserExists());
                  },
                ),
              ],
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
