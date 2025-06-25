import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF2B3467),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: FadeIn(
              duration: Duration(milliseconds: 500),
              child: Column(
                children: [
                  SizedBox(height: screenheight * 0.1),
                  Text(
                    'Shop Craft',
                    style: TextStyle(
                      fontSize: screenwidth * 0.12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your Premium Shopping Experience',
                    style: TextStyle(
                      fontSize: screenwidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenheight * 0.05),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/image/cart3.png',
                      height: screenheight * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: screenheight * 0.05),
                  Column(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('login');
                        },
                        child: Container(
                          height: screenheight * 0.06,
                          width: screenwidth * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: screenwidth * 0.05,
                                color: Color(0xFF2B3467),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenheight * 0.02),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('signup');
                        },
                        child: Container(
                          height: screenheight * 0.06,
                          width: screenwidth * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: screenwidth * 0.05,
                                color: Color(0xFF2B3467),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
