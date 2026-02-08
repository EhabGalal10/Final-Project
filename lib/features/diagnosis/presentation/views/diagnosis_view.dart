import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/diagnosis/presentation/widgets/custom_buttons.dart';
import 'package:final_project/features/diagnosis/presentation/widgets/custom_diagnosis_result.dart';
import 'package:final_project/features/diagnosis/presentation/widgets/custom_image_display.dart';
import 'package:final_project/features/diagnosis/presentation/widgets/important_notes.dart';
import 'package:final_project/features/home/data/models/diagnosis_model.dart';
import 'package:flutter/material.dart';

class DiagnosisView extends StatelessWidget {
  const DiagnosisView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> modelResult =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    DiagnosisModel result = modelResult['diagnosis'];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: AppColors.findDoctorContainerColor,
        child: Icon(Icons.refresh, size: 30, color: AppColors.primaryColor),
      ),
      backgroundColor: Color(0xffF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.mriDiagnosis,
              style: AppTextStyles.inter700style20.copyWith(fontSize: 20),
            ),
            Text(
              AppStrings.aiPowered,
              style: AppTextStyles.interRegularstyle12,
            ),
          ],
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CustomDisplayImage(image: result.image, name: result.imagename),
          CustomDiagnosisResult(result: result),
          SizedBox(height: 24),
          CustomImportantNotes(),
          SizedBox(height: 24),
          CustomButtons(),
        ],
      ),
    );
  }
}
