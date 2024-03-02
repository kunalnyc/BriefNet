import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      // Attempt to sign in with email and password
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If successful, update user profile with display name
      await result.user!.updateDisplayName(displayName);

      // Create admin document in Firestore (assuming this is the intended behavior)
      await _createAdminDocument(result.user!.uid, displayName, email);

      return result.user;
    } on FirebaseAuthException catch (error) {
      // Handle specific auth errors gracefully, e.g.:
      switch (error.code) {
        case 'user-not-found':
          print('User not found. Please check the email address.');
          break;
        case 'wrong-password':
          print('Incorrect password. Please try again.');
          break;
        default:
          print('An error occurred: ${error.message}');
      }
      return null;
    } catch (error) {
      print('An unknown error occurred: $error');
      return null;
    }
  }

  Future<void> _createAdminDocument(
    String uid,
    String displayName,
    String email,
  ) async {
    // ignore: unnecessary_null_comparison
    if (uid != null) {
      try {
        await _firestore.collection('admins').doc(uid).set({
          'displayName': displayName,
          'email': email,
          // Add other fields as needed
        });
      } catch (error) {
        print('Error creating admin document: $error');
      }
    }
  }

  // Other methods...
}
