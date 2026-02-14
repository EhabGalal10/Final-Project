import 'package:final_project/core/utils/app_colors.dart';
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
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: w * 0.35,
        height: h * 0.12,
        decoration: BoxDecoration(
          color: AppColors.findDoctorContainerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 10),
            SvgPicture.asset(image, height: 30, width: 30),
            Text(
              title,
              style: AppTextStyles.inter400style16.copyWith(
                color: Color(0xff374151),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
