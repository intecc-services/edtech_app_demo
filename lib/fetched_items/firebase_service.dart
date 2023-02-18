import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<List<String>> getTitles() async {
    QuerySnapshot querySnapshot =
        await firestore.collection('assignments').get();
    List<String> titles = [];
    querySnapshot.docs.forEach((doc) {
      titles.add(doc['title']);
    });
    return titles;
  }

  Stream<List<String>> getTitlesStream() {
    return firestore.collection('assignments').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc['title'].toString()).toList();
    });
  }

  Future<String> getPdfURL(String title) async {
    return await storage.ref('files/$title.pdf').getDownloadURL();
  }
}
