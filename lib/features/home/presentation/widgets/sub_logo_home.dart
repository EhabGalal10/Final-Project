import 'package:final_project/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SubLogoHome extends StatelessWidget {
  const SubLogoHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CircleAvatar(
      radius: 25,
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: Image.asset(Assets.assetsImagesLogo, height: 40, width: 50),
        ),
      ),
    );
  }
}
