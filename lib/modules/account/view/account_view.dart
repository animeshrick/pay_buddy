import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/widget/custom_button.dart';
import 'package:pay_buddy/widget/custom_image.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/custom_ui.dart';

import '../../../const/assets_const.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer(
          color: HexColor.fromHex(ColorConst.lighter_baseHexColor),
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircularProfileImage(
                    assetImage: AssetsConst.profile_image,
                    radius: 25,
                  ),
                  16.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextEnum("Animesh Banerjee",
                          color: HexColor.fromHex(ColorConst.primaryDark))
                          .textMediumSM(),
                      CustomTextEnum("abc@gmail.com",
                          color: HexColor.fromHex(ColorConst.gray500))
                          .textSM(),
                    ],
                  ),
                ],
              ),
              CustomGOEButton(
                  borderColor: HexColor.fromHex(ColorConst.white),
                  size: const Size(82,35),
                  onPressed: () {},
                  child: Row(
                    children: [
                      CustomTextEnum("Edit").textSM(),
                      8.pw,
                      Icon(LucideIcons.pen,
                          size: 16,
                          color: HexColor.fromHex(ColorConst.primaryDark))
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
