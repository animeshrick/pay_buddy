
import 'package:flutter/material.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/widget/custom_image.dart';
import 'package:pay_buddy/widget/custom_text.dart';


class EmptyGroupView extends StatelessWidget {
  const EmptyGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          const CustomAssetImageView(
            path: "assets/images/no_group_image.jpg",
            height: 250,
          ),
          16.ph,
          CustomTextEnum("No groups to show.").textLG(),
        ],
      ),
    );
  }
}
