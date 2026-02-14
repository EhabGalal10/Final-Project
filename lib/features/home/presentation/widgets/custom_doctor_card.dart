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
            Color(0xffE8F1FD), // أزرق فاتح جدًا
            Colors.white,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Color(0xffE0EDFF),
          child: const Icon(
            Icons.person,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
        title: Text(
          doctor.name!,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Color(0xff111827), // أسود ناعم
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  doctor.address!,
                  style: const TextStyle(color: Color(0xff6B7280)),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.call, color: Color(0xff2563EB), size: 16),
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
