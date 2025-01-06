import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/const/assets_const.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/utils/screen_utils.dart';
import 'package:pay_buddy/widget/custom_button.dart';
import 'package:pay_buddy/widget/custom_image.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/custom_ui.dart';

class SearchFriendItem extends StatelessWidget {
  bool alreadySentRequest = false;
  bool isFriend = true;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAssetImageView(path: AssetsConst.app_logo, height: 50),
                16.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomTextEnum("Animesh").textMediumSM(),
                        4.pw,
                        CustomTextEnum(" (You are friends)").textXS(),
                        8.pw,
                        if (isFriend == true) ...[
                          Icon(
                            LucideIcons.contactRound,
                            size: 16,
                            color: HexColor.fromHex(ColorConst.light_green),
                          ),
                        ],
                      ],
                    ),
                    8.ph,
                    alreadySentRequest == true
                        ? CustomGOEButton(
                            size: Size(ScreenUtils.aw * 0.7, 35),
                            radius: 6,
                            backGroundColor:
                                HexColor.fromHex(ColorConst.gray200),
                            onPressed: () {},
                            child: Center(
                              child: CustomTextEnum("Cancel Request",
                                      color: HexColor.fromHex(
                                          ColorConst.primaryDark))
                                  .textSM(),
                            ))
                        : CustomGOEButton(
                            size: Size(ScreenUtils.aw * 0.7, 35),
                            radius: 6,
                            backGroundColor: HexColor.fromHex(
                                ColorConst.lighter_baseHexColor),
                            onPressed: () {},
                            child: Center(
                              child: CustomTextEnum("Add Friend",
                                      color: HexColor.fromHex(
                                          ColorConst.baseHexColor))
                                  .textSM(),
                            )),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
