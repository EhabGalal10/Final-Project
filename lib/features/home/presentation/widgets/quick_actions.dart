import 'package:final_project/core/functions/show_toast.dart';
import 'package:final_project/core/utils/app_images.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:final_project/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:final_project/features/home/presentation/widgets/custom_quick_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickActions extends StatefulWidget {
  const QuickActions({super.key});

  @override
  State<QuickActions> createState() => _QuickActionsState();
}

class _QuickActionsState extends State<QuickActions> {
  List<Map<String, dynamic>> history = [];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is DiagnosisFailure) {
          showToast(
                context,
                message: state.message,
                backgroundColor: Colors.red.shade500,
                shadowColor: Colors.red.shade200,
                icon: Icons.error,
              );
        }
      },
      builder: (context, state) {
        return Container(
          height: h * 0.23,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
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
                style: AppTextStyles.inter700style20.copyWith(fontSize: 18),
              ),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomQuickActions(
                    title: AppStrings.viewHistory,
                    image: Assets.assetsImagesHistory,
                    onTap: () async {
                      Navigator.pushNamed(context, '/historyView');
                    },
                  ),
                  CustomQuickActions(
                    title: AppStrings.findDoctor,
                    image: Assets.assetsImagesFindDoctor,
                    onTap: () => Navigator.pushNamed(context, '/doctorsView'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
