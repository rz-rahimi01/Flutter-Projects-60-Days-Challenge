import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/screens/home_screen.dart';
import 'package:firebaseauth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isloading = false;
  void change() {
    setState(() {
      isloading = !isloading;
    });
  }

  Future register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text,
      password: pass.text,
    );
  }

  final _formKey = GlobalKey<FormState>();
  bool isobscure = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Register Screen",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),

        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/register.png'),
                    backgroundColor: Colors.white,
                    radius: 100,
                  ),
                  SizedBox(height: 50),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is empty"; // Default error message
                            } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}$',
                            ).hasMatch(value)) {
                              return "Invalid email format"; // Custom error message
                            }
                            return null; // No error
                          },
                          controller: email,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            label: Text(
                              "Email",
                              style: TextStyle(fontSize: 18),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.deepPurple.shade800,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        TextFormField(
                          controller: pass,
                          obscureText: isobscure,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is empty"; // Default error message
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters"; // Custom error message
                            }
                            return null; // No error
                          },

                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isobscure = !isobscure;
                                });
                              },
                              icon: Icon(
                                isobscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            label: Text(
                              "Password",
                              style: TextStyle(fontSize: 18),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.deepPurple.shade800,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 30), //  SizedBox(height: 50),
                        isloading
                            ? CircularProgressIndicator()
                            : InkWell(
                              onTap: () async {
                                // Trigger the form validation
                                if (_formKey.currentState!.validate()) {
                                  change();
                                  try {
                                    await register();
                                    if (!mounted) return;

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.lightGreen,
                                            content: Text(
                                              "Registered Successful",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            duration: Duration(
                                              seconds: 1,
                                            ), // or however long you want
                                          ),
                                        )
                                        .closed
                                        .then((_) {
                                          if (!mounted) return;
                                          change();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => HomeScreen(),
                                            ),
                                          );
                                        });
                                  } on FirebaseAuthException catch (e) {
                                    String errorMessage;

                                    switch (e.code) {
                                      case 'user-not-found':
                                        errorMessage =
                                            'No user found for that email.';
                                        break;
                                      case 'wrong-password':
                                        errorMessage = 'Incorrect password.';
                                        break;
                                      case 'invalid-email':
                                        errorMessage =
                                            'The email address is invalid.';
                                        break;
                                      case 'invalid-credential':
                                        errorMessage =
                                            'The credentials provided are incorrect or malformed.';
                                        break;
                                      case 'too-many-requests':
                                        errorMessage =
                                            'Too many login attempts. Please try again later.';
                                        break;
                                      case 'network-request-failed':
                                        errorMessage =
                                            'Network error, please check your internet connection.';
                                        break;
                                      default:
                                        errorMessage =
                                            'Login failed: ${e.message ?? 'Unknown error'}';
                                        break;
                                    }
                                    if (!mounted) return;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              errorMessage,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration: Duration(
                                              milliseconds: 1500,
                                            ),
                                          ),
                                        )
                                        .closed
                                        .then((_) {
                                          change();
                                        });
                                  }
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[400],
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),

                        SizedBox(height: 15),

                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
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
