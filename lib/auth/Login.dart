import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool secure = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  String email = '';
  String pass = '';
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return FadeIn(
      duration: Duration(milliseconds: 500),
      child: Scaffold(
        backgroundColor: Color(0xFF2B3467),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: screenwidth * 0.07,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('welcome');
                      },
                    ),
                  ),
                ),
                SizedBox(height: screenheight * 0.1),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenwidth * 0.04,
                      vertical: screenheight * 0.01,
                    ),
                    width: screenwidth * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 61, 60, 60),
                          blurRadius: 15,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontSize: screenwidth * 0.08,
                              color: Color(0xFF2B3467),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Sign in to ShopCraft',
                            style: TextStyle(
                              fontSize: screenwidth * 0.04,
                              color: Color.fromARGB(255, 54, 54, 54),
                            ),
                          ),
                          SizedBox(height: screenheight * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: screenwidth * 0.04,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: screenheight * 0.02),
                              SizedBox(
                                height: screenheight * 0.07,
                                child: TextFormField(
                                  controller: emailCont,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Email is required';
                                    }
                                    if (!val.contains('@') ||
                                        !val.contains('.com')) {
                                      return 'Email Must Contain @ and .com';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter your email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenheight * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: screenwidth * 0.04,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: screenheight * 0.02),
                              SizedBox(
                                height: screenheight * 0.07,
                                child: TextFormField(
                                  controller: passCont,
                                  obscureText: secure,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Paswword is required';
                                    }
                                    if (val.length < 8) {
                                      return 'Password must be > 8 chars';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffix: InkWell(
                                      onTap: () {
                                        setState(() {
                                          secure = !secure;
                                        });
                                      },
                                      child: Icon(
                                        secure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color.fromARGB(
                                          255,
                                          97,
                                          94,
                                          94,
                                        ),
                                        size: screenwidth * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenheight * 0.03),
                          MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                email = emailCont.text;
                                pass = passCont.text;
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Welcome !',
                                        style: TextStyle(
                                          fontSize: 25, //////////
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                            255,
                                            2,
                                            158,
                                            15,
                                          ),
                                        ),
                                      ),
                                      content: Text(
                                        'Account sign-in successfully',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(
                                              context,
                                            ).pushNamed('shophome');
                                          },
                                          child: Text(
                                            'Close',
                                            style: TextStyle(
                                              fontSize: 15, //////////
                                              color: Color.fromARGB(
                                                255,
                                                2,
                                                158,
                                                15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Container(
                              height: screenheight * 0.05,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFF2B3467),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: screenwidth * 0.045,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
