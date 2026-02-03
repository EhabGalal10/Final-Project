import 'dart:io';
import 'package:final_project/core/functions/image_picker.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/home/presentation/cubits/cubit/home_cubit.dart';
import 'package:final_project/features/home/presentation/widgets/drawer.dart';
import 'package:final_project/features/home/presentation/widgets/quick_actions.dart';
import 'package:final_project/features/home/presentation/widgets/sub_logo_home.dart';
import 'package:final_project/features/home/presentation/widgets/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

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
            AppStrings.brainMriDiagnosis,
            style: AppTextStyles.inter700style30.copyWith(fontSize: 20),
          ),
          centerTitle: true,
          actions: [SubLogoHome()],
        ),
        body: ListView(
          children: [
            UploadImage(
              ontap: () async {
                String? imagePath = await pickImageFromGallery();
                if (imagePath != null) {
                  File image = File(imagePath);
                  String name = basename(imagePath);
                  Navigator.pushNamed(
                    context,
                    '/diagnosisView',
                    arguments: {'image': image, 'name': name},
                  );
                }
              },
              onlongpress: () async {
                String? imagePath = await pickImageFromCamera();
                if (imagePath != null) {
                  File image = File(imagePath);
                  String name = basename(image.path);
                  Navigator.pushNamed(
                    context,
                    '/diagnosisView',
                    arguments: {'image': image, 'name': name},
                  );
                }
              },
            ),
            QuickActions(),
          ],
        ),
      ),
    );
  }
}
