import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_images.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/features/home/presentation/cubits/cubit/home_cubit.dart';
import 'package:final_project/features/home/presentation/cubits/cubit/home_state.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is HistoryLoading) {
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
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }
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
                style: AppTextStyles.inter700style20.copyWith(fontSize: 18),
              ),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomQuickActions(
                    title: AppStrings.viewHistory,
                    image: Assets.assetsImagesHistory,
                    onTap: () async{
                    List<Map<String, dynamic>> listHistory =  await context.read<HomeCubit>().getHistory();
                      history = listHistory;
                      Navigator.pushNamed(context, '/historyView', arguments: history);
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
