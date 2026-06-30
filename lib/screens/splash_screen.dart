import 'package:flutter/material.dart';
import 'package:taskmanager/data/auth_controller.dart';
import 'package:taskmanager/screens/log_in_screen.dart';
import 'package:taskmanager/screens/main_nav_screen.dart';
import 'package:taskmanager/utils/assets_path.dart';
import 'package:taskmanager/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  Future<void> moveToNextScreen() async {
    Future.delayed(const Duration(seconds: 5));
    await AuthController.getUserData();
    bool isLogin = await AuthController.isUserLogIn();
    if (isLogin) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MainNavScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: Image.asset(
            AssetsPath.logoImg,
            width: 200,
          ),
        ),
      ),
    );
  }
}
