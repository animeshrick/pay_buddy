import 'package:flutter/material.dart';

import '../const/color_const.dart';
import '../extension/hex_color.dart';
import 'custom_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final Widget? leading;
  final double? elevation;

  CustomAppbar(
      {super.key,
      this.title = "",
      this.backgroundColor,
      this.actions,
      this.leading,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomTextEnum(title).textSM(),
      backgroundColor: backgroundColor ?? HexColor.fromHex(ColorConst.white),
      actions: actions,
      leading: leading,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
