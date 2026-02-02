import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/home/data/models/Doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctors",
          style: AppTextStyles.inter900style30.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: DoctorsModel.doctors.length,
        itemBuilder: (context, index) {
          final DoctorsModel doctor = DoctorsModel.doctors[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blue.shade100,
                child: const Icon(Icons.person, color: Colors.blue, size: 30),
              ),
              title: Text(
                doctor.name!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(doctor.address!),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(doctor.phone.toString()),
                    ],
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.call, color: AppColors.primaryColor),
                onPressed: () async {
                  // await launch('tel://${doctor.phone}');
                  await FlutterPhoneDirectCaller.callNumber(
                    doctor.phone.toString(),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
