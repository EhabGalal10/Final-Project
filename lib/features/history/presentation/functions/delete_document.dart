import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

removeFromHistory(Timestamp date) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final docId = await returnDocId(date);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('history')
        .doc(docId)
        .delete();
  }
 Future<String> returnDocId(Timestamp date)async{
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('history')
        .where('date', isEqualTo: date)
        .get();
    return snapshot.docs.first.id;
  }