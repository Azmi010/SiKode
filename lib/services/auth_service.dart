import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password, String nama, String role) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if (user != null) {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .set({'email': email, 'nama': nama, 'role': role});
      }

      return user;
    } catch (e) {
      return null;
    }
  }

  Future<String?> getUserRole(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(uid).get();
      return userDoc['role'];
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserProfile() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
        return doc.data() as Map<String, dynamic>?;
      }
    } catch (e) {
      Error();
    }
    return null;
  }

  Future<void> updateUserProfile(String name, String email, [String? imageUrl]) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        Map<String, dynamic> data = {
          'nama': name,
          'email': email,
        };
        if (imageUrl != null) {
          data['imageUrl'] = imageUrl;
        }
        await _firestore.collection('users').doc(user.uid).update(data);
        await user.verifyBeforeUpdateEmail(email);
      }
    } catch (e) {
      Error();
    }
  }

  Future<String> uploadImage(File image) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        Reference ref = _storage.ref().child('user_profiles').child(user.uid);
        UploadTask uploadTask = ref.putFile(image);
        TaskSnapshot snapshot = await uploadTask;
        return await snapshot.ref.getDownloadURL();
      }
    } catch (e) {
      Error();
    }
    return '';
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      Error();
    }
  }
}
