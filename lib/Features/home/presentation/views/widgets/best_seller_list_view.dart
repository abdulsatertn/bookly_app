import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants_classes.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // shrinkWrap: true,       i used SliverFillRemaining so no need to make shrink true .. the app will be better
        physics:
            const NeverScrollableScrollPhysics(), //so i dont have two scrollable lists
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p10),
            child: BestSellerListViewItem(),
          );
        });
  }
}
