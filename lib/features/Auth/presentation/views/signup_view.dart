import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:final_project/core/widgets/no_intenet_view.dart';
import 'package:final_project/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:final_project/features/Auth/presentation/widgets/form_signup.dart';
import 'package:final_project/features/Auth/presentation/widgets/sub_logo_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
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
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffc8e4fe),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                  Color(0xffc1e1fd),
                ],
                stops: [0.1, 0.22, 0.75, 1.0],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: h * 0.06),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(255, 5, 2, 172),
                          Color.fromARGB(255, 85, 165, 241),
                        ],
                        stops: [0, 0.7],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: SubLogoSignUp(),
                  ),

                  ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 5, 2, 172),
                          Color.fromARGB(255, 85, 165, 241),
                        ],
                        stops: [0, 0.9],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: Text(
                      AppStrings.createAccount,
                      style: AppTextStyles.inter700style30shadow,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    AppStrings.joinMokhi,
                    style: AppTextStyles.inter400style16,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  FormSignUp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//  Scaffold(
//       body: OfflineBuilder(
//         connectivityBuilder:
//             (
//               BuildContext context,
//               List<ConnectivityResult> connectivity,
//               Widget child,
//             ) {
//               final bool connected = !connectivity.contains(
//                 ConnectivityResult.none,
//               );

//               return connected
//                   ? child
//                   : const Center(child: NoInternetView());
//             },
//         child: SplashBody(controller: _controller),
//       ),
//     );
