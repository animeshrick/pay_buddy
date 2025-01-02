import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/const/assets_const.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/modules/group/view/empty_group_view.dart';
import 'package:pay_buddy/router/custom_router/custom_route.dart';
import 'package:pay_buddy/router/router_name.dart';
import 'package:pay_buddy/widget/custom_image.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/custom_ui.dart';

import '../../../utils/screen_utils.dart';
import '../../../widget/custom_button.dart';

class GroupView extends StatelessWidget {
  List group = [1, 2];

  GroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextEnum("You are all settled up!").textLG(),
                CustomIconButton(
                    icon: const Icon(LucideIcons.slidersHorizontal),
                    onPressed: () {}),
              ],
            ),
          ),
          16.ph,
          group.isEmpty
              ? const EmptyGroupView()
              : Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, __) => Divider(
                        height: 0.2,
                        thickness: 0.2,
                        color: HexColor.fromHex(ColorConst.baseHexColor)),
                    itemCount: group.length,
                    itemBuilder: (_, int index) {
                      return CustomContainer(
                        color:
                            HexColor.fromHex(ColorConst.lighter_baseHexColor),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomAssetImageView(
                                  path: AssetsConst.app_logo,
                                  height: 40,
                                  width: 40,
                                ),
                                16.pw,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextEnum(
                                      'Group Name',
                                      color: HexColor.fromHex(
                                          ColorConst.baseHexColor),
                                    ).textSemiboldMD(),
                                    CustomTextEnum(
                                      'Group Bio',
                                      color: Colors.black,
                                    ).textMediumXS(),
                                  ],
                                ),
                              ],
                            ),
                            CustomIconButton(
                                icon: Icon(
                                  LucideIcons.settings,
                                  size: 24,
                                  color:
                                      HexColor.fromHex(ColorConst.baseHexColor),
                                ),
                                onPressed: () {
                                  CustomRoute().goto(RouteName.groupSettings);
                                })
                          ],
                        ),
                      );
                    },
                  ),
                ),
          16.ph,
          CustomContainer(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: CustomGOEButton(
              radius: 6,
              size: Size(ScreenUtils.aw, 38),
              backGroundColor: HexColor.fromHex(ColorConst.baseHexColor),
              onPressed: () {},
              child: CustomTextEnum(
                "Add a new Group",
                color: HexColor.fromHex(ColorConst.white),
              ).textSM(),
            ),
          ),
        ],
      ),
    );
  }
}
