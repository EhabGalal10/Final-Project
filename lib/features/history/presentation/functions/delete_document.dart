import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> removeFromHistory(Timestamp date) async {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('history')
      .where('date', isEqualTo: date)
      .limit(1)
      .get();

  if (snapshot.docs.isEmpty) return;

  final doc = snapshot.docs.first;
  final imageUrl = doc['image'];

  await deleteImageFromSupabase(imageUrl);

  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('history')
      .doc(doc.id)
      .delete();
}
 Future<void> deleteImageFromSupabase(String imageUrl) async {
  final supabase = Supabase.instance.client;

  final uri = Uri.parse(imageUrl);
  final filePath = uri.path.split('/public/').last;

  await supabase.storage
      .from('history_images')
      .remove([filePath.replaceFirst('history_images/', '')]);
}