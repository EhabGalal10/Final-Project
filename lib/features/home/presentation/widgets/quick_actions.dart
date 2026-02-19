import 'package:final_project/core/utils/app_images.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/home/presentation/widgets/custom_quick_action.dart';
import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    double h = MediaQuery.sizeOf(context).height;

    return Container(
      height: h * 0.23,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.quickActions,
            style: AppTextStyles.inter700style20.copyWith(
              fontSize: 18,
              color: isDark
                  ? theme.colorScheme.onSurface.withOpacity(0.7)
                  : null,
            ),
          ),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomQuickActions(
                title: AppStrings.viewHistory,
                image: Assets.assetsImagesHistory,
                onTap: () {
                  Navigator.pushNamed(context, '/historyView');
                },
              ),
              CustomQuickActions(
                title: AppStrings.findDoctor,
                image: Assets.assetsImagesFindDoctor,
                onTap: () {
                  Navigator.pushNamed(context, '/doctorsView');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
