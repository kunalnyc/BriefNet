import 'dart:io';

import 'package:briefnet/Admin/Auth/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController adminController = TextEditingController();
  SignInScreen({super.key});

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
            'BriefNet Adminstration',
            style: TextStyle(color: CupertinoColors.systemYellow),
          ),
        ),
        body: SingleChildScrollView(
          //    physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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
                  controller: adminController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: 'Admin',
                      suffixText: 'STAFF ONLY',
                      suffixStyle: TextStyle(color: Colors.yellow)),
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
                  onPressed: () {
                    String displayName = adminController.text;
                    String email = emailController.text;
                    String password = passwordController.text;

                    // Call your authentication logic here
                    AuthService().signInWithEmailAndPassword(
                        email, password, displayName);
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
