import 'package:flutter/material.dart';
import 'package:pay_buddy/extension/spacing.dart';

import '../const/color_const.dart';
import '../extension/hex_color.dart';
import '../utils/screen_utils.dart';
import '../utils/text_utils.dart';
import 'custom_image.dart';
import 'custom_text.dart';

class NoDataFound extends StatelessWidget {
  final String? msg;
  final Widget? widget;

  const NoDataFound({super.key, this.msg, this.widget});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: ScreenUtils.aw,
        child: Column(
          children: [
            30.ph,
            const CustomSvgAssetImageView(
              path: "AssetsConst.noRecordFound",
              // allowDrawingOutsideViewBox: true,
            ),
            16.ph,
            CustomText(msg ?? "TextUtils.noResult",
                color: HexColor.fromHex(ColorConst.gray500), size: 20),
            if (widget != null) ...[5.ph, widget!],
          ],
        ),
      ),
    );
  }
}
