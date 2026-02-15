import 'dart:io';
import 'package:final_project/core/functions/image_picker.dart';
import 'package:final_project/core/functions/show_toast.dart';
import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/home/data/models/diagnosis_model.dart';
import 'package:final_project/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:final_project/features/home/presentation/cubits/home_cubit/home_state.dart';
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
    return Scaffold(
      backgroundColor: Color(0xffF9FAFB),
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actionsPadding: EdgeInsets.symmetric(horizontal: 16),
        clipBehavior: Clip.none,
        title: Text(
          AppStrings.brainMriDiagnosis,
          style: AppTextStyles.inter700style20,
        ),
        centerTitle: true,
        actions: [SubLogoHome()],
      ),
      body: Builder(
        builder: (context) => BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is DiagnosisFailure) {
              Navigator.pop(context);
              showToast(
                context,
                message: "${state.message}",
                backgroundColor: Colors.red.shade500,
                shadowColor: Colors.red.shade200,
                icon: Icons.error,
              );
            } else if (state is DiagnosisSuccess) {
              showToast(
                context,
                message: "Completed Successfully 😊",
                backgroundColor: Colors.green.shade500,
                shadowColor: Colors.green.shade200,
              );
            }
          },
          builder: (context, state) {
            if (state is DiagnosisLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            }
            return ListView(
              children: [
                UploadImage(
                  ontap: () async {
                    String? imagePath = await pickImageFromGallery();
                    if (imagePath != null) {
                      File image = File(imagePath);
                      DiagnosisModel? diagnosisModel = await context
                          .read<HomeCubit>()
                          .getPrediction(image, context);
                      Navigator.pushNamed(
                        context,
                        '/diagnosisView',
                        arguments: {'diagnosis': diagnosisModel},
                      );
                    }
                  },
                  onlongpress: () async {
                    String? imagePath = await pickImageFromCamera();
                    if (imagePath != null) {
                      File image = File(imagePath);
                      DiagnosisModel? diagnosisModel = await context
                          .read<HomeCubit>()
                          .getPrediction(image, context);
                      Navigator.pushNamed(
                        context,
                        '/diagnosisView',
                        arguments: {'diagnosis': diagnosisModel},
                      );
                    }
                  },
                ),
                QuickActions(),
              ],
            );
          },
        ),
      ),
    );
  }
}
