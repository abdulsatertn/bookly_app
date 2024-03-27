import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/constants_classes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p24,
        vertical: AppPadding.p40,
      ),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: AppSizes.s18,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: AppSizes.s20,
            ),
          ),
        ],
      ),
    );
  }
}
