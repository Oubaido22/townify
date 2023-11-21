// ignore_for_file: unnecessary_const, prefer_const_constructors,  camel_case_types, must_be_immutable

//import 'package:classchool/screens/intro_screens/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:townify/screens/intro_screens/login.dart';
import '../../utils/submit_button.dart';
import '../../utils/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class forgetPassword extends StatelessWidget {
  forgetPassword({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  late String email1;

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
                    Lottie.asset('assets/lottie/forgot_password.json',
                        width: 350),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Forgot password? Don\'t worry, just a common human error here you can change new one.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.jost(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      labelText: 'Enter Your Email',
                      hintText: 'enter your email',
                      prefixIcon: Icons.mail,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid input!';
                        }
                        email1 = value;

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Submit_Button(
                      btntxt: 'SUBMIT',
                      fontSize: 20,
                      ontouch: () async {
                        try {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email1);
                          print('success');
                          AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.success,
                                  animType: AnimType.rightSlide,
                                  title: 'Mail Sent',
                                  desc:
                                      'if you have an account with this email , then you should recieve an email in 5 secondes with a password reconfiguration link ')
                              .show();
                          Future.delayed(Duration(seconds: 10), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          });
                        } on FirebaseAuthException catch (e) {
                          print(e.code);
                          AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Erreur',
                                  desc: 'cet user is not registred  ')
                              .show();
                          Future.delayed(Duration(seconds: 5), () {
                            Navigator.of(context).pop();
                          });
                        }
                        _submit();
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
                    Text(
                      'Check your inbox to get your code.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jost(
                        fontSize: 18,
                        color: Colors.white,
                      ),
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
