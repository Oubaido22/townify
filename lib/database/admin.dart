import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> verify(String businessname) async {
  String busId = '$businessname';
  final data = {"status": "verified"};

  await FirebaseFirestore.instance
      .collection("business")
      .doc(busId)
      .set(data, SetOptions(merge: true));
}

Future<void> reject(String businessname) async {
  String busId = '$businessname';
  final data = {"status": "rejected"};

  await FirebaseFirestore.instance
      .collection("business")
      .doc(busId)
      .set(data, SetOptions(merge: true));
}

Future<List<Map<String, dynamic>>> getallwaitingbusiness() async {
  return await FirebaseFirestore.instance
      .collection("business")
      .where("status", isEqualTo: "waiting")
      .get()
      .then(
    (querySnapshot) {
      List<Map<String, dynamic>> business = [];

      querySnapshot.docs.forEach((doc) {
        business.add(doc.data() as Map<String, dynamic>);
      });

      return business;
    },
    onError: (e) => print("Error completing: $e"),
  );
}

Future<void> updateForum(String name, String description) async {
  String busId = name;
  final data = {"description": description};

  await FirebaseFirestore.instance
      .collection("forum")
      .doc(busId)
      .set(data, SetOptions(merge: true));
}

Future<void> addforum(String name, String description) async {
  String busId = name;
  final data = {"description": description};

  FirebaseFirestore.instance.collection("forum").doc(busId).set(data);
}

Future<void> addcategory(String category) async {
  final data = {"category": category};

  FirebaseFirestore.instance.collection("category").doc().set(data);
}

Future<void> deletecategory(String category) async {
  FirebaseFirestore.instance
      .collection("category")
      .where("category", isEqualTo: category)
      .get()
      .then((snapshot) {
    for (DocumentSnapshot ds in snapshot.docs) {
      ds.reference.delete();
    }
  });
}
