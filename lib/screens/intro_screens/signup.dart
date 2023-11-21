import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:townify/screens/intro_screens/login.dart';
import '../../utils/submit_button.dart';
import '../../utils/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Signup extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  var isLoading = false;
  final _auth = FirebaseAuth.instance;
  String selectedOption = 'User';
  late String email;
  late String pass;
  late String phone;
  var options = [
    'User',
    'Basiness',
  ];
  var currentItemSelected = "User";
  var rool = "User";
  void _submit() async {
    /*print(email);
    print(pass);
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
    } on Exception catch (e) {
      print(e);
    }*/
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [Color(0XFFBD94FA), Color(0XFF7455F7)],
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
                      'Signup Here!',
                      style: GoogleFonts.jost(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        height: 0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedOption,
                      items: ['User', 'Business'].map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(
                            option,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        selectedOption = newValue!;
                        currentItemSelected = newValue;
                        rool = newValue;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Select an option';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Select your role',
                        hintText: 'Select your role',
                        prefixIcon: Icon(Icons.add_card),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.white), // Change border color here
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.white), // Change border color here
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    CustomTextField(
                      labelText: 'Enter your email',
                      hintText: 'Enter your name',
                      prefixIcon: Icons.school_outlined,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid  name';
                        }
                        email = value;
                        return null;
                      },
                    ),
                    CustomTextField(
                      labelText: 'enter your password',
                      hintText: 'password',
                      prefixIcon: Icons.lock,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid password number';
                        }
                        pass = value;
                        return null;
                      },
                    ),
                    CustomTextField(
                      labelText: 'Phone number',
                      hintText: '+216 00000 00000',
                      prefixIcon: Icons.phone_outlined,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(?:[1-9])?[0-9]{8}$').hasMatch(value)) {
                          return 'Invalid Phone number!';
                        }

                        phone = value;
                        return null;
                      },
                    ),
                    Submit_Button(
                      btntxt: 'sign up ',
                      fontSize: 20,
                      ontouch: () {
                        _submit();
                        signUp(email, pass, rool, phone: phone);
                        AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.rightSlide,
                                title: 'You Are Registred',
                                desc: ' You have sussccefly registred ')
                            .show();
                        Future.delayed(Duration(seconds: 10), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 150,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Have an account?',
                          style: GoogleFonts.jost(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            'Login Here!',
                            style: GoogleFonts.jost(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
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

  /* void signUp(String email, String password, String role,
      {String? phone}) async {
    CircularProgressIndicator();
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        postDetailsToFirestore(email, role, phone: phone);
      }).catchError((e) {});
    }
  }*/

  postDetailsToFirestore(String email, String rool, {String? phone}) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({'email': email, 'rool': rool, 'phone': phone});
  }

  void signUp(String email, String password, String role,
      {String? phone}) async {
    if (_formKey.currentState!.validate()) {
      try {
        // Check if the email is already in use
        bool emailInUse = await isEmailInUse(email);

        if (!emailInUse) {
          // If email is not in use, create a new user
          await FirebaseAuth.instance
            ..createUserWithEmailAndPassword(email: email, password: password)
                .then((value) {
              postDetailsToFirestore(email, role, phone: phone);
            }).catchError((e) {
              // Handle any errors during user creation, if needed
            });
        } else {
          // Email is already in use, handle this case as appropriate (show an error message, etc.)
          print('Email is already in use.');
        }
      } catch (e) {
        // Handle any errors, such as network issues, if needed
        print('Error: $e');
      }
    }
  }

  Future<bool> isEmailInUse(String email) async {
    try {
      final userCredential = await FirebaseAuth.instance
        ..signInWithEmailAndPassword(email: email, password: 'dummyPassword');
      // If the email is already in use, this will throw an error.
      // If it's not in use, it will be caught as an error and return false.
      return false;
    } catch (e) {
      // If the email is in use, FirebaseAuth will throw an error, and we catch it here.
      return true;
    }
  }
}
