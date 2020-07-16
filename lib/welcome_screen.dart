import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nice_button/nice_button.dart';
//import 'package:AppointMeetTest/login.dart';
//import 'test_screen.dart';
import 'auth_screen.dart';
import 'auth_screen_appointer.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      }
    });

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 180, bottom: 10, left: 10, right: 10),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Transform.rotate(
                    angle: animation.value * 6.3,
                    child: Image(
                      image: AssetImage('images/logopng.png'),
                      height: 100,
                    ),
                  ),
                ),
                Text(
                  "APPOINT",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                  height: 100.0,
                ),
                RotateAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  isRepeatingAnimation: true,

                  //totalRepeatCount: 3,
                  text: [
                    "MEET",
                    "ME",
                    "YOU",
                    "ALL",
                  ],
                  // alignment: Alignment(1.0, 0.5),
                  textStyle: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text(
                        "One place where you can ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
                    Row(children: <Widget>[
                      Text(
                        "Book your appointments",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ]),
                    Row(children: <Widget>[
                      Text(
                        "Manage your appointments",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ]),
                    Row(children: <Widget>[
                      Text(
                        "Get your appointments booked",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ]),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 140.0, left: 20, right: 20, bottom: 10),
            child: Row(
              children: <Widget>[
                NiceButton(
                  radius: 40,
                  elevation: 10,
                  padding: const EdgeInsets.all(15),
                  icon: Icons.account_circle,
                  text: "Appointee",
                  gradientColors: [Colors.deepPurple, Colors.white],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AuthScreen()),
                    );
                  },
                  background: Colors.white,
                )
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 50.0, left: 20, right: 20, bottom: 10),
            child: Row(
              children: <Widget>[
                NiceButton(
                  radius: 40,
                  elevation: 10,
                  padding: const EdgeInsets.all(15),
                  text: "Appointer",
                  icon: Icons.create,
                  gradientColors: [Colors.deepPurple, Colors.white],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthScreenAppointer(),
                      ),
                    );
                  },
                  background: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
