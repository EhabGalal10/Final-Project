import 'package:final_project/core/functions/show_toast.dart';
import 'package:final_project/core/utils/app_colors.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/core/widgets/no_intenet_view.dart';
import 'package:final_project/features/history/presentation/cubits/history_cubit/history_cubit.dart';
import 'package:final_project/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:final_project/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:final_project/features/home/presentation/widgets/custom_home_body.dart';
import 'package:final_project/features/home/presentation/widgets/drawer.dart';
import 'package:final_project/features/home/presentation/widgets/sub_logo_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder:
          (
            BuildContext context,
            List<ConnectivityResult> connectivity,
            Widget child,
          ) {
            final bool connected = !connectivity.contains(
              ConnectivityResult.none,
            );

            return connected ? child : const Center(child: NoInternetView());
          },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actionsPadding: EdgeInsets.symmetric(horizontal: 16),
          clipBehavior: Clip.none,
          title: Text(
            AppStrings.brainMriDiagnosis,
            style: AppTextStyles.inter700style20,
          ),
          centerTitle: true,
          actions: [SubLogoHome()],
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is DiagnosisFailure) {
              showToast(
                context,
                message: state.message,
                backgroundColor: Colors.red.shade500,
                shadowColor: Colors.red.shade200,
                icon: Icons.error,
              );
            } else if (state is DiagnosisSuccess) {
              context.read<HistoryCubit>().addToHistory(state.diagnosisModel);
              Navigator.pushNamed(
                context,
                '/diagnosisView',
                arguments: {'diagnosis': state.diagnosisModel},
              );
              showToast(
                context,
                message: "Completed Successfully 😊",
                backgroundColor: Colors.green.shade500,
                shadowColor: Colors.green.shade200,
              );
            }
          },
          builder: (context, state) {
            if (state is DiagnosisLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
        
            return CustomHomeBody();
          },
        ),
      ),
    );
  }
}