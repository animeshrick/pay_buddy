import 'package:flutter/material.dart';

import 'custom_image.dart';

//ignore: must_be_immutable
class InitWidget extends StatelessWidget {
  InitWidget(
      {super.key,
      this.height = 300,
      this.width = 300,
      this.backgroundColor = Colors.transparent});

  double width;
  double height;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: width,
      height: height,
      child: CustomAssetImageView(
        path: "AssetsConst.ssNoImageLogo",
        height: 60,
        width: 60,
      ),
    );
  }
}
