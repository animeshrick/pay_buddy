import 'package:flutter/material.dart';
import 'package:pay_buddy/extension/spacing.dart';

import '../../../../const/assets_const.dart';
import '../../../../const/color_const.dart';
import '../../../../extension/hex_color.dart';
import '../../../../utils/pop_up_items.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/custom_image.dart';
import '../../../../widget/custom_text.dart';

class FriendRequestItem extends StatelessWidget {
  final bool? isReceivedRequest;

  const FriendRequestItem({super.key, this.isReceivedRequest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAssetImageView(
            path: AssetsConst.app_logo,
            height: 40,
            width: 40,
          ),
          20.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextEnum(
                'Prianka Khatun',
                color: HexColor.fromHex(ColorConst.white),
              ).textSemiboldMD(),
              4.ph,
              if (isReceivedRequest == true) ...[
                Row(
                  children: [
                    CustomGOEButton(
                        borderColor: HexColor.fromHex(ColorConst.gray500),
                        child: CustomTextEnum("Accept", color: Colors.white)
                            .textSM(),
                        onPressed: () {}),
                    8.pw,
                    CustomGOEButton(
                        borderColor: HexColor.fromHex(ColorConst.gray500),
                        child: CustomTextEnum("Remove", color: Colors.white)
                            .textSM(),
                        onPressed: () {
                          PopUpItems().cupertinoPopup(
                              title: "Remove Friend Request",
                              content:
                                  "Are you sure, you don't want Animesh as a friend?",
                              cancelBtnPresses: () {},
                              okBtnPressed: () {});
                        }),
                  ],
                ),
              ]
            ],
          ),
          if (isReceivedRequest == false) ...[
            Spacer(),
            CustomGOEButton(
                borderColor: HexColor.fromHex(ColorConst.gray500),
                child: CustomTextEnum("Remove", color: Colors.white).textSM(),
                onPressed: () {
                  PopUpItems().cupertinoPopup(
                      title: "Remove Friend Request",
                      content:
                          "Are you sure, you don't want Animesh as a friend?",
                      cancelBtnPresses: () {},
                      okBtnPressed: () {});
                })
          ],
        ],
      ),
    );
  }
}
