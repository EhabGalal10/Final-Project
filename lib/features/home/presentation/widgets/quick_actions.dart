import 'package:final_project/core/utils/app_images.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/home/presentation/widgets/custom_quick_action.dart';
import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return Container(
      height: h * 0.21,
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.quickActions,
            style: AppTextStyles.inter900style30.copyWith(fontSize: 18),
          ),
          SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomQuickActions(
                title: AppStrings.viewHistory,
                image: Assets.assetsImagesHistory,
              ),
              CustomQuickActions(
                title: AppStrings.findDoctor,
                image: Assets.assetsImagesFindDoctor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

