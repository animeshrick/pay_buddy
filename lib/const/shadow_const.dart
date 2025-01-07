import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../extension/hex_color.dart';
import 'color_const.dart';

class ShadowConst {
  static List<BoxShadow> shadowXS = [
    BoxShadow(
      blurRadius: 2,
      offset: const Offset(0, 1),
      blurStyle: BlurStyle.outer,
      color: HexColor.fromHex(ColorConst.shadowColor),
    )
  ];
  static List<BoxShadow> shadowXSUP = [
    BoxShadow(
      blurRadius: 2,
      offset: const Offset(0, -1),
      blurStyle: BlurStyle.outer,
      color: HexColor.fromHex(ColorConst.shadowColor),
    )
  ];

  static List<BoxShadow> shadowSM = [
    BoxShadow(
      blurRadius: 2,
      offset: const Offset(0, 1),
      blurStyle: BlurStyle.outer,
      color: HexColor.fromHex(ColorConst.shadowColor),
    ),
    BoxShadow(
      blurRadius: 3,
      offset: const Offset(0, 1),
      blurStyle: BlurStyle.outer,
      color: HexColor.fromHex(ColorConst.shadowColor),
    ),
  ];
  static List<BoxShadow> shadowSMUP = [
    BoxShadow(
      blurRadius: 2,
      offset: const Offset(0, -1),
      blurStyle: BlurStyle.outer,
      color: HexColor.fromHex(ColorConst.shadowColor),
    ),
    BoxShadow(
      blurRadius: 3,
      offset: const Offset(0, -1),
      blurStyle: BlurStyle.outer,
      color: HexColor.fromHex(ColorConst.shadowColor),
    ),
  ];

  static List<BoxShadow> shadowMD = [
    BoxShadow(
        blurRadius: 4,
        spreadRadius: -2,
        offset: const Offset(0, 2),
        color: HexColor.fromHex(ColorConst.shadowColor)),
    BoxShadow(
        blurRadius: 8,
        spreadRadius: -2,
        offset: const Offset(0, 4),
        color: HexColor.fromHex(ColorConst.shadowColor)),
  ];

  static List<BoxShadow> shadowLG = [
    BoxShadow(
        blurRadius: 6,
        spreadRadius: -2,
        offset: const Offset(0, 4),
        color: HexColor.fromHex(ColorConst.shadowColor)),
    BoxShadow(
        blurRadius: 16,
        spreadRadius: -4,
        offset: const Offset(0, 12),
        color: HexColor.fromHex(ColorConst.shadowColor)),
  ];

  static List<BoxShadow> shadowXL = [
    BoxShadow(
        blurRadius: 8,
        spreadRadius: -4,
        offset: const Offset(0, 8),
        color: HexColor.fromHex(ColorConst.shadowColor)),
    BoxShadow(
        blurRadius: 24,
        spreadRadius: -4,
        offset: const Offset(0, 20),
        color: HexColor.fromHex(ColorConst.shadowColor)),
  ];
  static List<BoxShadow> shadowSS = [
    BoxShadow(
      blurRadius: 8,
      blurStyle: BlurStyle.outer,
      color: HexColor.fromHex(ColorConst.shadowColor2).withOpacity(0.1),
    )
  ];
  static List<BoxShadow> shadowSP = [
    BoxShadow(
      color: HexColor.fromHex(ColorConst.shadowColor2).withOpacity(0.2),
      blurRadius: 0.2,
      offset: const Offset(0, 0),
      spreadRadius: 0,
    )
  ];
  static List<BoxShadow> shadowSPDark = [
    BoxShadow(
      color: HexColor.fromHex(ColorConst.shadowColor2).withOpacity(0.4),
      blurRadius: 0.2,
      offset: const Offset(0, 0),
      spreadRadius: 0,
    )
  ];
  static List<BoxShadow> shadowSMP = [
    BoxShadow(
      color: HexColor.fromHex(ColorConst.shadowColor2).withOpacity(0.32),
      blurRadius: 1,
      offset: const Offset(0, 0),
      spreadRadius: 0,
    )
  ];
  static List<BoxShadow> shadowSB = [
    BoxShadow(
      color: HexColor.fromHex(ColorConst.shadowColor2).withOpacity(0.08),
      blurRadius: 8,
      offset: const Offset(0, 2),
      spreadRadius: 0,
    )
  ];
  static List<BoxShadow> shadowSBS = [
    BoxShadow(
      color: HexColor.fromHex(ColorConst.shadowColor2).withOpacity(0.24),
      blurRadius: 4,
      offset: const Offset(0, 0),
      spreadRadius: 0,
    )
  ];
  static List<BoxShadow> shadowSSS = [
    BoxShadow(
      color: HexColor.fromHex(ColorConst.shadowColor2).withOpacity(0.10),
      blurRadius: 8,
      offset: const Offset(0, 0),
      spreadRadius: 0,
    )
  ];
}
