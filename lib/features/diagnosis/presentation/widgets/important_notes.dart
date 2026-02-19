import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomImportantNotes extends StatelessWidget {
  const CustomImportantNotes({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    double h = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: h * 0.31,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Text(
              AppStrings.importantNotice,
              style: AppTextStyles.inter700style20.copyWith(
                fontSize: 18,
                color: isDark ? theme.colorScheme.onSurface : null,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Divider(
            color: isDark
                ? theme.colorScheme.outlineVariant
                : const Color(0xffE5E7EB),
          ),

          const SizedBox(height: 6),

          Container(
            padding: const EdgeInsets.all(17),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isDark
                  ? AppColors.findDoctorContainerDarkColor
                  : theme.colorScheme.surfaceContainerHighest,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: theme.colorScheme.primary,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      AppStrings.importantNotice,
                      style: AppTextStyles.interMediumstyle16.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'This AI diagnosis is for screening purposes only. Please consult with a qualified radiologist or healthcare professional for final diagnosis and treatment recommendations.',
                  style: AppTextStyles.inter400style16.copyWith(
                    fontSize: 14,
                    color: isDark
                        ? theme.colorScheme.onSurface.withOpacity(0.7)
                        : null,
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
