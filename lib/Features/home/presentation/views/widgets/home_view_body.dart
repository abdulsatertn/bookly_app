import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/constants_classes.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(
            height: AppSizes.s40,
          ),
          Text(
            'Best Seller',
            style: Styles.textStyle18,
          ),
          SizedBox(height: AppSizes.s20),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.s125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.s8),
                color: Colors.red,
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetsData.testImage),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSizes.s30),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: const Text(
                  'Harry Potter and the globet of fire',
                  maxLines: 2,
                  style: Styles.textStyle20,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
