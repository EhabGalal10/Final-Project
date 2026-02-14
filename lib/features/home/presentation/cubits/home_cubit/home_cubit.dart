import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:final_project/features/home/data/models/diagnosis_model.dart';
import 'package:final_project/features/history/presentation/cubits/history_cubit/history_cubit.dart';
import 'package:final_project/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Future<DiagnosisModel?> getPrediction(File imageFile, BuildContext context) async {
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
      context.read<HistoryCubit>().addToHistory(diagnosisModel);
      emit(DiagnosisSuccess());

      return diagnosisModel;
    }on DioException catch (e) {

    // ✅ Handle Timeout specifically
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {

      emit(DiagnosisFailure(
        message: 'Error timeout connecting to server',
      ));
    } else {
      emit(DiagnosisFailure(
        message: 'Error connecting to server',
      ));
    }

    return null;

  } 
    catch (e) {
      emit(DiagnosisFailure(message: e.toString()));
      throw Exception('Error predicting: $e');
    }
  }

}
