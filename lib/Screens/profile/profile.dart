import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NetflixProfileScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: const Text('Profile'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.grey[600],
            ),
            SizedBox(height: 20),
            Text(
              user?.displayName ?? 'Username',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              user?.email ?? 'example@example.com',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await _auth.signOut();
                Navigator.of(context).pop();
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
