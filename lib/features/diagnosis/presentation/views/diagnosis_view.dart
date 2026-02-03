import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/diagnosis/presentation/widgets/custom_image_display.dart';
import 'package:flutter/material.dart';

class DiagnosisView extends StatelessWidget {
  const DiagnosisView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> image =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Color(0xffF9FAFB),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.mriDiagnosis,
              style: AppTextStyles.inter900style30.copyWith(fontSize: 20),
            ),
            Text(
              AppStrings.aiPowered,
              style: AppTextStyles.interRegularstyle12,
            ),
          ],
        ),
      ),
      body: CustomDisplayImage(image: image['image'], name: image['name']),
    );
  }
}
