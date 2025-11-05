import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final auth = FirebaseAuth.instance;
  Future<User?> createUserWithEmailAndPassword
      (String email, String password) async
  {
    try {
      final cred = await auth.createUserWithEmailAndPassword
        (email: email, password: password);
      return cred.user;
    }
    catch(e) {
      log('Something went wrong');
    }
    return null;
  }


  Future<User?> loginWithEmailAndPassword
      (String email, String password) async
  {
    try {
      final cred = await auth.signInWithEmailAndPassword
        (email: email, password: password);
      return cred.user;
    }
    catch(e) {
      log('Something went wrong');
    }
    return null;
  }


  Future<void> signout ()async
  {
    try
    {
      await auth.signOut();
    }
    catch(e){
      log("Something went wrong");
    }
    
  }
  



}

