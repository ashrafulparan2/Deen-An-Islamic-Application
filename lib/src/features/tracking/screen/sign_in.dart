import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../routes/routes.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _auth = FirebaseAuth.instance;
  bool _isSignIn = true; // Default to sign-in

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   primaryColor: Colors.white,
      // ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   primaryColor: Colors.black,
      // ),
      // themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              _isSignIn ? 'Sign In' : 'Sign Up',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary),
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          _isSignIn ? 'Sign In Page' : 'Sign Up Page',
                          style: TextStyle(
                              fontSize: 24, color: _getTextColor(context)),
                        ),
                        SizedBox(height: 20),
                        if (!_isSignIn)
                          TextFormField(
                            style: TextStyle(
                              color: Colors.cyan,
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  color: Colors.cyan,
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _emailTextController,
                          style: TextStyle(
                            color: Colors.cyan,
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.cyan,
                              )),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.cyan,
                          ),
                          controller: _passwordTextController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.cyan,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                        if (!_isSignIn) SizedBox(height: 10),
                        if (!_isSignIn)
                          TextFormField(
                            style: TextStyle(
                              color: Colors.cyan,
                            ),
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(
                                  color: Colors.cyan,
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              return null;
                            },
                          ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            if (_isSignIn) {
                              // Sign In logic
                              try {
                                await _auth.signInWithEmailAndPassword(
                                  email: _emailTextController.text.trim(),
                                  password: _passwordTextController.text.trim(),
                                );
                                Navigator.pushNamed(
                                    context, RouteGenerator.tracking);
                                print("Successfully login");
                              } catch (e) {
                                print(e);
                              }
                            } else {
                              // Sign Up logic
                              // Check if passwords match
                              if (_passwordTextController.text !=
                                  _confirmPasswordController.text) {
                                // Show an error message or handle password mismatch
                                return;
                              }

                              try {
                                await _auth.createUserWithEmailAndPassword(
                                  email: _emailTextController.text.trim(),
                                  password: _passwordTextController.text.trim(),
                                );
                                print("Successfully Created");
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 138, 81, 209)),
                          ),
                          child: Text(
                            _isSignIn ? 'Sign In' : 'Sign Up',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isSignIn = !_isSignIn;
                            });
                          },
                          child: Text(
                            _isSignIn
                                ? 'Don\'t have an account? Sign Up'
                                : 'Already have an account? Sign In',
                            style: TextStyle(color: _getTextColor(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to determine text color based on the current theme
  Color _getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.black // Set your preferred text color for light mode
        : Colors.white; // Set your preferred text color for dark mode
  }
}
