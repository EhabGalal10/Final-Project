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
    final theme = Theme.of(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24),
      height: h * 0.55,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upload Image Screen',
            style: AppTextStyles.inter700style20.copyWith(
              fontSize: 18,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: ontap,
            onLongPress: onlongpress,
            child: Container(
              height: h * 0.43,
              width: w * 0.9,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                children: [
                  SizedBox(height: h * 0.03),
                  CircleAvatar(
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                    radius: 35,
                    child: SvgPicture.asset(
                      Assets.assetsImagesUploadImage,
                      height: 26,
                      width: 26,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: h * 0.04),
                  Text(
                    AppStrings.tapToUpload,
                    style: AppTextStyles.inter400style16.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.imageSupport,
                    style: AppTextStyles.inter400style16.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'One tap',
                        style: TextStyle(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                      Icon(
                        Icons.folder_open,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Long press',
                        style: TextStyle(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                      Icon(
                        Icons.camera_alt,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.04),
                  ElevatedButton(
                    onPressed: ontap,
                    onLongPress: onlongpress,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      minimumSize: Size(w * 0.4, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      AppStrings.selectFile,
                      style: AppTextStyles.inter400style16.copyWith(
                        fontSize: 17,
                        color: theme.colorScheme.onPrimary,
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
