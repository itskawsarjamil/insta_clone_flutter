import 'dart:typed_data';
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone/resources/storage_method.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class AuthMethod {
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error Occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred);
        var imgLink = await StorageMethod()
            .uploadImageToStorage('profilePics', file, false);
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': imgLink,
        });

        // await _firestore.collection('users').add({
        //   'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'following': [],
        // });

        res = "success";
      } else {
        return res;
      }
    }
    //  on FirebaseAuthException catch (err) {
    //   if (err.code == 'invalid-email') {
    //     res = 'The email is badly formatted';
    //   } else if (err.code == 'weak-password') {
    //     res = 'your password need to be strong';
    //   }
    // } 
    catch (err) {
      res = err.toString();
    }
    return res;
  }
}
