import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:final_project/features/home/data/models/diagnosis_model.dart';
import 'package:final_project/features/home/presentation/cubits/cubit/home_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide MultipartFile;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://sayed-ai-lab-mokhi.hf.space',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<String> getUserName() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();
    return doc['name'];
  }

  Future<DiagnosisModel?> getPrediction(File imageFile) async {
    try {
      emit(DiagnosisLoading());
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      });

      final response = await dio.post(
        '/predict',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      Map<String, dynamic> prediction = response.data;
      DiagnosisModel diagnosisModel = DiagnosisModel.fromJson(
        prediction,
        imageFile,
      );
      // if (diagnosisModel.confidence < 0.5) {
      //   emit(DiagnosisFailure(message: 'Select Another image'));
      //   return null;
      // }
      addToHistory(diagnosisModel);
      emit(DiagnosisSuccess());

      return diagnosisModel;
    } catch (e) {
      emit(DiagnosisFailure(message: e.toString()));
      throw Exception('Error predicting: $e');
    }
  }
Future<String> uploadImageToSupabase(File image) async {
  final supabase = Supabase.instance.client;

  final fileName =
      '${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}';

  await supabase.storage
      .from('history_images')
      .upload(fileName, image);

  final imageUrl = supabase.storage
      .from('history_images')
      .getPublicUrl(fileName);

  return imageUrl;
}
  void addToHistory(DiagnosisModel diagnosisModel) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final imageUrl =
      await uploadImageToSupabase(File(diagnosisModel.image.path));
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('history')
        .add({
          'diagnosis': diagnosisModel.diagnosis,
          'confidence': diagnosisModel.confidence,
          'image': imageUrl,
          'date': Timestamp.now(),
        });
  }
Future<List<Map<String, dynamic>>>  getHistory() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      emit(HistoryLoading());
    final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('history').orderBy('date', descending: true)
      .get();
      emit(HistorySuccess());
  return snapshot.docs.map((doc) => doc.data()).toList();
} on Exception catch (e) {
  emit(HistoryFailure(message: e.toString()));
  throw Exception('Error fetching history: $e');
}
  }
}
