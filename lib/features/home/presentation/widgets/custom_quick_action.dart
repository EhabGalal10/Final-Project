import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomQuickActions extends StatelessWidget {
  const CustomQuickActions({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  final String title;
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: w * 0.35,
        height: h * 0.12,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: theme.brightness == Brightness.dark
                  ? Colors.black26
                  : Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 30,
              width: 30,
              colorFilter: ColorFilter.mode(
                theme.colorScheme.primary,
                BlendMode.dst,
              ),
              // color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppTextStyles.inter400style16.copyWith(
                color: theme.colorScheme.onSurface,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
