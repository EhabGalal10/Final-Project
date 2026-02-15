import 'package:final_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No Internet Connection    ',
                style: AppTextStyles.inter700style20.copyWith(
                  fontSize: 18,
                  color: Color(0xffff6363),
                ),
                textAlign: TextAlign.center,
              ),
              Icon(Icons.wifi_off, color: Color(0xffff6363), size: 25),
            ],
          ),
          SizedBox(height: h * 0.1),
          SvgPicture.asset(
            'assets/images/noInternet.svg',
            height: h * 0.2,
            width: w * 0.2,
          ),
        ],
      ),
    );
  }
}
