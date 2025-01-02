import 'package:pay_buddy/extension/spacing.dart';
import 'package:flutter/material.dart';
import '../../../const/color_const.dart';
import '../../../extension/hex_color.dart';
import '../../../utils/text_utils.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_ui.dart';

class LandingWidget {
  Widget drawerNavigationRail(
          {required void Function(int value) chooseIndex,
          bool? withTitle,
          int? selectedIndex}) =>
      Container(
        padding: withTitle == true
            ? const EdgeInsets.symmetric(horizontal: 50, vertical: 20)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.only(topRight: Radius.circular(16.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: HexColor.fromHex(ColorConst.grey4),
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                drawerNavigationRailList().length,
                (index) => InkWell(
                      onTap: () {
                        chooseIndex(index);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index == selectedIndex)
                            withTitle != true
                                ? CustomContainer(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    height: 44,
                                    width: 44,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 6),
                                    color: HexColor.fromHex(
                                        ColorConst.baseHexColor),
                                    child: drawerNavigationRailList(
                                            showTitle: withTitle == true,
                                            color: Colors.white)
                                        .elementAt(index),
                                  )
                                : CustomContainer(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    height: 44,
                                    width: 172,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22, vertical: 6),
                                    color: HexColor.fromHex(
                                        ColorConst.baseHexColor),
                                    child: drawerNavigationRailList(
                                            showTitle: withTitle == true,
                                            color: Colors.white)
                                        .elementAt(index),
                                  )
                          else
                            drawerNavigationRailList(
                                    showTitle: withTitle == true)
                                .elementAt(index),
                          if (index != (drawerNavigationRailList().length - 1))
                            30.ph,
                        ],
                      ),
                    ))),
      );

  List<Widget> drawerNavigationRailList({bool? showTitle, Color? color}) => [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.home,
              color: color ?? HexColor.fromHex(ColorConst.grey),
            ),
            if (showTitle == true)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(TextUtils.dashboard,
                    color: color ?? HexColor.fromHex(ColorConst.primaryDark)),
              )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.settings,
              color: color ?? HexColor.fromHex(ColorConst.grey),
            ),
            if (showTitle == true)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(TextUtils.settings,
                    color: color ?? HexColor.fromHex(ColorConst.primaryDark)),
              )
          ],
        ),
      ];
}
