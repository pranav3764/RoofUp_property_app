import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_dealer_app/Common/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showLoader = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _isSigning = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    print("Email: " + emailController.text.trim());
    print("Password: " + passwordController.text.trim());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      print("User Signed In Successfully: " +
          userCredential.user!.uid.toString());

      if (userCredential.user!.uid.isNotEmpty) {
        Navigator.pushReplacementNamed(context, "/home");
      }
    } on FirebaseAuthException catch (e) {
      print("Something Went Wrong: " + e.message.toString());
      print("Error Code: " + e.code.toString());
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: screenWidth > 650
                    ? EdgeInsets.symmetric(horizontal: screenWidth * 0.3)
                    : EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.circular(30.0),
                      //   border: Border.all(
                      //     color: Colors.blue, // Set border color to blue
                      //   ),
                      // ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.blue, // Cursor color
                        decoration: InputDecoration(
                          hintText: "Email", // Hint text
                          hintStyle: TextStyle(
                              color: Colors.grey
                                  .withOpacity(0.75)), // Opacity for hint text
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.circular(30.0),
                      //   border: Border.all(
                      //     color: Colors.blue, // Set border color to blue
                      //   ),
                      // ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.blue, // Cursor color
                        decoration: InputDecoration(
                          hintText: "Password", // Hint text
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.75)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              icon: Icon(_isPasswordVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons
                                      .visibility_outlined)), // Opacity for hint text
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.blue),
                        ),
                        obscureText: _isPasswordVisible,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(1.0),
                      width: MediaQuery.of(context).size.width *
                          0.9, // Adjust width with MediaQuery
                      height: MediaQuery.of(context).size.height * 0.06,
                      // Set a fixed height or adjust with MediaQuery
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.lightBlue,
                            Colors.blue,
                            Colors.lightBlue,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),

                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.08, // Adjust width fraction as needed
                        height: MediaQuery.of(context).size.width * 0.08,
                        child: ElevatedButton(
                          onPressed: () {
                            _signIn();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.transparent, // Set transparent color
                            elevation: 0, // Remove shadow
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: _isSigning
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  strokeWidth:
                                      2, // Adjust strokeWidth as needed
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New User ? ",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "Register Here",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "/register");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signIn() async {
    try {
      setState(() {
        _isSigning = true;
      });

      String email = emailController.text;
      String password = passwordController.text;

      UserCredential? user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      setState(() {
        _isSigning = false;
      });

      showToast(message: "User is signed in successfully");
      Navigator.pushNamed(context, "/home");
    } catch (e) {
      print('Some error Occurred...');
      return;
    }
  }
}

class FirebaseAuthService {}
