import 'dart:io';

import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomDisplayImage extends StatelessWidget {
  const CustomDisplayImage({super.key, this.image, this.name, this.imageUrl});

  final File? image;
  final String? name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(24),
      height: h * 0.48,
      decoration: BoxDecoration(
        color: isDark ? theme.colorScheme.surface : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
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
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              AppStrings.uploadedMriScan,
              style: AppTextStyles.inter700style20.copyWith(
                fontSize: 18,
                color: isDark ? theme.colorScheme.onSurface : null,
              ),
            ),
          ),

          SizedBox(height: 6),

          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              AppStrings.originalImageForAnalysis,
              style: AppTextStyles.interRegularstyle12.copyWith(
                fontSize: 14,
                color: isDark
                    ? theme.colorScheme.onSurface.withOpacity(0.6)
                    : null,
              ),
            ),
          ),

          SizedBox(height: 16),

          Divider(
            color: isDark
                ? theme.colorScheme.outlineVariant
                : const Color(0xffE5E7EB),
          ),

          SizedBox(height: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: h * 0.3,
                width: w * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageUrl == null
                        ? FileImage(image!)
                        : NetworkImage(imageUrl!) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.all(14),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xff10B981,
                      ), // سيبناه زي ما هو للـ Light
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      "Processed",
                      style: AppTextStyles.inter400style16.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Resolution: 512 x 512',
                      style: AppTextStyles.inter400style16.copyWith(
                        color: isDark
                            ? theme.colorScheme.onSurface.withOpacity(0.6)
                            : const Color(0xff6B7280),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.46,
                      child: Text(
                        'File : $name',
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.inter400style16.copyWith(
                          color: isDark
                              ? theme.colorScheme.onSurface.withOpacity(0.6)
                              : const Color(0xff6B7280),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
