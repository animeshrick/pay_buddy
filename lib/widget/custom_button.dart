import 'package:flutter/material.dart';

import '../const/color_const.dart';
import '../extension/hex_color.dart';
import '../extension/sizing.dart';
import '../widget/custom_text.dart';

Widget customElevatedButton(
        {required Widget? child,
        required void Function()? onPressed,
        Color? color,
        Size? minimumSize = const Size(88, 36),
        double? radius,
        Gradient? gradient}) =>
    gradient != null
        ? DecoratedBox(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 16)),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                minimumSize: minimumSize,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius ?? 16)),
                ),
              ),
              onPressed: onPressed,
              child: child,
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              surfaceTintColor: Colors.transparent,
              minimumSize: minimumSize,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: radius != null
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    )
                  : null,
            ),
            onPressed: onPressed,
            child: child,
          );

Widget customTextButton(
        {required Widget child, required void Function()? onPressed}) =>
    TextButton(
        style: TextButton.styleFrom(
          foregroundColor:
              HexColor.fromHex(ColorConst.deepBlue).withOpacity(0.87),
          padding: const EdgeInsets.all(5.0),
        ),
        onPressed: onPressed,
        child: child);

Widget customIconButton(
        {required Widget icon, required void Function()? onPressed}) =>
    IconButton(
      icon: icon,
      onPressed: onPressed,
    );

Widget customOutLineButton({
  required void Function() onPressed,
  Widget? child,
  Color? borderColor,
  Color? backGroundColor,
  double? radius,
  Size? minimumSize = const Size(88, 36),
}) =>
    OutlinedButton(
      style: OutlinedButton.styleFrom(
          minimumSize: minimumSize,
          shape: radius != null
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                )
              : null,
          side: borderColor != null ? BorderSide(color: borderColor) : null,
          backgroundColor: backGroundColor),
      onPressed: onPressed,
      child: child,
    );


Widget genderButton(
        {required String title,
        required String assetName,
        required void Function() onTap,
        required bool isSelected}) =>
    InkWell(
      onTap: onTap,
      child: Column(
        children: [
          customText(title,
              color: HexColor.fromHex(ColorConst.primaryDark), size: 14.fs),
          Image.asset(
            assetName,
            height: 48.fs,
            width: 48.fs,
            color: isSelected
                ? HexColor.fromHex(ColorConst.baseHexColor)
                : Colors.grey,
          ),
        ],
      ),
    );
