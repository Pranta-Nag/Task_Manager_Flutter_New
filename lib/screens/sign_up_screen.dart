import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/screens/log_in_screen.dart';
import 'package:taskmanager/screens/main_nav_screen.dart';
import 'package:taskmanager/widgets/app_color.dart';
import 'package:taskmanager/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TapGestureRecognizer _signInRecognizer;

  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _firstNameTEController = TextEditingController();
  TextEditingController _lastNameTEController = TextEditingController();
  TextEditingController _phoneTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();


  @override
  void initState() {
    super.initState();

    _signInRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      };
  }

  @override
  void dispose() {
    _signInRecognizer.dispose();
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),

                Text(
                  'Join with US',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 25),

                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: _firstNameTEController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'First name',
                  ),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: _lastNameTEController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Last name',
                  ),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: _phoneTEController,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                  ),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: _passwordTEController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainNavScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 25,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                Center(
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Have account? ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: _signInRecognizer,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}