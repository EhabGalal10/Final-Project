import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomImportantNotes extends StatelessWidget {
  const CustomImportantNotes({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24),
      height: h * 0.31,
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
              AppStrings.importantNotice,
              style: AppTextStyles.inter800style40.copyWith(fontSize: 18),
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
                    Icon(Icons.info, color: AppColors.primaryColor, size: 18),
                    SizedBox(width: 12),
                    Text(
                      AppStrings.importantNotice,
                      style: AppTextStyles.interMediumstyle16.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Text(
                  'This AI diagnosis is for screening purposes only. Please consult with a qualified radiologist or healthcare professional for final diagnosis and treatment recommendations.',
                  style: AppTextStyles.inter400style16.copyWith(
                    fontSize: 14,
                    color: Color(0xff1D4ED8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
