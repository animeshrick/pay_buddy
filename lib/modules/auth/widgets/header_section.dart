import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../const/color_const.dart';
import '../../../extension/hex_color.dart';
import '../../../utils/text_utils.dart';
import '../../../widget/custom_text.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: HexColor.fromHex(ColorConst.lighter_baseHexColor),
            child: Icon(
              LucideIcons.walletMinimal,
              color: HexColor.fromHex(ColorConst.baseHexColor),
            ),
          ),
          CustomTextEnum(
            TextUtils.appTitle,
            color: HexColor.fromHex(ColorConst.baseHexColor),
          ).textMediumSM(),
        ],
      ),
    );
  }
}
