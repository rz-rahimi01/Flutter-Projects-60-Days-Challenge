import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isobscure = true;
  bool emailError = false;
  bool passError = false;

  void logCheck() {
    setState(() {
      pass.text.isEmpty ? passError = true : passError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Login Screen",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),

        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/login.png'),
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
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          label: Text("Email", style: TextStyle(fontSize: 18)),
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

                      Visibility(
                        visible: emailError,
                        child: Text(
                          "Email is invalid",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      SizedBox(height: 50),

                      TextField(
                        controller: pass,
                        obscureText: isobscure,

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
                      Visibility(
                        visible: passError,
                        child: Text(
                          "Password Is Empty",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          logCheck();
                        },
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Text("Login"),
                      ),
                    ],
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
