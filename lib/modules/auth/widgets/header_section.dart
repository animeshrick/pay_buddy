import 'package:flutter/material.dart';
import 'package:pay_buddy/const/assets_const.dart';
import 'package:pay_buddy/widget/custom_image.dart';

import '../../../const/color_const.dart';
import '../../../extension/hex_color.dart';
import '../../../utils/text_utils.dart';
import '../../../widget/custom_text.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: HexColor.fromHex(ColorConst.lighter_baseHexColor),
            // child: Icon(
            //   LucideIcons.walletMinimal,
            //   color: HexColor.fromHex(ColorConst.baseHexColor),
            // ),
            child: CustomAssetImageView(path: AssetsConst.app_logo,height: 40,width: 40),
          ),
          CustomTextEnum(
            TextUtils.appTitle,
            color: HexColor.fromHex(ColorConst.white),
          ).textSemiboldXL(),
        ],
      ),
    );
  }
}
