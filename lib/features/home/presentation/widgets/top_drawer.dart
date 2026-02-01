import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTopDrawer extends StatelessWidget {
  const CustomTopDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: context.read<HomeCubit>().getUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: h * 0.2,
            width: double.infinity,
            color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Container(
            height: h * 0.2,
            width: double.infinity,
            color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff6A11CB), Color(0xff2575FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 12),
              Text(
                snapshot.data!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
