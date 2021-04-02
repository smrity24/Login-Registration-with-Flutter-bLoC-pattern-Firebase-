import 'package:driver_application/ui/sign_in_screen.dart';
import 'package:driver_application/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/love.png'),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0XFFff5c8a),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignInScreen()));
                      },
                      child: Text('Sign In'),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFFff7b00),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpScreen()));
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Join Now by Sign In Or Sign Out',
                style: TextStyle(fontSize: 17, color: Colors.amber),
              ),
              SizedBox(height: 25),
              Image.asset('assets/images/unnamed.png')
            ],
          ),
        ),
      ),
    );
  }
}
