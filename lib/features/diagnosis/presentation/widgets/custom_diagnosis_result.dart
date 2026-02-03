import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomDiagnosisResult extends StatelessWidget {
  const CustomDiagnosisResult({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24),
      height: h * 0.37,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              AppStrings.diagnosisResults,
              style: AppTextStyles.inter700style30.copyWith(fontSize: 18),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              AppStrings.aiModelPrediction,
              style: AppTextStyles.interRegularstyle12.copyWith(fontSize: 14),
            ),
          ),
          SizedBox(height: 16),
          Divider(color: Color(0xffE5E7EB)),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(17),
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: AppColors.findDoctorContainerColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Primary Diagnosis',
                      style: AppTextStyles.interMediumstyle16.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        "High Confidence",
                        style: AppTextStyles.interMediumstyle16.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'Normal Brain Tissue',
                  style: AppTextStyles.inter700style30.copyWith(fontSize: 20),
                ),
                SizedBox(height: 8),
                Text(
                  'No significant abnormalities detected in the brain tissue structure and morphology.',
                  style: AppTextStyles.inter400style16.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
