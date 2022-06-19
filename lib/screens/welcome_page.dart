import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


import './login_screen.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    );
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _bottomButton(),
          _welcomeImage(),
        ],
      ),
    );
  }

  Widget _bottomButton() {
    return Positioned.fill(
        child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          child: const Text(
            "Get Started",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
      ),
    ));
  }

  Widget _welcomeImage() {
    return Positioned.fill(
      bottom: 70,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assests/images/welcome_page.gif'),
              Text(
                'Explore Your Neighbourhood!',
                textAlign: TextAlign.center,
                style: GoogleFonts.varelaRound(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const 
              SizedBox(
                height: 20,
              ),
              Text(
                'Let\'s discover the best places \nto eat, drink, and shop nearest to you!',
                textAlign: TextAlign.center,
                style: GoogleFonts.varelaRound(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
