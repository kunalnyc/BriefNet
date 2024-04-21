import 'dart:io';

import 'package:briefnet/Admin/Auth/auth_services.dart';
import 'package:briefnet/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Import your AuthService file

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Check if the platform is web
    if (Platform.isAndroid) {
      return Scaffold(
        backgroundColor: CupertinoColors.black,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: CupertinoColors.black,
          title: const Text(
            'BriefNet Administration',
            style: TextStyle(color: CupertinoColors.systemYellow),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to the Cutting-Edge Control Management System for BriefNet, Empowering Administrators with Seamless Control and Oversight',
                  style: TextStyle(color: CupertinoColors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                CupertinoButton.filled(
                  borderRadius: BorderRadius.circular(30),
                  onPressed: () async {
                    // Create an instance of AuthService
                    final AuthService authService = AuthService();
                    // Call the signInWithEmailAndPassword method using the instance
                    final user = await authService.signInWithEmailAndPassword(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      // Optionally pass display name if needed
                      '',
                    );
                    // Handle user sign-in result here
                    if (user != null) {
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(CupertinoPageRoute(
                          builder: (context) => const Home()));
                      // User signed in successfully, navigate to next screen or perform other actions
                    } else {
                      // Handle sign-in failure
                    }
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: CupertinoColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      // Return an empty container if not on web
      return Container();
    }
  }
}
