import 'package:final_project/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:final_project/features/home/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(title: const Text('Home'), centerTitle: true),
        body: const Center(child: Text('Welcome to the Home Screen!')),
      ),
    );
  }
}
