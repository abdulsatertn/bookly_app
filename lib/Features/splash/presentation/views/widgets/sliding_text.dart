import 'package:bookly_app/core/utils/constants_classes.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    // using the animatedbulder so i just rebuildt the text and there is no need to use set state and rebuild the whole screen

    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              AppStrings.splashText,
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
