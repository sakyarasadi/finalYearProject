import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:flutter_firebase/global/common/toast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _allergiesController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  

  bool isSigningUp = false;

  @override
  void dispose() {
    _fullnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _allergiesController.dispose();
    _ageController.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Create Your\nAccount',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(
                      height: 10,
                    ), 
                      FormContainerWidget(
                      controller: _fullnameController,
                      hintText: "Full Name",
                      isPasswordField: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormContainerWidget(
                      controller: _usernameController,
                      hintText: "Username",
                      isPasswordField: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormContainerWidget(
                      controller: _emailController,
                      hintText: "Email",
                      isPasswordField: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormContainerWidget(
                      controller: _passwordController,
                      hintText: "Password",
                      isPasswordField: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormContainerWidget(
                      controller: _allergiesController,
                      hintText: "Allergies",
                      isPasswordField: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormContainerWidget(
                      controller: _ageController,
                      hintText: "Age",
                      isPasswordField: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(height: 70),
                    GestureDetector(
                      onTap: () {
                        _signUp();
                      },
                      child: Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffB81736),
                              Color(0xff281537),
                            ],
                          ),
                        ),
                        child: Center(
                          child: isSigningUp
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                                (route) => false,
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black,
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
        ],
      ),
    );
  }

  void _signUp() async {

setState(() {
  isSigningUp = true;
});

    
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String allergies = _allergiesController.text;
    String age = _ageController.text;
    String fullname = _fullnameController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

setState(() {
  isSigningUp = false;
});
    if (user != null) {
      showToast(message: "User is successfully created");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "Some error happend");
    }
  }
}
