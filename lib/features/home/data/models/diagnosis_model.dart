import 'dart:io';

class DiagnosisModel {
  DiagnosisModel( {
   required this.imagename,
    required this.image,
    required this.diagnosis,
    required this.confidence,
  });
  final String diagnosis;
  final double confidence;
  final File image;
 final String imagename;
  factory DiagnosisModel.fromJson(Map<String, dynamic> json, File image) {
    return DiagnosisModel(
      imagename: image.path.split('/').last,
      image: image,
      diagnosis: json['class_name'],
      confidence: (json['confidence']),
    );
  }
}
