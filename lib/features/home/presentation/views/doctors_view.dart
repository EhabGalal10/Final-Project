import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/home/data/models/Doctors_model.dart';
import 'package:final_project/features/home/presentation/widgets/custom_doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctors",
          style: AppTextStyles.inter800style40shadow.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        itemCount: DoctorsModel.doctors.length,
        itemBuilder: (context, index) {
          final DoctorsModel doctor = DoctorsModel.doctors[index];
          return CustomDoctorCard(doctor: doctor);
        },
      ),
    );
  }
}
