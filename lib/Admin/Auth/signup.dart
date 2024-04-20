import 'package:briefnet/Admin/Auth/admin_cred.dart';
import 'package:briefnet/Admin/Auth/auth_services.dart';
import 'package:briefnet/home.dart';
import 'package:briefnet/viemo/viemo_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
 // Import your AuthService file

class SignUpScreen extends StatelessWidget {
 SignUpScreen({super.key,});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    void signUp() async {
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();
      final String displayName = displayNameController.text.trim();

      if (email.isNotEmpty && password.isNotEmpty && displayName.isNotEmpty) {
        final User? newUser = await authService.createAccount(email, password, displayName);
        if (newUser != null) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context)=>const Home()));
          // Account creation successful, navigate to the next screen or perform any other action
          // For example, Navigator.pushReplacementNamed(context, '/home');
        } else {
          // Account creation failed, handle error (display error message, etc.)
          // For example, ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account creation failed')));
        }
      } else {
        // Handle case where fields are empty
        // For example, ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create an Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: displayNameController,
              decoration: const InputDecoration(
                labelText: 'Display Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: signUp,
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                const SizedBox(width: 5),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>SignInScreen()));
                    // Navigate to the sign-in screen
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
