import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:townify/firebase_options.dart';
import 'package:flutter/material.dart';

Future<List<Map<String, dynamic>>> getallbusiness() async {
  return await FirebaseFirestore.instance
      .collection("business")
      .where("status", isEqualTo: "verified")
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

Future<void> addToFavorite(String name) async {
  String busId = name;
  final data = {"favorite": "true"};

  await FirebaseFirestore.instance
      .collection("business")
      .doc(busId)
      .set(data, SetOptions(merge: true));
}

Future<List<Map<String, dynamic>>> getallforum() async {
  return await FirebaseFirestore.instance.collection("forum").get().then(
    (querySnapshot) {
      List<Map<String, dynamic>> forum = [];

      querySnapshot.docs.forEach((doc) {
        forum.add(doc.data() as Map<String, dynamic>);
      });

      return forum;
    },
    onError: (e) => print("Error completing: $e"),
  );
}

Future<void> addcomment(String name, String comment) async {
  String busId = name;
  final data = {
    "comment": comment,
    "name": FirebaseAuth.instance.currentUser!.displayName
  };

  await FirebaseFirestore.instance
      .collection("forum")
      .doc(busId)
      .collection("comments")
      .doc()
      .set(data);
}

Future<List<Map<String, dynamic>>> getallcomments(String name) async {
  return await FirebaseFirestore.instance
      .collection("forum")
      .doc(name)
      .collection("comments")
      .get()
      .then(
    (querySnapshot) {
      List<Map<String, dynamic>> comments = [];

      querySnapshot.docs.forEach((doc) {
        comments.add(doc.data() as Map<String, dynamic>);
      });

      return comments;
    },
    onError: (e) => print("Error completing: $e"),
  );
}

Future<void> sendMessage(String docname, String content) async {
  Future<DocumentReference> getConversation(String docname) async {
    String conversationId = docname;

    DocumentReference conversationSnapshot = FirebaseFirestore.instance
        .collection('message_business_user')
        .doc(conversationId);

    return conversationSnapshot;
  }

  DocumentReference conversation = await getConversation(docname);

  final data = {
    "content": content,
    "sender": FirebaseAuth.instance.currentUser!.displayName,
    "date": DateTime.now().toUtc().toIso8601String(),
  };

  await conversation.collection("messages").doc().set(data);
}

Stream<List<Map<String, dynamic>>> getnewMessages(String docname) {
  return FirebaseFirestore.instance
      .collection('message_business_user')
      .doc(docname)
      .collection('messages')
      .orderBy('date', descending: true)
      .limit(1)
      .snapshots()
      .map((QuerySnapshot querySnapshot) {
    List<Map<String, dynamic>> messages = [];

    querySnapshot.docs.forEach((doc) {
      messages.add(doc.data() as Map<String, dynamic>);
    });

    return messages;
  });
}

Future<List<Map<String, dynamic>>> getallMessages(String docname) async {
  return await FirebaseFirestore.instance
      .collection("message_business_user")
      .doc(docname)
      .collection("messages")
      .get()
      .then(
    (querySnapshot) {
      List<Map<String, dynamic>> messages = [];

      querySnapshot.docs.forEach((doc) {
        messages.add(doc.data() as Map<String, dynamic>);
      });

      return messages;
    },
    onError: (e) => print("Error completing: $e"),
  );
}

Future<List<Map<String, dynamic>>> getconvs() {
  return FirebaseFirestore.instance
      .collection("message_business_user")
      .where("user", isEqualTo: FirebaseAuth.instance.currentUser!.displayName)
      .get()
      .then(
    (querySnapshot) {
      List<Map<String, dynamic>> messages = [];

      querySnapshot.docs.forEach((doc) {
        messages.add((doc.data() as Map<String, dynamic>));
        messages[messages.length - 1]["id"] = doc.id;
      });

      return messages;
    },
    onError: (e) => print("Error completing: $e"),
  );
}

Future<void> startnewconv(String busname) async {
  final data = {
    "user": FirebaseAuth.instance.currentUser!.displayName,
    "business": busname,
  };

  await FirebaseFirestore.instance
      .collection("message_business_user")
      .doc()
      .set(data);
}

bool convExist(String busname) {
  bool exist = false;
  FirebaseFirestore.instance
      .collection("message_business_user")
      .where("user", isEqualTo: FirebaseAuth.instance.currentUser!.displayName)
      .where("business", isEqualTo: busname)
      .get()
      .then(
    (querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        exist = true;
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
  return exist;
}