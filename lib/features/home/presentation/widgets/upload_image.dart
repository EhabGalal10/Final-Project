import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_images.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({
    super.key,
    required this.ontap,
    required this.onlongpress,
  });
  final VoidCallback? ontap;
  final VoidCallback? onlongpress;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.all(24),
      height: h * 0.55,

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
          Text(
            'Upload Image Screen',
            style: AppTextStyles.inter700style20.copyWith(fontSize: 18),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: ontap,
            onLongPress: onlongpress,
            child: Container(
              height: h * 0.43,
              width: w * 0.9,
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                children: [
                  SizedBox(height: h * 0.03),
                  CircleAvatar(
                    backgroundColor: AppColors.findDoctorContainerColor,
                    radius: 35,
                    child: SvgPicture.asset(
                      Assets.assetsImagesUploadImage,
                      height: 26,
                      width: 26,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: h * 0.04),
                  Text(
                    AppStrings.tapToUpload,
                    style: AppTextStyles.inter400style16.copyWith(
                      color: Color(0xff374151),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    AppStrings.imageSupport,
                    style: AppTextStyles.inter400style16.copyWith(
                      color: Color(0xff6B7280),
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'One tap',
                          style: TextStyle(color: Color(0xff6B7280)),
                        ),
                        Icon(Icons.arrow_right_alt, color: Color(0xff6B7280)),
                        Icon(Icons.folder_open, color: Color(0xff6B7280)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Long press',
                          style: TextStyle(color: Color(0xff6B7280)),
                        ),
                        Icon(Icons.arrow_right_alt, color: Color(0xff6B7280)),
                        Icon(Icons.camera_alt, color: Color(0xff6B7280)),
                      ],
                    ),
                  ),
                  SizedBox(height: h * 0.04),
                  ElevatedButton(
                    onPressed: ontap,
                    onLongPress: onlongpress,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      minimumSize: Size(w * 0.4, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: Text(
                      AppStrings.selectFile,
                      style: AppTextStyles.inter400style16.copyWith(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
