import 'dart:developer' as logg;
import 'package:anime/Screens/SignInScreen.dart';
import 'package:anime/service/authservice.dart';
import 'package:anime/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscuretext = true;
  final _Auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFFEBEBEB),

        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.arrow_back_ios),
        ),
        body:
        SingleChildScrollView(
          child: Form(
            key: _formkey,
              child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only( top: 30, left: 30, right:  30, bottom: 30),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'raleway',
                          color: Color(0xFF424242)
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only( left: 40, right:  20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Full name',
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
                  controller: _namecontroller,
                  validator: (value){
                    if (value != null && value.characters.length>= 4){
                      return null;
                    }
                    return "Please enter your fullname";
                  },
                  decoration: const InputDecoration(
                      prefixIcon:  Icon(Icons.email_outlined),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
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
                padding: const EdgeInsets.only(top: 10, left: 40, right:  20),
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
                  validator: (value) {
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value!)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      prefixIcon:  Icon(Icons.email_outlined),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
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
                padding: const EdgeInsets.only(left: 40, right:  20),
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
                  controller: _passwordcontroller,
                    obscureText: _obscuretext,
                  validator: (value){
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
              Padding(
                padding: const EdgeInsets.only(left: 40, right:  20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Confirm Password',
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
                  controller: _confirmpasswordcontroller,
                  obscureText: _obscuretext,

                  validator: (value){
                    if (value == _passwordcontroller.text){
                      return null;
                    }
                    return "Password does not match";
                  },
                  decoration: InputDecoration(

                      prefixIcon: Transform.rotate(angle:0.6,
                          child: const Icon(Icons.key_outlined, color: Color(0xFF424242), )
                      ),
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _obscuretext= !_obscuretext;
                          });
                        },
                        icon: Icon(
                            _obscuretext? Icons.visibility_outlined: Icons.visibility_off_outlined
                        )),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: SizedBox(height: 50 ,width: 370,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Color(0xFF1F3B4D)),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: SizedBox(height: 40 ,width: 320,
                            child: ElevatedButton(
                              onPressed: _signUp,
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(Color(0xFF1F3B4D)),
                                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              child: Text('Sign Up',
                                  style: TextStyle(color: Colors.white, fontSize: 15)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: (){},
                    child:  RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: "have an account? ",
                              style: TextStyle(
                                color: Color(0xFF424242),
                              )
                          ),
                          TextSpan(text: " Sign In",
                              recognizer: TapGestureRecognizer()..onTap=(){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()
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
                    TextButton(onPressed: (){}, child: Text('Log-in with Google'))
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
                  ]
    )
          ),
        ),
    )
    );
  }

  _signUp() async{
    final user = await _Auth.createUserWithEmailAndPassword
      (_emailcontroller.text, _passwordcontroller.text);
    if (user != null){
      logg.log("User created succesfully");
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()) );

  }
}
