import 'package:bookly_app/core/utils/app_sizes.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: AppSizes.s4),
        const Text(
          AppStrings.splashText,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
