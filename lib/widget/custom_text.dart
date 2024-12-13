import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customizeTextStyle(
    {FontWeight? fontWeight,
    double? fontSize,
    Color? fontColor,
    TextDecoration? decoration,
    Color? decorationColor,
    double? height,
    Color? backgroundColor,
    FontStyle? fontStyle,
    double? wordSpacing = 0,
    double? letterSpacing = 0}) {
  return GoogleFonts.inter(
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontWeight: fontWeight,
      wordSpacing: wordSpacing,
      color: fontColor,
      fontSize: fontSize,
      decorationColor: decorationColor,
      height: height,
      backgroundColor: backgroundColor,
      fontStyle: fontStyle);
}

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextDecoration? decoration;
  final bool lineGapNeeded;
  final TextAlign? textAlign;
  final Color? backGroundColor;
  final FontStyle? fontStyle;

  const CustomText(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.fontWeight,
    this.maxLines,
    this.decoration,
    this.lineGapNeeded = false,
    this.textAlign,
    this.backGroundColor,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: customizeTextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          fontColor: color,
          height: lineGapNeeded == true
              ? 1.8
              : kIsWeb
                  ? 1.2
                  : 0.0,
          decoration: decoration,
          backgroundColor: backGroundColor,
          decorationColor: color,
          fontStyle: fontStyle),
    );
  }
}

/// A class that provides various text styles for custom text widgets.
///
/// The [CustomTextEnum] class allows you to create text widgets with
/// predefined styles, such as font size and weight, color, and other
/// text decorations.
class CustomTextEnum {
  Color? _color;
  int? _maxLines;
  TextDecoration? _decoration;
  bool? _lineGapNeeded;
  TextAlign? _textAlign;
  Color? _backGroundColor;
  String? _text;
  TextOverflow? _overflow;

  /// Creates a [CustomTextEnum] instance with the provided text and optional
  /// styling properties.
  ///
  /// The [text] parameter is required, while other parameters like [color],
  /// [maxLines], [decoration], [lineGapNeeded], [textAlign], and
  /// [backGroundColor] are optional.
  CustomTextEnum(String text,
      {Color? color,
      int? maxLines,
      TextDecoration? decoration,
      bool? lineGapNeeded,
      TextAlign? textAlign,
      Color? backGroundColor,
      TextOverflow? overflow}) {
    _text = text;
    _color = color;
    _maxLines = maxLines;
    _decoration = decoration;
    _lineGapNeeded = lineGapNeeded;
    _textAlign = textAlign;
    _backGroundColor = backGroundColor;
    _overflow = overflow;
  }

  /// Returns a [Text] widget with XXL size (72) and regular font weight.
  Text displayXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with XXL size (72) and medium font weight.
  Text displayMediumXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with XXL size (72) and semibold font weight.
  Text displaySemiboldXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XXL size (72) and bold font weight.
  Text displayBoldXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XL size (60) and regular font weight.
  Text displayXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with XL size (60) and medium font weight.
  Text displayMediumXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with XL size (60) and semibold font weight.
  Text displaySemiboldXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XL size (60) and bold font weight.
  Text displayBoldXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with LG size (48) and regular font weight.
  Text displayLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with LG size (48) and medium font weight.
  Text displayMediumLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with LG size (48) and semibold font weight.
  Text displaySemiboldLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with LG size (48) and bold font weight.
  Text displayBoldLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with MD size (36) and regular font weight.
  Text displayMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with MD size (36) and medium font weight.
  Text displayMediumMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with MD size (36) and semibold font weight.
  Text displaySemiboldMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with MD size (36) and bold font weight.
  Text displayBoldMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with SM size (30) and regular font weight.
  Text displaySM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with SM size (30) and medium font weight.
  Text displayMediumSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with SM size (30) and semibold font weight.
  Text displaySemiboldSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with SM size (30) and bold font weight.
  Text displayBoldSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XS size (24) and regular font weight.
  Text displayXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with XS size (24) and medium font weight.
  Text displayMediumXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with XS size (24) and semibold font weight.
  Text displaySemiboldXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XS size (24) and bold font weight.
  Text displayBoldXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XL text size (20) and regular font weight.
  Text textXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with XL text size (20) and medium font weight.
  Text textMediumXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with XL text size (20) and semibold font weight.
  Text textSemiboldXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XL text size (20) and bold font weight.
  Text textBoldXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with LG text size (18) and regular font weight.
  Text textLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with LG text size (18) and medium font weight.
  Text textMediumLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with LG text size (18) and semibold font weight.
  Text textSemiboldLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with LG text size (18) and bold font weight.
  Text textBoldLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with MD text size (16) and regular font weight.
  Text textMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with MD text size (16) and medium font weight.
  Text textMediumMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with MD text size (16) and semibold font weight.
  Text textSemiboldMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with MD text size (16) and bold font weight.
  Text textBoldMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with SM text size (14) and regular font weight.
  Text textSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with SM text size (14) and medium font weight.
  Text textMediumSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with SM text size (14) and semibold font weight.
  Text textSemiboldSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with SM text size (14) and bold font weight.
  Text textBoldSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XS text size (12) and regular font weight.
  Text textXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Regular);

  /// Returns a [Text] widget with XS text size (12) and medium font weight.
  Text textMediumXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Medium);

  /// Returns a [Text] widget with XS text size (12) and semibold font weight.
  Text textSemiboldXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XS text size (12) and bold font weight.
  Text textBoldXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XS text size (12) and semibold font weight.
  Text textSemiboldXSM() =>
      _getData(size: 13, height: 18, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XS text size (15) and bold font weight.
  Text textBoldXMSM() =>
      _getData(size: 15, height: 18, fontWeight: FontWeightEnum.Bold);

  /// Returns a [Text] widget with XS text size (15) and bold font weight.
  Text textSemiboldXMSM() =>
      _getData(size: 15, height: 18, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [Text] widget with XS text size (10) and bold font weight.
  Text textBoldXXS() =>
      _getData(size: 10, height: 16, fontWeight: FontWeightEnum.Bold);

  /// Creates a [Text] widget with the provided size and font weight.
  ///
  /// The [size] parameter specifies the font size, while [fontWeight]
  /// specifies the weight of the font. Other styling properties are
  /// inherited from the [CustomTextEnum] instance.
  Text _getData(
          {required double size,
          required double height,
          FontWeight? fontWeight}) =>
      Text(_text!,
          maxLines: _maxLines,
          textAlign: _textAlign,
          overflow: _overflow,
          style: customizeTextStyle(
              fontWeight: fontWeight,
              fontSize: size,
              fontColor: _color,
              height: height / size,
              decoration: _decoration,
              backgroundColor: _backGroundColor,
              decorationColor: _color));
}

class CustomInkWellText extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;

  const CustomInkWellText(
    this.text, {
    super.key,
    this.onTap,
    this.color,
    this.size,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: onTap,
      child: Text(text,
          style: customizeTextStyle(
            fontWeight: fontWeight,
            fontSize: size,
            fontColor: color,
          )),
    );
  }
}

class CustomRichText extends StatelessWidget {
  final List<TextSpan> textSpanList;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;

  const CustomRichText({
    super.key,
    required this.textSpanList,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: textSpanList,
      ),
      overflow: overflow, // Handle text overflow
      maxLines: maxLines,
    );
  }
}

TextSpan customTextSpan({
  required String text,
  FontWeight? fontWeight,
  double? size,
  Color? color,
  TextDecoration? decoration,
  Color? decorationColor,
  double? height,
  Color? backgroundColor,
}) =>
    TextSpan(
        text: text,
        style: customizeTextStyle(
            fontWeight: fontWeight,
            fontSize: size,
            fontColor: color,
            decoration: decoration,
            decorationColor: decorationColor,
            height: height,
            backgroundColor: backgroundColor));

/// A class that provides various text styles for custom text spans.
///
/// The [CustomTextSpanEnum] class allows you to create text spans with
/// predefined styles, such as font size and weight, color, and other
/// text decorations.
class CustomTextSpanEnum {
  Color? _color;
  TextDecoration? _decoration;
  Color? _backGroundColor;
  String? _text;

  /// Creates a [CustomTextSpanEnum] instance with the provided text and optional
  /// styling properties.
  ///
  /// The [text] parameter is required, while other parameters like [color],
  /// [maxLines], [decoration], [lineGapNeeded], [textAlign], and
  /// [backGroundColor] are optional.
  CustomTextSpanEnum(
      {required String text,
      Color? color,
      TextDecoration? decoration,
      TextAlign? textAlign,
      Color? backGroundColor}) {
    _text = text;
    _color = color;
    _decoration = decoration;
    _backGroundColor = backGroundColor;
  }

  /// Returns a [TextSpan] with XXL size (72) and regular font weight.
  TextSpan displayXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with XXL size (72) and medium font weight.
  TextSpan displayMediumXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with XXL size (72) and semibold font weight.
  TextSpan displaySemiboldXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XXL size (72) and bold font weight.
  TextSpan displayBoldXXL() =>
      _getData(size: 72, height: 90, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with XL size (60) and regular font weight.
  TextSpan displayXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with XL size (60) and medium font weight.
  TextSpan displayMediumXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with XL size (60) and semibold font weight.
  TextSpan displaySemiboldXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XL size (60) and bold font weight.
  TextSpan displayBoldXL() =>
      _getData(size: 60, height: 72, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with LG size (48) and regular font weight.
  TextSpan displayLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with LG size (48) and medium font weight.
  TextSpan displayMediumLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with LG size (48) and semibold font weight.
  TextSpan displaySemiboldLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with LG size (48) and bold font weight.
  TextSpan displayBoldLG() =>
      _getData(size: 48, height: 60, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with MD size (36) and regular font weight.
  TextSpan displayMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with MD size (36) and medium font weight.
  TextSpan displayMediumMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with MD size (36) and semibold font weight.
  TextSpan displaySemiboldMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with MD size (36) and bold font weight.
  TextSpan displayBoldMD() =>
      _getData(size: 36, height: 44, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with SM size (30) and regular font weight.
  TextSpan displaySM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with SM size (30) and medium font weight.
  TextSpan displayMediumSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with SM size (30) and semibold font weight.
  TextSpan displaySemiboldSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with SM size (30) and bold font weight.
  TextSpan displayBoldSM() =>
      _getData(size: 30, height: 38, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with XS size (24) and regular font weight.
  TextSpan displayXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with XS size (24) and medium font weight.
  TextSpan displayMediumXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with XS size (24) and semibold font weight.
  TextSpan displaySemiboldXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XS size (24) and bold font weight.
  TextSpan displayBoldXS() =>
      _getData(size: 24, height: 32, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with XL text size (20) and regular font weight.
  TextSpan textXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with XL text size (20) and medium font weight.
  TextSpan textMediumXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with XL text size (20) and semibold font weight.
  TextSpan textSemiboldXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XL text size (20) and bold font weight.
  TextSpan textBoldXL() =>
      _getData(size: 20, height: 30, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with LG text size (18) and regular font weight.
  TextSpan textLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with LG text size (18) and medium font weight.
  TextSpan textMediumLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with LG text size (18) and semibold font weight.
  TextSpan textSemiboldLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with LG text size (18) and bold font weight.
  TextSpan textBoldLG() =>
      _getData(size: 18, height: 28, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with MD text size (16) and regular font weight.
  TextSpan textMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with MD text size (16) and medium font weight.
  TextSpan textMediumMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with MD text size (16) and semibold font weight.
  TextSpan textSemiboldMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with MD text size (16) and bold font weight.
  TextSpan textBoldMD() =>
      _getData(size: 16, height: 24, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] with SM text size (14) and regular font weight.
  TextSpan textSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with SM text size (14) and medium font weight.
  TextSpan textMediumSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with SM text size (14) and semibold font weight.
  TextSpan textSemiboldSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with SM text size (14) and bold font weight.
  TextSpan textBoldSM() =>
      _getData(size: 14, height: 20, fontWeight: FontWeightEnum.Bold);

  /// Returns a [TextSpan] widget with XS text size (12) and semibold font weight.
  TextSpan textSemiboldXSM() =>
      _getData(size: 13, height: 18, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XS text size (12) and regular font weight.
  TextSpan textXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Regular);

  /// Returns a [TextSpan] with XS text size (12) and medium font weight.
  TextSpan textMediumXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Medium);

  /// Returns a [TextSpan] with XS text size (12) and semibold font weight.
  TextSpan textSemiboldXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Semibold);

  /// Returns a [TextSpan] with XS text size (12) and bold font weight.
  TextSpan textBoldXS() =>
      _getData(size: 12, height: 18, fontWeight: FontWeightEnum.Bold);

  /// Creates a [TextSpan] with the provided size and font weight.
  ///
  /// The [size] parameter specifies the font size, while [fontWeight]
  /// specifies the weight of the font. Other styling properties are
  /// inherited from the [CustomTextSpanEnum] instance.
  TextSpan _getData(
          {required double size,
          required double height,
          FontWeight? fontWeight}) =>
      TextSpan(
        text: _text,
        style: customizeTextStyle(
          fontSize: size,
          fontColor: _color,
          fontWeight: fontWeight,
          decoration: _decoration,
          backgroundColor: _backGroundColor,
          height: height / size,
        ),
      );
}

class CustomOverflowText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const CustomOverflowText(
    this.text, {
    super.key,
    this.size,
    this.color,
    this.fontWeight,
    this.maxLines = 2,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow ?? TextOverflow.ellipsis,
        textAlign: textAlign,
        maxLines: maxLines,
        style: customizeTextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          fontColor: color,
        ));
  }
}

class CustomHtmlText extends StatelessWidget {
  final String html;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextDecoration? decoration;
  final bool lineGapNeeded;

  final Color? backGroundColor;

  const CustomHtmlText(
    this.html, {
    super.key,
    this.color,
    this.size,
    this.fontWeight,
    this.maxLines,
    this.decoration,
    this.lineGapNeeded = false,
    this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      html,
      textStyle: customizeTextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          fontColor: color,
          height: lineGapNeeded == true
              ? 1.8
              : kIsWeb
                  ? 1.2
                  : 0.0,
          decoration: decoration,
          backgroundColor: backGroundColor,
          decorationColor: color),
      onTapUrl: (url) async {
        /*await OpenService()
            .openUrl(uri: Uri.parse(url), mode: LaunchMode.inAppWebView);*/
        return true;
      },
    );
  }
}

class FontWeightEnum {
  static FontWeight Regular = FontWeight.w400;
  static FontWeight Medium = FontWeight.w500;
  static FontWeight Semibold = FontWeight.w600;
  static FontWeight Bold = FontWeight.w700;
}
