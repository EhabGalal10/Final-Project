import 'package:final_project/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTopDrawer extends StatelessWidget {
  const CustomTopDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return FutureBuilder(
      future: context.read<HomeCubit>().getUserName(),
      builder: (context, snapshot) {
        // ✅ Light gradient ثابت زي ما هو
        final Gradient lightGradient = const LinearGradient(
          colors: [
            Color.fromARGB(255, 87, 138, 227),
            Color(0xffc1e1fd),
            Color(0xffc8e4fe),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

        // 🌙 Dark gradient
        final Gradient darkGradient = LinearGradient(
          colors: [
            theme.colorScheme.primary.withOpacity(0.8),
            theme.colorScheme.surface,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

        final Gradient dynamicGradient = theme.brightness == Brightness.dark
            ? darkGradient
            : lightGradient;

        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return Container(
            height: h * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(gradient: dynamicGradient),
            child: Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(gradient: dynamicGradient),
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: const AssetImage(
                  'assets/images/doctor_avatar.png',
                ),
                backgroundColor: theme.colorScheme.surface,
              ),
              const SizedBox(height: 12),
              Text(
                snapshot.data!,
                style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
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
