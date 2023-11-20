import 'package:townify/screens/intro_screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const Classchool());
}

class Classchool extends StatelessWidget {
  const Classchool({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Classchool',
      home: Welcome(),
    );
  }
}
