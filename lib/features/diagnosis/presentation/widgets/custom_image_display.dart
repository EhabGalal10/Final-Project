import 'dart:io';

import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomDisplayImage extends StatelessWidget {
  const CustomDisplayImage({super.key, this.image, this.name});
  final File? image;
  final String? name;

  @override
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(24),
      height: h * 0.48,

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
              AppStrings.uploadedMriScan,
              style: AppTextStyles.inter800style40shadow.copyWith(fontSize: 18),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              AppStrings.originalImageForAnalysis,
              style: AppTextStyles.interRegularstyle12.copyWith(fontSize: 14),
            ),
          ),
          SizedBox(height: 16),
          Divider(color: Color(0xffE5E7EB)),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: h * 0.3,
                width: w * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(image!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.all(14),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xff10B981),
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
                        color: Color(0xff6B7280),
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
                          color: Color(0xff6B7280),
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
