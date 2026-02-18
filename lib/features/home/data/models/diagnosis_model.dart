import 'dart:io';

class DiagnosisModel {
  DiagnosisModel({
    required this.imagename,
    this.image,
    required this.diagnosis,
    required this.confidence,
    this.imageurl,
  });
  final String diagnosis;
  final double confidence;
  final File? image;
  final String? imageurl;
  final String imagename;
  factory DiagnosisModel.fromJson(Map<String, dynamic> json, File image) {
    return DiagnosisModel(
      imagename: image.path.split('/').last,
      image: image,
      diagnosis: json['class_name'],
      confidence: (json['confidence']),
    );
  }
  factory DiagnosisModel.fromMap(Map<String, dynamic> map) {
    return DiagnosisModel(
      imagename: Uri.parse(map['image']).path.split('/history_images/').last,
      imageurl: map['image'],
      diagnosis: map['diagnosis'],
      confidence: map['confidence'],
    );
  }
}
