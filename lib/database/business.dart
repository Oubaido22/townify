import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> registerbussiness(String description, String category) async {
  String busId = FirebaseAuth.instance.currentUser!.displayName.toString();
  final data = {
    "name": busId,
    "description": description,
    "email": FirebaseAuth.instance.currentUser!.email,
    "category": category,
    "status": "waiting",
  };

  await FirebaseFirestore.instance.collection("business").doc(busId).set(data);
  print('done');
}

Future<void> addEvent(String title, String content) async {
  final data = {
    "title": title,
    "content": content,
  };
  await FirebaseFirestore.instance
      .collection("business")
      .doc(FirebaseAuth.instance.currentUser!.displayName)
      .collection("events")
      .doc()
      .set(data);
}

Future<void> addProduct(String title, String content, String prices) async {
  final data = {
    "title": title,
    "content": content,
    "prices": prices,
  };
  await FirebaseFirestore.instance
      .collection("business")
      .doc(FirebaseAuth.instance.currentUser!.displayName)
      .collection("products")
      .doc(title)
      .set(data);
}

Future<List<Map<String, dynamic>>> getProducts() async {
  return await FirebaseFirestore.instance
      .collection("business")
      .doc(FirebaseAuth.instance.currentUser!.displayName)
      .collection("products")
      .get()
      .then(
    (querySnapshot) {
      List<Map<String, dynamic>> products = [];

      querySnapshot.docs.forEach((doc) {
        products.add(doc.data() as Map<String, dynamic>);
      });

      return products;
    },
    onError: (e) => print("Error completing: $e"),
  );
}

Future<void> deleteProduct(String title) async {
  await FirebaseFirestore.instance
      .collection("business")
      .doc(FirebaseAuth.instance.currentUser!.displayName)
      .collection("products")
      .doc(title)
      .delete();
}

Future<void> updateProduct(String title, String content, String prices) async {
  final data = {
    "title": title,
    "content": content,
    "prices": prices,
  };
  await FirebaseFirestore.instance
      .collection("business")
      .doc(FirebaseAuth.instance.currentUser!.displayName)
      .collection("products")
      .doc(title)
      .set(data);
}

Future<List<Map<String, dynamic>>> getallconvs() async {
  return await FirebaseFirestore.instance
      .collection("message_business_user")
      .where("business",
          isEqualTo: FirebaseAuth.instance.currentUser!.displayName)
      .get()
      .then((querySnapshot) {
    List<Map<String, dynamic>> convs = [];
    querySnapshot.docs.forEach((doc) {
      convs.add(doc.data() as Map<String, dynamic>);
      convs[convs.length - 1]["id"] = doc.id;
    });
    return convs;
  });
}

Future<List<Map<String, dynamic>>> getallmessages(String docname) async {
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

Future<List<Map<String, dynamic>>> getallcategory() async {
  return await FirebaseFirestore.instance.collection("category").get().then(
    (querySnapshot) {
      List<Map<String, dynamic>> category = [];

      querySnapshot.docs.forEach((doc) {
        category.add(doc.data() as Map<String, dynamic>);
      });

      return category;
    },
    onError: (e) => print("Error completing: $e"),
  );
}
