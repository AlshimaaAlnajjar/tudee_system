import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final users = FirebaseFirestore.instance.collection('users');
  static final tasks = FirebaseFirestore.instance.collection('tasks');


  static Future saveName(String name) async {
    await users.doc('me').set({'name': name});
  }

  static Future<String?> getName() async {
    final doc = await users.doc('me').get();
    if (!doc.exists) return null;
    return doc['name'];
  }



  static Future addTask(String title) async {
    await tasks.add({
      'title': title,
      'done': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  static Future editTitle(String id, String title) async {
    await tasks.doc(id).update({'title': title});
  }

  static Future toggleDone(String id, bool done) async {
    await tasks.doc(id).update({'done': !done});
  }

  static Future deleteTask(String id) async {
    await tasks.doc(id).delete();
  }
}