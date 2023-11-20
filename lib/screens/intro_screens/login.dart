// ignore_for_file: unnecessary_const, prefer_const_constructors,

/*import 'package:classchool/screens/announcement_msg.dart';
import 'package:classchool/screens/intro_screens/add_new_student.dart';
import 'package:classchool/screens/intro_screens/welcome.dart';
import 'package:classchool/screens/main/main_page.dart';
import 'package:classchool/screens/studentprofile.dart';*/
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'signup.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:townify/screens/intro_screens/welcome.dart';
//import 'forget_password.dart';
import '../../utils/submit_button.dart' show Submit_Button;
import '../../utils/textfield.dart' show CustomTextField, PasswordField;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  late String email;
  late String pass = '';
  var isLoading = false;
  String selectedOption = 'Teacher';
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void route() {
      User? user = FirebaseAuth.instance.currentUser;
      var kk = FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          if (documentSnapshot.get('rool') == "Student") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Welcome(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Welcome()),
            );
          }
        } else {
          print('Document does not exist on the database');
        }
      });
    }

    void signIn(String email, String password) async {
      if (_formKey.currentState!.validate()) {
        try {
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          route();
        } on FirebaseAuthException catch (e) {
          print(e.code);
          print('aaaa');
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Erreur',
                  desc: 'Invalid login details  ')
              .show();
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
        }
      }
    }

    return Material(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [Color(0xFF77BE73), Color(0xFF1C9BC8)],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              reverse: true,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Lottie.asset('assets/lottie/login.json', width: 180),
                    Text(
                      'Login Here!',
                      style: GoogleFonts.jost(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          height: 0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Email or phone number

                    CustomTextField(
                      labelText: 'Email or phone number',
                      hintText: 'Email or phone number',
                      prefixIcon: Icons.account_circle_outlined,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid input!';
                        }
                        email = value;
                        return null;
                      },
                    ),
                    // password
                    CustomTextField(
                      labelText: 'Enter Your Password',
                      hintText: 'Enter Your Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          pass = value;

                          return 'Enter a valid password!';
                        }
                        pass = value;
                        return null;
                      },
                    ),
                    TextButton(
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.jost(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Welcome(),
                          ),
                        );
                      },
                    ),
                    // Sign button
                    Submit_Button(
                      btntxt: 'SIGN IN',
                      fontSize: 22,
                      ontouch: () {
                        print('trying to sign in');
                        signIn(email, pass);
                        print('sign in successufl');
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 150,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'New User?',
                          style: GoogleFonts.jost(
                              fontSize: 18, color: Colors.white),
                        ),
                        TextButton(
                          child: Text(
                            'Register Here!',
                            style: GoogleFonts.jost(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Welcome(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
