import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/widgets/round_text_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // AnimationController _controller;
  //Animation _animation;

  @override
  void initState() {
//    _controller =
//        AnimationController(vsync: this, duration: Duration(seconds: 2));
//    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
//
//    _controller.forward();
//    _controller.addListener(() {
//      setState(() {});
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedTextButton(
              buttonColor: Colors.lightBlueAccent,
              text: 'Log In',
              onPress: () {
                onPress(LoginScreen.id);
              },
            ),
            RoundedTextButton(
              buttonColor: Colors.blueAccent,
              text: 'Register',
              onPress: () {
                onPress(RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }

  void onPress(String path) {
    Navigator.pushNamed(context, path);
  }
}
