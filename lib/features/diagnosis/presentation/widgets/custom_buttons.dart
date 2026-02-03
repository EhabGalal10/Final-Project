import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(w * 0.9, h * 0.05),
              backgroundColor: Color(0xff4F46E5),
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.download, color: Colors.white, size: 27),
                SizedBox(width: 12),
                Text(
                  AppStrings.downloadReport,
                  style: AppTextStyles.inter700style30.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //     minimumSize: Size(w * 0.7, h * 0.05),
          //     backgroundColor: AppColors.uploadcontainerColor,
          //     padding: EdgeInsets.symmetric(vertical: 20),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Icon(Icons.refresh, color: Colors.white, size: 27),
          //       SizedBox(width: 12),
          //       Text(
          //         AppStrings.newAnalysis,
          //         style: AppTextStyles.inter700style30.copyWith(
          //           fontSize: 18,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
