import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService{
  final auth = FirebaseAuth.instance;

Future<bool> signInwithGoogle ()async{
  try{

    //create a google signin instance
    final googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize(
        clientId: "1024971998983-7bgcbanns3pdc29n156ljeaohsmafkeq.apps.googleusercontent.com",
        serverClientId: "242605070455-uf34c7fpfc4i24ahca29v8ludraip0d9.apps.googleusercontent.com"
    );
    final GoogleSignInAccount? account =
    await googleSignIn.authenticate(
        scopeHint:
        ['email', 'profile']
    );
    //check if the user the user cancelled the signin
    if (account == null){
      return false;
    }
    //get authentication tokens
    final GoogleSignInAuthentication googleauth = await account.authentication;

    final AuthCredential credentials = GoogleAuthProvider.credential(
        idToken: googleauth.idToken
    );
    // sign in to firebase using google credentials
    await auth.signInWithCredential(credentials);
    return true; //Sign in sucessful
  }
  catch(error){
    log(error.toString());
    return false;
  }
  }

 signOutwithGoogle ()async{
  try{
    await auth.signOut();

  }
  catch(error){
    log(error.toString());
    return false;
  }
}
}

