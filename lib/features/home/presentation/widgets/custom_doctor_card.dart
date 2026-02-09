import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/features/home/data/models/Doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CustomDoctorCard extends StatelessWidget {
  const CustomDoctorCard({super.key, required this.doctor});
  final DoctorsModel doctor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),

        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 98, 154, 207),
            Color(0xffc1e1fd),
            Color.fromARGB(255, 255, 255, 255),
          ],
          stops: [0, 0.8, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blue.shade100,
          child: const Icon(
            Icons.person,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
        title: Text(
          doctor.name!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(doctor.address!),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.phone, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(doctor.phone!),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.call, color: AppColors.primaryColor),
          onPressed: () async {
            await FlutterPhoneDirectCaller.callNumber(doctor.phone!);
          },
        ),
      ),
    );
  }
}
