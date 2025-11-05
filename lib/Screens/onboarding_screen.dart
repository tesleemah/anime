import 'package:anime/Screens/SignInScreen.dart';
import 'package:anime/Screens/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction_Screen extends StatefulWidget {
  const Introduction_Screen({super.key});

  @override
  State<Introduction_Screen> createState() => _Introduction_ScreenState();
}

class _Introduction_ScreenState extends State<Introduction_Screen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: Color(0xFFEBEBEB),
          pages: [
            PageViewModel(
              useScrollView: false,
              titleWidget:
              Text('Welcome to Buzz',style:
                TextStyle(
                    fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'raleway',
                  color: Colors.blueGrey,
                  wordSpacing: 4,
                  letterSpacing: 2
                ),
              ),
            bodyWidget: Text('A description of how Buzz works',
            style:
            TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontFamily: 'raleway'
            ),
            ),
            image: Image.asset(
              'assets/introScreen/3.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,

            ),
            ),
            PageViewModel(
              useScrollView: false,
              title: 'Welcome to Buzz',
              body: 'A description of how Buzz work',
              image: Image.asset(
                'assets/introScreen/2.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,

              ),
            ),
            PageViewModel(
             useScrollView: false,
              titleWidget: Text('Now download and watch your anime offline',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                  color: Colors.black,
                  wordSpacing: 4,
                  letterSpacing: 2,
                fontFamily: 'raleway'

              ),),
              bodyWidget:  Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                            'Save your favourite anime',
                          style: TextStyle(
                            fontFamily: 'raleway',
                            fontSize: 17,
                            decorationColor: Colors.black,
                            wordSpacing: 2,
                            letterSpacing: 2
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 50,),


                ],
              ),
              image: Image.asset(
                'assets/introScreen/1.jpeg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,

              ),
            )
          ],
          showSkipButton: true,
          overrideSkip: (context, onSkip){
            return
              TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                  },

                child:  Text(
                'Skip',
                style: TextStyle(
                    color:
                    Colors.black
                ),
              ),
              );
          },
          showDoneButton: true,
          overrideDone: (context, onDone){
            return TextButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                child: Text(
                    'Get Started',
                  style: TextStyle(
                      color:
                      Colors.black
                  ),
                )
            );
          },

          showNextButton: false,
          onDone: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUp()));
          },
          isProgress: true ,
        ),
      )
    );
  }
}
