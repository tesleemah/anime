import 'dart:async';
import 'dart:developer';

import 'package:anime/Screens/SignupScreen.dart';
import 'package:anime/Screens/landing_screen.dart';
import 'package:anime/Screens/home_screen.dart';
import 'package:anime/service/authservice.dart';
import 'package:anime/service/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;


  final _auth = AuthService();
  bool _obscuretext = true;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googleSignIn.attemptLightweightAuthentication();
  }
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFFEBEBEB),

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body:
        SingleChildScrollView(
          child: Form(

            key: _formkey,
            child:
            Column(
              children: [

                const SizedBox(height: 90,),
                Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10, left: 30, right:  30),
                    child: Align(alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: (){
                          _login();
                        },
                        child: Text('Log In',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'raleway',
                                color: Color(0xFF424242))
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only( top:20,left: 40, right:  20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Email',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF424242),
                          ),
                        )
                    ),
                  ),

                Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 30, right:  20),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _emailcontroller,
                      validator: (value){
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (emailRegex.hasMatch(value!)) {
                          return null;
                        }
                        return "Enter a valid email";
                      },
                      decoration: const InputDecoration(
                          prefixIcon:  Icon(Icons.email_outlined),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Color(0xFF424242),
                                  width: 2.5
                              )
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Color(0xFF424242),
                                  width: 2.5
                              )
                          ),
                        errorBorder: UnderlineInputBorder(
                            borderSide:  BorderSide(
                                color: Color(0xFF424242),
                                width: 2.5
                            )
                      ),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide:  BorderSide(
                                color: Color(0xFF424242),
                                width: 2.5
                            )
                    ),
                  ),
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only( top: 20,left: 40, right:  20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Password',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF424242),
                  ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only( bottom: 30, left: 30, right:  20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: _obscuretext,
                    controller: _passwordcontroller,
                    validator:  (value){
                      if (value != null && value.characters.length >= 6){
                        return null;
                      }
                      return "Must be at least 6 characters";
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _obscuretext= !_obscuretext;
                            });
                          },
                          icon: Icon(
                            _obscuretext? Icons.visibility_outlined: Icons.visibility_off_outlined
                          )),
                        prefixIcon: Transform.rotate(angle:0.6,
                            child: const Icon(Icons.key_outlined, color: Color(0xFF424242), )
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                            borderSide:  BorderSide(
                                color: Color(0xFF424242),
                                width: 2.5
                            )
                        ),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:  BorderSide(
                                color: Color(0xFF424242),
                                width: 2.5
                            )
                        ),
                      errorBorder: UnderlineInputBorder(
                          borderSide:  BorderSide(
                              color: Color(0xFF424242),
                              width: 2.5
                          )
                    ),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide:  BorderSide(
                              color: Color(0xFF424242),
                              width: 2.5
                          )
                  ),
                ),
                ),
                ),
                SizedBox(height: 40 ,width: 320,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Color(0xFF1F3B4D)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      ),
                      child: Text('Log In',
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ),
                    ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                        onPressed: (){},
                        child: Text('Forgot Password',
                            style:
                        TextStyle(
                          color: Color(0xFF424242),
                        ),
                        ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20),
                    child: Row(
                      children: [
                        Expanded(child:
                        Divider(
                          thickness: 1.8,
                          color: Color(0xFF424242),
                        )
                        ),
                        SizedBox(width: 15,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('OR', style: TextStyle(fontSize: 15),)),
                        ),
                        SizedBox(width: 15,),
                        Expanded(child:
                        Divider(
                          thickness: 1.8,
                          color: Color(0xFF424242),
                        )
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width:300,
                  height:80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.network(
                        height: 40,
                          width: 40,
                          'https://pngimg.com/uploads/google/google_PNG19635.png',
                          fit:BoxFit.cover
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      TextButton(onPressed:
                          () async {
                        bool result = await GoogleService().signInwithGoogle();
                        if (result){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context)=>
                                  const MainScreen()
                              )
                          );
                        }
                          else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("Google signin failed",
                                      style: TextStyle(
                                          color: Color(0xFF1F3B4D),
                                          fontWeight: FontWeight.bold)
                                  )
                              )
                          );
                        }
                        },
                          child: Text('Log-in with Google'))
                    ],
                  ),
                ),
                SizedBox(
                  width:300,
                  height:80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.network(
                          height: 40,
                          width: 40,
                          'https://www.designboom.com/wp-content/uploads/2023/09/facebook-new-logo-change-designboom-02.jpg',
                          fit:BoxFit.cover
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      TextButton(onPressed: (){}, child: Text('Log-in with facebook'))
                    ],
                  ),
                ),
                TextButton(
                    onPressed: (){

                    },
                    child:  RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: "Don't have an account? ",
                              style: TextStyle(
                                color: Color(0xFF424242),
                              )
                          ),
                          TextSpan(text: " Register",
                              recognizer:
                              TapGestureRecognizer()..onTap=(){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder:
                                            (context) => SignUp()
                                    )
                                );
                              },
                              style: TextStyle(
                                  color: Color(0xFF1F3B4D),
                                  fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }

  _login()async{
    final user = await _auth.loginWithEmailAndPassword
      (_emailcontroller.text, _passwordcontroller.text);
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
    content: Text("Login Succesfull",
    style: TextStyle(
    color: Color(0xFF1F3B4D),
    fontWeight: FontWeight.bold)
    )
      )
      );
    }
      log("User logged in successfully");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MainScreen()) );
    }
    }

