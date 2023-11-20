// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:townify/screens/intro_screens/login.dart';
import '../../utils/submit_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [Color(0xFF77BE73), Color(0xFF1C9BC8)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                children: <Widget>[
                  // page1
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/lottie/student.json', width: 250),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Student Activities',
                          style: GoogleFonts.jost(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Monitor the complete activity of your child like attendance, marks and etc...',
                          style: GoogleFonts.jost(
                              fontSize: 18, height: 1.5, color: Colors.white),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),

                  // page 2
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/lottie/map.json', height: 250),
                        Text(
                          textAlign: TextAlign.center,
                          'Chat with the administration',
                          style: GoogleFonts.jost(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'chat with the administration ',
                          style: GoogleFonts.jost(
                              fontSize: 18, height: 1.5, color: Colors.white),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),

                  // page 3
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/ptc.png',
                          height: 250,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Connect With Teachers',
                          style: GoogleFonts.jost(
                              height: 1.2,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Chat or talk with your child\'s teachers and know more about your child.',
                          style: GoogleFonts.jost(
                              fontSize: 18, height: 1.5, color: Colors.white),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment(0, 0.65),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                      spacing: 15.0,
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      dotColor: Colors.white54,
                      activeDotColor: Colors.white),
                ),
              ),

              // Get started button
              Submit_Button(
                btntxt: 'GET STARTED',
                fontSize: 20,
                ontouch: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
