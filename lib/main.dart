import 'package:flutter/material.dart';
import 'firebase_options.dart' as firefire;
import 'package:townify/firebase_options.dart';
import 'package:townify/screens/intro_screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const Townify());

  print('on');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('c bon');
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
