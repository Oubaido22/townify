import 'package:townify/screens/intro_screens/welcome.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Townify());
}

class Townify extends StatelessWidget {
  const Townify({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'townify',
      home: Welcome(),
    );
  }
}
