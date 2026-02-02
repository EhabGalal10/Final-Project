import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/home/presentation/cubits/cubit/home_cubit.dart';
import 'package:final_project/features/home/presentation/widgets/drawer.dart';
import 'package:final_project/features/home/presentation/widgets/quick_actions.dart';
import 'package:final_project/features/home/presentation/widgets/sub_logo_home.dart';
import 'package:final_project/features/home/presentation/widgets/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: Color(0xffF9FAFB),
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actionsPadding: EdgeInsets.symmetric(horizontal: 16),
          clipBehavior: Clip.none,
          title: Text(
            'Brain MRI Diagnosis',
            style: AppTextStyles.inter900style30.copyWith(fontSize: 20),
          ),
          centerTitle: true,
          actions: [SubLogoHome()],
        ),
        body: ListView(children: [UploadImage(), QuickActions()]),
      ),
    );
  }
}
