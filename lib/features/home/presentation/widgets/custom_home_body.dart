import 'dart:io';

import 'package:final_project/core/functions/image_picker.dart';
import 'package:final_project/features/home/data/models/diagnosis_model.dart';
import 'package:final_project/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:final_project/features/home/presentation/widgets/quick_actions.dart';
import 'package:final_project/features/home/presentation/widgets/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomeBody extends StatelessWidget {
  const CustomHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
